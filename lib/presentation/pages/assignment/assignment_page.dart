import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/common/widgets/app_error_widget.dart';
import 'package:next_starter/common/widgets/loading_indicator_widget.dart';
import 'package:next_starter/common/widgets/row_loading_widget.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/card/assignment_card.dart';
import 'package:next_starter/presentation/pages/assignment/bloc/assignment_bloc.dart';

class AssignmentPage extends StatefulWidget {
  const AssignmentPage({super.key});

  static const path = '/assignment';

  @override
  State<AssignmentPage> createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  final bloc = locator<AssignmentBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    bloc.add(AssignmentFetch());
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
    if (_isBottom) bloc.add(AssignmentFetch());
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
        appBar: AppBar(title: const Text('Surat Tugas')),
        body: BlocBuilder<AssignmentBloc, AssignmentState>(
          builder: (context, state) {
            switch (state.status) {
              case AssignmentStatus.failure:
                return AppErrorWidget(
                  message: state.errorMessage,
                  onTap: () {
                    bloc.add(AssignmentFetch());
                  },
                );
              case AssignmentStatus.success:
                if (state.assignments.isEmpty) {
                  return const Center(child: Text('no Assignments'));
                }
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (BuildContext context, int i) {
                    return i >= state.assignments.length
                        ? const RowLoadingWidget()
                        : AssignmentCard(model: state.assignments[i]);
                  },
                  itemCount: state.hasReachedMax ? state.assignments.length : state.assignments.length + 1,
                  controller: _scrollController,
                );
              case AssignmentStatus.initial:
                return const LoadingIndicatorWidget();
            }
          },
        ),
      ),
    );
  }
}
