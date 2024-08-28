import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import 'package:next_starter/common/constant/ui_constant.dart';
import 'package:next_starter/common/extensions/context_extension.dart';
import 'package:next_starter/injection.dart';
import 'package:next_starter/presentation/components/components.dart';
import 'package:next_starter/presentation/pages/activity/form/bloc/activity_form_bloc.dart';
import 'package:next_starter/presentation/pages/activity/form/bloc/activity_form_state.dart';
import 'package:next_starter/presentation/pages/home/home_page.dart';
import 'package:next_starter/presentation/theme/theme.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ActivityFormPage extends StatefulWidget {
  const ActivityFormPage({super.key});

  static const String path = '/activity/form';

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  final bloc = locator<ActivityFormBloc>();

  final form = fb.group({
    'report_period_start': FormControl<DateTime>(validators: [Validators.required]),
    'report_period_end': FormControl<DateTime>(validators: [Validators.required]),
    'execution_task': FormControl<String>(validators: [Validators.required]),
    'result_plan': FormControl<String>(validators: [Validators.required]),
    'action_plan': FormControl<String>(validators: [Validators.required]),
    'output': FormControl<String>(validators: [Validators.required]),
    'budget': [],
    'budget_source': [],
  });

  final controller = MultiSelectController<int>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: BlocListener<ActivityFormBloc, ActivityFormState>(
        listener: (context, state) {
          if (state is ActivityFormFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }

          if (state is ActivityFormSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data berhasil disimpan'),
              ),
            );
            context.route.pushReplacementNamed(HomePage.path);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Form Kegiatan'),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ReactiveFormBuilder(
              form: () => form,
              builder: (context, formGroup, child) {
                return Column(
                  children: [
                    const TextInput(
                      title: 'Pelaksana Tugas',
                      formControlName: 'execution_task',
                      hint: '',
                    ),
                    8.verticalSpace,
                    const TextInput(
                      title: 'Rencana Hasil Kerja',
                      formControlName: 'result_plan',
                      hint: '',
                    ),
                    8.verticalSpace,
                    const TextInput(
                      title: 'Rencana Aksi',
                      formControlName: 'action_plan',
                      hint: '',
                    ),
                    8.verticalSpace,
                    const TextInput(
                      title: 'Output',
                      formControlName: 'output',
                      hint: '',
                    ),
                    8.verticalSpace,
                    const TextInput(
                      title: 'Jumlah Anggaran',
                      formControlName: 'budget',
                      hint: '',
                    ),
                    8.verticalSpace,
                    const TextInput(
                      title: 'Sumber Anggaran',
                      formControlName: 'budget_source',
                      hint: '',
                    ),
                    8.verticalSpace,
                    MultiDropdown<int>(
                      items: employees,
                      controller: controller,
                      enabled: true,
                      searchEnabled: true,
                      chipDecoration: const ChipDecoration(
                        backgroundColor: Colors.yellow,
                        wrap: true,
                        runSpacing: 2,
                        spacing: 10,
                      ),
                      fieldDecoration: FieldDecoration(
                        hintText: 'Pegawai',
                        hintStyle: CustomTextTheme.paragraph1,
                        prefixIcon: const Icon(CupertinoIcons.flag),
                        showClearIcon: false,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black87),
                        ),
                      ),
                      dropdownDecoration: const DropdownDecoration(
                        marginTop: 2,
                        maxHeight: 500,
                        header: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Pilih pegawai',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      dropdownItemDecoration: DropdownItemDecoration(
                        selectedIcon: const Icon(Icons.check_box, color: Colors.green),
                        disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a employee';
                        }
                        return null;
                      },
                      onSelectionChange: (selectedItems) {
                        debugPrint("OnSelectionChange: $selectedItems");
                      },
                    ),
                    ReactiveFormConsumer(
                      builder: (context, formGroup, child) {
                        return PrimaryButton(
                          title: 'Submit',
                          isEnable: formGroup.valid,
                          onTap: () {},
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
