import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:next_starter/common/extensions/context_extension.dart';
import 'package:next_starter/common/extensions/widget_extension.dart';
import 'package:next_starter/common/widgets/app_error_widget.dart';
import 'package:next_starter/common/widgets/loading_indicator_widget.dart';
import 'package:next_starter/common/widgets/row_loading_widget.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/card/activity_card.dart';
import 'package:next_starter/presentation/pages/activity/form/activity_form_page.dart';
import 'package:next_starter/presentation/pages/activity/list/bloc/activity_list_bloc.dart';
import 'package:next_starter/presentation/theme/theme.dart';

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
            onPressed: () {
              context.route.pop();
            },
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
                } else {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: ColorTheme.primary.withOpacity(0.3),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.info,
                              size: 24,
                              color: ColorTheme.primary,
                            ),
                            4.horizontalSpace,
                            Text(
                              'Jangan lupa untuk lengkapi eviden pada kegiatan yang sedang berlangsung',
                              style: CustomTextTheme.paragraph1.copyWith(color: ColorTheme.primary),
                            ).expand(),
                          ],
                        ),
                      ),
                      ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int i) {
                          return i >= state.activities.length
                              ? const RowLoadingWidget()
                              : ActivityCard(model: state.activities[i]);
                        },
                        itemCount: state.hasReachedMax ? state.activities.length : state.activities.length + 1,
                        controller: _scrollController,
                      ).expand(),
                    ],
                  );
                }

              case ActivityListStatus.initial:
                return const LoadingIndicatorWidget();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.route.pushNamed(ActivityFormPage.path);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
