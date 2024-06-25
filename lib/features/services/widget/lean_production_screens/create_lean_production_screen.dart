import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/core/widget/components/file_picker_custom/file_picker_custom_model.dart';
import 'package:hr_app_flutter/core/widget/components/file_picker_custom/file_picker_custom_widget.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_news_screen.dart';
import 'package:hr_app_flutter/features/services/bloc/lean_production_form_bloc/lean_production_form_bloc.dart';
import 'package:hr_app_flutter/features/services/model/lean_productions_entity/lean_production_form_entity/lean_production_form_entity.dart';
import 'package:hr_app_flutter/features/services/widget/lean_production_screens/create_lean_production_view_model.dart';
import 'package:hr_app_flutter/features/user/bloc/other_users_bloc/other_users_bloc.dart';
import 'package:octopus/octopus.dart';

class CreateLeanProductionScreen extends StatefulWidget {
  const CreateLeanProductionScreen({super.key});

  @override
  State<CreateLeanProductionScreen> createState() =>
      _CreateLeanProductionScreenState();
}

class _CreateLeanProductionScreenState
    extends State<CreateLeanProductionScreen> {
  final CreateLeanProductionViewModel _modelView =
      CreateLeanProductionViewModel();
  final _modelFilePicker = FilePickerCustomModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvaider<FilePickerCustomModel>(
      model: _modelFilePicker,
      child: ChangeNotifierProvaider<CreateLeanProductionViewModel>(
          model: _modelView,
          child: const BucketNavigator(bucket: 'create-lean-production')),
    );
  }
}

/// Select Executor Lean Production Screen

class SelectExecutorLeanProductionScreen extends StatefulWidget {
  const SelectExecutorLeanProductionScreen({super.key});

  @override
  State<SelectExecutorLeanProductionScreen> createState() =>
      _SelectExecutorLeanProductionScreenState();
}

class _SelectExecutorLeanProductionScreenState
    extends State<SelectExecutorLeanProductionScreen> {
  final List<TextEditingController> _executorsControllers = [
    TextEditingController()
  ];
  final List<TextEditingController> _executorsIdControllers = [
    TextEditingController()
  ];

  late final LeanProductionFormBloc blocLeanProductionForm;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    blocLeanProductionForm = LeanProductionFormBloc(
        repository: DependenciesScope.of(context).leanProductionRepository);

    super.initState();
  }

  void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> groupWidget = [];
    for (var i = 0; i < _executorsControllers.length; i++) {
      final widget = Padding(
        padding: EdgeInsets.only(top: i * 75.0),
        child: ImplementersInputWidget(
          nameController: _executorsControllers[i],
          idController: _executorsIdControllers[i],
        ),
      );

      final addWidget = Padding(
        padding: EdgeInsets.only(top: (i + 1) * 75.0),
        child: Column(
          children: [
            _executorsControllers.length < 3
                ? _ButtonChangeExecutorWidget(
                    text: '+ добавить еще исполнителя',
                    onPressed: addExecutor,
                  )
                : const SizedBox.shrink(),
            _executorsControllers.length > 1
                ? _ButtonChangeExecutorWidget(
                    text: '- удалить исполнителя',
                    onPressed: removeExecutor,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );

      if (groupWidget.length > 1) {
        groupWidget.removeLast();
      }
      groupWidget.add(widget);
      groupWidget.add(addWidget);
    }
    return Scaffold(
      appBar: const _AppBarForCreateLeanProduction(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                'Выберите исполнителя',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Stack(
                  children: [
                    ...groupWidget.reversed,
                  ],
                ),
              ),
            ),
            const Spacer(),
            BlocConsumer<LeanProductionFormBloc, LeanProductionFormState>(
                listener: (context, state) {
                  state.mapOrNull(
                    successful: (data) {
                      context.octopus.setState((state) =>
                          state..removeByName('create-lean-production'));
                    },
                    error: (data) {
                      showErrorSnackbar(context, data.message);
                    },
                  );
                },
                bloc: blocLeanProductionForm,
                builder: (context, state) {
                  if (state is LeanProductionFormState$Processing) {
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return ResumeButtonWidget(
                      title: 'Подать предложение',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final modelFielPikcer = ChangeNotifierProvaider.watch<
                              ChangeNotifierProvaider<FilePickerCustomModel>,
                              FilePickerCustomModel>(context);
                          final modelView = ChangeNotifierProvaider.watch<
                              ChangeNotifierProvaider<
                                  CreateLeanProductionViewModel>,
                              CreateLeanProductionViewModel>(context);

                          int firstImplementer = 0;
                          int secondImplementer = 0;
                          int thirdImplementer = 0;

                          _executorsIdControllers
                              .asMap()
                              .forEach((index, controller) {
                            switch (index) {
                              case 0:
                                if (controller.text != '') {
                                  firstImplementer = int.parse(controller.text);
                                }
                              case 1:
                                secondImplementer = int.parse(controller.text);
                              case 2:
                                thirdImplementer = int.parse(controller.text);
                            }
                          });
                          final formEntity = LeanProductionFormEntity(
                            firstImplementer: firstImplementer,
                            secondImplementer: secondImplementer,
                            thirdImplementer: thirdImplementer,
                            realized: modelView!.isImplemented!,
                            issue: modelView.problem!,
                            solution: modelView.solution!,
                            expenses: modelView.expenses!,
                            benefit: modelView.benefit!,
                            paths: modelFielPikcer?.paths
                                .whereType<String>()
                                .toList(),
                          );

                          blocLeanProductionForm.add(
                              LeanProductionFormEvent.submitForm(
                                  formEntity: formEntity));
                        }
                      },
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  void removeExecutor() {
    if (_executorsControllers.length > 1) {
      setState(() {
        _executorsControllers.removeLast();
        _executorsIdControllers.removeLast();
      });
    }
  }

  void addExecutor() {
    if (_executorsControllers.length < 3) {
      setState(() {
        _executorsControllers.add(TextEditingController());
        _executorsIdControllers.add(TextEditingController());
      });
    }
  }
}

class _ButtonChangeExecutorWidget extends StatelessWidget {
  const _ButtonChangeExecutorWidget(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xfff5f5f5),
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontSize: 15, color: Theme.of(context).colorScheme.outline),
        ),
      ),
    );
  }
}

class ImplementersInputWidget extends StatefulWidget {
  const ImplementersInputWidget({
    super.key,
    required TextEditingController nameController,
    required TextEditingController idController,
  })  : _idController = idController,
        _nameController = nameController;

  final TextEditingController _nameController;
  final TextEditingController _idController;

  @override
  _ImplementersInputWidgetState createState() =>
      _ImplementersInputWidgetState();
}

class _ImplementersInputWidgetState extends State<ImplementersInputWidget> {
  Timer? searchDebounce;
  final FocusNode focusNodeSearch = FocusNode();
  bool isFocus = false;
  final ScrollController _scrollController = ScrollController();

  TextEditingController get nameController => widget._nameController;
  TextEditingController get idController => widget._idController;

  late final OtherUsersBloc otherUsersBloc;

  @override
  void initState() {
    super.initState();
    otherUsersBloc =
        OtherUsersBloc(userRepo: DependenciesScope.of(context).userRepository);
    otherUsersBloc.add(const OtherUsersEvent.clearList());
  }

  @override
  void dispose() {
    otherUsersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherUsersBloc, OtherUsersState>(
        bloc: otherUsersBloc,
        builder: (context, state) {
          return Container(
            decoration: isFocus
                ? BoxDecoration(
                    boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 6,
                          blurRadius: 10,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white)
                : null,
            child: Column(
              children: [
                TextFormField(
                  onTap: () {
                    setState(() {
                      isFocus = true;
                    });
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText: 'Введите фамилию',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      searchDebounce?.cancel();
                      searchDebounce =
                          Timer(const Duration(milliseconds: 700), () {
                        otherUsersBloc
                            .add(OtherUsersEvent.findUsers(findText: value));
                      });
                    }
                  },
                ),
                if (state is OtherUsersState$Processing) ...[
                  const SizedBox.shrink(),
                ] else if (state is OtherUsersState$Error) ...[
                  const Center(child: Text('Пользователь не найден.')),
                ] else if (state is OtherUsersState$Idle ||
                    state is OtherUsersState$Successful) ...[
                  if (state.data != null) ...[
                    state.data!.isEmpty
                        ? const SizedBox.shrink()
                        : isFocus
                            ? Container(
                                constraints: const BoxConstraints(
                                    minHeight: 70, maxHeight: 240),
                                padding: const EdgeInsets.all(16.0),
                                width: double.infinity,
                                child: Scrollbar(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemExtent: 70,
                                    itemCount: state.data!.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          '${state.data![index].name} ${state.data![index].nameI} ${state.data![index].nameO}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        subtitle: Text(
                                          state.data![index].staffPosition,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  fontSize: 15,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .outline),
                                        ),
                                        onTap: () {
                                          nameController.text =
                                              '${state.data![index].name} ${state.data![index].nameI} ${state.data![index].nameO}';
                                          idController.text = state
                                              .data![index].autoCard
                                              .toString();
                                          setState(() {
                                            isFocus = false;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                  ] else ...[
                    const SizedBox.shrink()
                  ]
                ]
              ],
            ),
          );
        });
  }
}

/// Pick File Lean Production Screen
class PickFileLeanProduction extends StatefulWidget {
  const PickFileLeanProduction({super.key});

  @override
  State<PickFileLeanProduction> createState() => _PickFileLeanProductionState();
}

class _PickFileLeanProductionState extends State<PickFileLeanProduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBarForCreateLeanProduction(),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Прикрепите фаил',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ),
            const FilePickerWidget(),
            const Spacer(),
            ResumeButtonWidget(
              title: 'Продолжить',
              onPressed: () {
                // final modelFile = ChangeNotifierProvaider.read<
                //     ChangeNotifierProvaider<FilePickerCustomModel>,
                //     FilePickerCustomModel>(context);
                // if (modelFile == null || modelFile.paths.isEmpty) {
                //   return;
                // }
                context.octopus.setState((state) => state
                  ..findByName('create-lean-production')?.add(
                      Routes.selectorExecutorLeanProductionScreen.node()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Write Benefit Lean Production Screen

class WriteBenefitLeanProductionScreen extends StatefulWidget {
  const WriteBenefitLeanProductionScreen({super.key});

  @override
  State<WriteBenefitLeanProductionScreen> createState() =>
      _WriteBenefitLeanProductionScreenState();
}

class _WriteBenefitLeanProductionScreenState
    extends State<WriteBenefitLeanProductionScreen> {
  final TextEditingController _benefitController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    if (viewModel != null && viewModel.benefit != null) {
      _benefitController.text = viewModel.benefit!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateLeanProduction(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Польза\nпредложения',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  maxLines: 12,
                  minLines: 5,
                  controller: _benefitController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText:
                        'Напиши как ваше предложение положительно повлияет на изменения в компании',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              ResumeButtonWidget(
                title: 'Продолжить',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    viewModel?.benefit = _benefitController.text;
                    context.octopus.setState((state) => state
                      ..findByName('create-lean-production')
                          ?.add(Routes.pickFileLeanProduction.node()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Write Expenses Lean Production Screen

class WriteExpensesLeanProductionScreen extends StatefulWidget {
  const WriteExpensesLeanProductionScreen({super.key});

  @override
  State<WriteExpensesLeanProductionScreen> createState() =>
      _WriteExpensesLeanProductionScreenState();
}

class _WriteExpensesLeanProductionScreenState
    extends State<WriteExpensesLeanProductionScreen> {
  final TextEditingController _expensesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    if (viewModel != null && viewModel.expenses != null) {
      _expensesController.text = viewModel.expenses!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateLeanProduction(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Ориентировочные\nзатраты',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  maxLines: 12,
                  minLines: 5,
                  controller: _expensesController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText: 'Напиши ориентировочную стоимость',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              ResumeButtonWidget(
                title: 'Продолжить',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    viewModel?.expenses = _expensesController.text;
                    context.octopus.setState((state) => state
                      ..findByName('create-lean-production')?.add(
                          Routes.writeBenefitLeanProductionScreen.node()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Write Solution Lean Production Screen

class WriteSolutionLeamProductionScreen extends StatefulWidget {
  const WriteSolutionLeamProductionScreen({super.key});

  @override
  State<WriteSolutionLeamProductionScreen> createState() =>
      _WriteSolutionLeamProductionScreenState();
}

class _WriteSolutionLeamProductionScreenState
    extends State<WriteSolutionLeamProductionScreen> {
  final TextEditingController _solutionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isImplemented = false;

  @override
  void initState() {
    super.initState();
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    if (viewModel != null && viewModel.solution != null) {
      _solutionController.text = viewModel.solution!;
    }
    if (viewModel != null && viewModel.isImplemented != null) {
      isImplemented = viewModel.isImplemented!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateLeanProduction(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Как решить',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  maxLines: 12,
                  minLines: 5,
                  controller: _solutionController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText: 'Опиши пути решения',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  'Предложение уже реализованно',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                value: isImplemented,
                onChanged: (value) {
                  setState(() {
                    isImplemented = !isImplemented;
                  });
                },
              ),
              const Spacer(),
              ResumeButtonWidget(
                title: 'Продолжить',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    viewModel?.solution = _solutionController.text;
                    viewModel?.isImplemented = isImplemented;
                    context.octopus.setState((state) => state
                      ..findByName('create-lean-production')?.add(
                          Routes.writeExpensesLeanProductionScreen.node()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Write Problem Lean Production Screen

class WriteProblemLeanProductionScreen extends StatefulWidget {
  const WriteProblemLeanProductionScreen({super.key});

  @override
  State<WriteProblemLeanProductionScreen> createState() =>
      _WriteProblemLeanProductionScreenState();
}

class _WriteProblemLeanProductionScreenState
    extends State<WriteProblemLeanProductionScreen> {
  final TextEditingController _problemController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    if (viewModel != null && viewModel.problem != null) {
      _problemController.text = viewModel.problem!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateLeanProductionViewModel>,
        CreateLeanProductionViewModel>(context);
    return Scaffold(
      appBar: const _AppBarForCreateLeanProduction(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Cуть проблемы',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                  maxLines: 12,
                  minLines: 5,
                  controller: _problemController,
                  decoration: InputDecoration(
                    fillColor: const Color(0xfff5f5f5),
                    filled: true,
                    hintText: 'Опиши суть проблемы',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле обязательно для заполнения';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              ResumeButtonWidget(
                title: 'Продолжить',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    viewModel?.problem = _problemController.text;
                    context.octopus.setState((state) => state
                      ..findByName('create-lean-production')?.add(
                          Routes.writeSolutionLeanProductionScreen.node()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarForCreateLeanProduction extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppBarForCreateLeanProduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        TextButton(
            onPressed: () {
              context.octopus.setState(
                  (state) => state..removeByName('create-lean-production'));
            },
            child: const Text('Сбросить'))
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
