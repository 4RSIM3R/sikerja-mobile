import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/common/widgets/app_error_widget.dart';
import 'package:next_starter/common/widgets/loading_indicator_widget.dart';
import 'package:next_starter/common/widgets/row_loading_widget.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/card/activity_card.dart';
import 'package:next_starter/presentation/pages/activity/list/bloc/activity_list_bloc.dart';

class ActivityListPage extends StatefulWidget {
  static const path = "/activity-list";

  const ActivityListPage({super.key});

  @override
  State<ActivityListPage> createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {
  final activity = locator<ActivityListBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    activity.add(ActivityListFetch());
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
    if (_isBottom) activity.add(ActivityListFetch());
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
        BlocProvider(create: (_) => activity),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('List Kegiatan'),
        ),
        body: BlocBuilder<ActivityListBloc, ActivityListState>(
          builder: (context, state) {
            switch (state.status) {
              case ActivityListStatus.failure:
                return AppErrorWidget(
                  message: state.errorMessage,
                  onTap: () {
                    activity.add(ActivityListFetch());
                  },
                );
              case ActivityListStatus.success:
                if (state.activities.isEmpty) {
                  return const Center(child: Text('no activities'));
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    return i >= state.activities.length ? const RowLoadingWidget() : ActivityCard(model: state.activities[i]);
                  },
                  itemCount: state.hasReachedMax ? state.activities.length : state.activities.length + 1,
                  controller: _scrollController,
                );
              case ActivityListStatus.initial:
                return const LoadingIndicatorWidget();
            }
          },
        ),
      ),
    );
  }
}
