import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:next_starter/injection.dart';
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
      ),
      
    );
  }
}
