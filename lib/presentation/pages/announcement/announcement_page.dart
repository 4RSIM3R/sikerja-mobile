import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/common/widgets/app_error_widget.dart';
import 'package:next_starter/common/widgets/loading_indicator_widget.dart';
import 'package:next_starter/common/widgets/row_loading_widget.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/card/announcement_card.dart';
import 'package:next_starter/presentation/pages/announcement/bloc/announcement_bloc.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  static const path = "/announcement";

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  final bloc = locator<AnnouncementBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(AnnouncementFetch());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) bloc.add(AnnouncementFetch());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Berita"),
        ),
        body: BlocBuilder<AnnouncementBloc, AnnouncementState>(
          builder: (context, state) {
            switch (state.status) {
              case AnnouncementStatus.failure:
                return AppErrorWidget(
                  message: state.errorMessage,
                  onTap: () {
                    bloc.add(AnnouncementFetch());
                  },
                );
              case AnnouncementStatus.success:
                if (state.announcements.isEmpty) {
                  return const Center(child: Text('no announcements'));
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    return i >= state.announcements.length
                        ? const RowLoadingWidget()
                        : AnnouncementCard(model: state.announcements[i]);
                  },
                  itemCount: state.hasReachedMax ? state.announcements.length : state.announcements.length + 1,
                  controller: _scrollController,
                );
              case AnnouncementStatus.initial:
                return const LoadingIndicatorWidget();
            }
          },
        ),
      ),
    );
  }
}
