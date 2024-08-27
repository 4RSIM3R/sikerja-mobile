import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assignment')),
    );
  }
}
