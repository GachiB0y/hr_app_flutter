import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/router/routes.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_news_screen.dart';
import 'package:hr_app_flutter/features/user/bloc/other_users_bloc/other_users_bloc.dart';
import 'package:octopus/octopus.dart';

class CreateLeanProductionScreen extends StatelessWidget {
  const CreateLeanProductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BucketNavigator(bucket: 'create-lean-production');
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBarForCreateLeanProduction(),
      body: SafeArea(
        child: Column(
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
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _executorsControllers.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ImplementersInputWidget(
                      nameController: _executorsControllers[index],
                      idController: _executorsIdControllers[index],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _executorsControllers.length < 3
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: IconButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xffb3f2b2))),
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              if (_executorsControllers.length < 3) {
                                setState(() {
                                  _executorsControllers
                                      .add(TextEditingController());
                                  _executorsIdControllers
                                      .add(TextEditingController());
                                });
                              }
                            },
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                _executorsControllers.length > 1
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: IconButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color(0xfff3b2b2))),
                            onPressed: () {
                              if (_executorsControllers.length > 1) {
                                setState(() {
                                  _executorsControllers.removeLast();
                                  _executorsIdControllers.removeLast();
                                });
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
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
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
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
                            ? Stack(children: [
                                Container(
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
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                ),
                              ])
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
  Widget build(BuildContext context) {
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
                    // newsModel?.description = _descriptionController.text;
                    context.octopus.setState((state) => state
                      ..findByName('create-lean-production')?.add(
                          Routes.selectorExecutorLeanProductionScreen.node()));
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
  Widget build(BuildContext context) {
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
                    // newsModel?.description = _descriptionController.text;
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
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
              ),
              const Spacer(),
              ResumeButtonWidget(
                title: 'Продолжить',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // newsModel?.description = _descriptionController.text;
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
    // final newsModel = ChangeNotifierProvaider.read<
    //     ChangeNotifierProvaider<CreateEventsViewModel>,
    //     CreateEventsViewModel>(context);
    // if (newsModel != null && newsModel.description != null) {
    //   _problemController.text = newsModel.description!;
    // }
  }

  @override
  Widget build(BuildContext context) {
    // final newsModel = ChangeNotifierProvaider.read<
    //     ChangeNotifierProvaider<CreateEventsViewModel>,
    //     CreateEventsViewModel>(context);
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
                    // newsModel?.description = _problemController.text;
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
