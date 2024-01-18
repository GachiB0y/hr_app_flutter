import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/features/initialiazation/widget/dependencies_scope.dart';
import 'package:hr_app_flutter/features/statements/bloc/participants_bloc/participants_bloc.dart';
import 'package:hr_app_flutter/features/statements/widget/statements_scope.dart';
import 'package:intl/intl.dart';

import '../../bloc/statements_bloc/statements_form_bloc/statements_bloc.dart';
import '../../bloc/statements_bloc/statements_type_list_bloc/statement_type_list_bloc.dart';
import '../../model/statements/statements.dart';
import 'statemetn_view_model.dart';

class StatementFormScreen extends StatefulWidget {
  const StatementFormScreen({
    super.key,
  });

  @override
  State<StatementFormScreen> createState() => _StatementFormScreenState();
}

class _StatementFormScreenState extends State<StatementFormScreen> {
  final _model = StatementViewModelWidget();

  @override
  Widget build(BuildContext context) {
    return StatementsScope(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          scrolledUnderElevation: 0,
          title: const Text('Подача заявления'),
        ),
        body: SafeArea(
            child: ChangeNotifierProvaider<StatementViewModelWidget>(
                model: _model, child: const DropdownWidget())),
      ),
    );
  }
}

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<StatementFieldTypeEntity> filteredStatementFields = [];

  TextEditingController filterController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final StatementTypeListBLoC statementTypeListBLoC;
  late final StatementsBLoC statementsBLoC;

  @override
  void initState() {
    super.initState();

    statementTypeListBLoC = StatementTypeListBLoC(
      repositoryStatements: DependenciesScope.of(context).statementsRepository,
    );
    statementsBLoC = StatementsScope.of(context, listen: false).statementsBLoC;

    statementTypeListBLoC.add(const StatementTypeListEvent.fetch());
    filteredStatementFields = statementTypeListBLoC.state.hasData
        ? statementTypeListBLoC.state.data!
        : [];
  }

  @override
  void dispose() {
    statementTypeListBLoC.close();
    super.dispose();
  }

  void filterStatementFields(
      String filter, List<StatementFieldTypeEntity>? oldList) {
    setState(() {
      filteredStatementFields = oldList!
          .where((statementField) =>
              statementField.name.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  final TextEditingController colorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatementTypeListBLoC, StatementTypeListState>(
        bloc: statementTypeListBLoC,
        builder: (context, stateTypeListBLoC) {
          return BlocBuilder<StatementsBLoC, StatementsState>(
              bloc: statementsBLoC,
              builder: (context, stateStatementsBLoC) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          DropdownMenu<StatementFieldTypeEntity>(
                            inputDecorationTheme: InputDecorationTheme(
                              fillColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              filled: true,
                              border: const OutlineInputBorder(),
                            ),
                            label: Text(
                              'Тип заявления',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onInverseSurface),
                            ),
                            menuStyle: MenuStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                  Theme.of(context).colorScheme.onPrimary,
                                ),
                                surfaceTintColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Colors.transparent),
                                elevation:
                                    const MaterialStatePropertyAll<double>(
                                        10.0),
                                maximumSize: const MaterialStatePropertyAll(
                                    Size(300, 300))),
                            width: 300,
                            menuHeight: 300,
                            controller: colorController,
                            onSelected: (StatementFieldTypeEntity? value) {
                              if (value != null) {
                                statementsBLoC.add(StatementsEvent.fetch(
                                    id: value.documentType));
                              }
                            },
                            dropdownMenuEntries:
                                stateTypeListBLoC.data!.map((statementField) {
                              return DropdownMenuEntry<
                                      StatementFieldTypeEntity>(
                                  value: statementField,
                                  label: statementField.name,
                                  style: ButtonStyle(
                                      maximumSize:
                                          const MaterialStatePropertyAll(
                                              Size(300, 300)),
                                      textStyle: MaterialStatePropertyAll(
                                          TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onInverseSurface))));
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          StatementsTampleteFormWidget(
                            formKey: _formKey,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}

class StatementsTampleteFormWidget extends StatefulWidget {
  const StatementsTampleteFormWidget({
    super.key,
    required final GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final GlobalKey<FormState> _formKey;
  @override
  _StatementsTampleteFormWidgetState createState() =>
      _StatementsTampleteFormWidgetState();
}

class _StatementsTampleteFormWidgetState
    extends State<StatementsTampleteFormWidget> {
  List<TemplateField> initListField = [];
  List<Padding> listWidget = [];
  // bool isSumbitting = false;
  bool isEnableTextField = true;
  bool isShowInputCode = false;
  // late StatementFormInfoToSubmit formInfo;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _inputSMSCodeController = TextEditingController();
  List<TemplateField> textFieldsData = [];
  List<TextEditingController> listController = [];

  late final StatementsBLoC statementsBLoC;
  @override
  void initState() {
    super.initState();
    statementsBLoC = StatementsScope.of(context, listen: false).statementsBLoC;
  }

  Map<String, String?> convertListToMap(List<TemplateField> textFieldsData) {
    Map<String, String?> resultMap = {};

    for (TemplateField field in textFieldsData) {
      resultMap[field.name] = field.body;
    }

    return resultMap;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatementsBLoC, StatementsState>(
        //     listenWhen: (previousState, state) {
        //   return state != previousState;
        // },
        bloc: statementsBLoC,
        listener: (context, state) {
          final viewModel = ChangeNotifierProvaider.watch<
              ChangeNotifierProvaider<StatementViewModelWidget>,
              StatementViewModelWidget>(context);
          if (viewModel == null) {
            return;
          }
          if (state is StatementsState$Error) {
            if (viewModel.isSumbitting) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Center(
                        child: Text('Ошибка отправки.\nПопробуйте снова.')),
                    duration: Duration(seconds: 6),
                  ),
                );
              setState(() {
                _inputSMSCodeController.clear();
                viewModel.isSumbitting = false;
              });
            }
          } else if (state is StatementsState$Successful) {
            if (viewModel.isSumbitting) {
              if (state.data!.isSmsApprove == true) {
                ///Проверяем было ли подписание
                if (state.data!.isSigningStatment) {
                  _showSnackBarSuccesfull(context);
                }
                setState(() {
                  /// Поазываем поле для ввода СМС кода.
                  isShowInputCode = true;

                  /// Блокируем поля на ввод если подписание через СМС.
                  isEnableTextField = false;
                });
              } else {
                _showSnackBarSuccesfull(context);
              }
            } else {
              if (state.data?.tempalteEntity!.template != null) {
                /// Создаем поля формы из шаблона
                initListField.addAll(state.data!.tempalteEntity!.template);
                listWidget = state.data!.tempalteEntity!.template
                    .map((TemplateField element) {
                  TextEditingController controller = TextEditingController();
                  late final Widget textField;
                  if (element.dataType == "datetime") {
                    textField = TextFormField(
                      enabled: isEnableTextField,
                      controller: controller,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Поле обязательно для заполнения';
                        } else {
                          setState(() {
                            final newInput = TemplateField(
                              name: element.name,
                              body: value!,
                              dataType: element.dataType,
                            );
                            textFieldsData.add(newInput);
                          });
                        }
                        return null;
                      },
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        ).then((selectedDate) {
                          if (selectedDate != null) {
                            final formatter = DateFormat('dd.MM.yyyy', 'ru');
                            controller.text = formatter.format(selectedDate);
                          }
                        });
                      },
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          filled: true,
                          border: const OutlineInputBorder(),
                          labelText: element.body,
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface)),
                    );
                  } else {
                    textField = TextFormField(
                      enabled: isEnableTextField,
                      controller: controller,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Поле обязательно для заполнения';
                        } else {
                          setState(() {
                            final newInput = TemplateField(
                                name: element.name,
                                body: value!,
                                dataType: element.dataType);
                            textFieldsData.add(newInput);
                          });
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.onPrimary,
                          filled: true,
                          border: const OutlineInputBorder(),
                          labelText: element.body,
                          labelStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface)),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      width: 300,
                      child: textField,
                    ),
                  );
                }).toList();
              }
            }
          }
        },
        builder: (context, state) {
          if (state is StatementsState$Idle) {
            return state.data != null
                ? Column(
                    children: [
                      Column(children: listWidget),
                      state.data!.tempalteEntity!.isParticipants!
                          ? Container(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              width: 300,
                              child: ParticipantInputWidget(
                                iconData: null,
                                nameController: _nameController,
                                idController: _idController,
                                inputText: 'Согласующий',
                              ),
                            )
                          : const SizedBox.shrink(),
                      isShowInputCode
                          ? Column(
                              children: [
                                SizedBox(
                                  width: 300,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value != null && value.isEmpty) {
                                        return 'Поле обязательно для заполнения';
                                      }
                                      return null;
                                    },
                                    controller: _inputSMSCodeController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        fillColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        filled: true,
                                        border: const OutlineInputBorder(),
                                        labelText: 'Код из СМС',
                                        hintText: 'Введите код из СМС'),
                                  ),
                                ),
                                const CountdownWidget(),
                              ],
                            )
                          : const SizedBox.shrink(),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm(context, state);
                        },
                        child: Text(
                          isShowInputCode ? 'Подписать' : 'Отправить',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          } else if (state is StatementsState$Processing) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  void _showSnackBarSuccesfull(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        const SnackBar(
          content: Center(
              child: Text(
            'Данные успешно отправленны!',
            style: TextStyle(fontSize: 20),
          )),
          duration: Duration(seconds: 2),
        ),
      ).closed.then((value) {
        Navigator.pop(context);
      });
  }

  void _submitForm(BuildContext context, StatementsState$Idle state) {
    final viewModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<StatementViewModelWidget>,
        StatementViewModelWidget>(context);

    if (viewModel == null) {
      return;
    }
    final bool isValidForm = viewModel.validateForm(formKey: widget._formKey);

    if (isValidForm == true) {
      if (isShowInputCode) {
        statementsBLoC.add(
            StatementsEvent.signDocument(code: _inputSMSCodeController.text));
      } else {
        viewModel.createDocumentType(
          documentType: state.data!.tempalteEntity!.documentType,
        );
        viewModel.createFormInfo(textFieldsData: textFieldsData);
        StatementFormInfoToSubmit? formInfo = viewModel.formInfo;
        if (formInfo != null) {
          statementsBLoC.add(StatementsEvent.create(itemsForm: formInfo));
          // Делать что-то с данными, например, отправить на сервер

          viewModel.changeIsSubmiting(true);
        }
      }
    }
  }
}

class ParticipantInputWidget extends StatefulWidget {
  const ParticipantInputWidget({
    super.key,
    required TextEditingController nameController,
    required TextEditingController idController,
    required IconData? iconData,
    required String inputText,
  })  : _nameController = nameController,
        _iconData = iconData,
        _inputText = inputText;

  final TextEditingController _nameController;

  final IconData? _iconData;
  final String _inputText;

  @override
  _ParticipantInputWidgetState createState() => _ParticipantInputWidgetState();
}

class _ParticipantInputWidgetState extends State<ParticipantInputWidget> {
  Timer? searchDebounce;
  final FocusNode focusNodeSearch = FocusNode();
  bool isFocus = false;
  final ScrollController _scrollController = ScrollController();

  String get inputText => widget._inputText;
  IconData? get iconData => widget._iconData;
  TextEditingController get nameController => widget._nameController;
  late final ParticipantsBLoC participantsBLoC;
  @override
  void initState() {
    participantsBLoC = ParticipantsBLoC(
      repositoryStatements: DependenciesScope.of(context).statementsRepository,
    );
    super.initState();
  }

  @override
  void dispose() {
    participantsBLoC.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParticipantsBLoC, ParticipantsState>(
        bloc: participantsBLoC,
        builder: (context, state) {
          return Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: inputText,
                        labelStyle: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onInverseSurface)),
                    onTap: () {
                      setState(() {
                        isFocus = true;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        isFocus = false;
                      });
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        searchDebounce?.cancel();
                        searchDebounce =
                            Timer(const Duration(milliseconds: 700), () {
                          participantsBLoC
                              .add(ParticipantsEvent.fetch(inputValue: value));
                        });
                      }
                    },
                  ),
                ],
              ),
              if (state.hasError)
                const Center(child: Text('Пользователь не найден.')),
              if (state.isProcessing) const SizedBox.shrink(),
              if (state.hasData || state.isIdling)
                state.data != null
                    ? state.data!.isEmpty
                        ? const Center(child: Text('Пользователь не найден.'))
                        : isFocus
                            ? Container(
                                constraints: const BoxConstraints(
                                    minHeight: 70, maxHeight: 240),
                                padding: const EdgeInsets.all(16.0),
                                width: double.infinity,
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: const Offset(0, 0),
                                  ),
                                ], color: Colors.white),
                                child: Scrollbar(
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: state.data!.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                            '${state.data![index].lastName} ${state.data![index].firstName} ${state.data![index].patronymic}'),
                                        subtitle: Text(
                                            state.data![index].position,
                                            overflow: TextOverflow.clip),
                                        onTap: () {
                                          nameController.text =
                                              '${state.data![index].lastName} ${state.data![index].firstName} ${state.data![index].patronymic}';

                                          final viewModel =
                                              ChangeNotifierProvaider.read<
                                                      ChangeNotifierProvaider<
                                                          StatementViewModelWidget>,
                                                      StatementViewModelWidget>(
                                                  context);
                                          viewModel?.createIdParticipant(
                                              idParticipant:
                                                  state.data![index].id);

                                          setState(() {
                                            isFocus = false;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                    : const SizedBox.shrink(),
            ],
          );
        });
  }
}

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  _CountdownWidgetState createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  int _secondsRemaining = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_secondsRemaining == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _secondsRemaining--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _secondsRemaining == 0
        ? TextButton(
            onPressed: () {
              startTimer();

              setState(() {
                _secondsRemaining = 60;
              });
              final viewModel = ChangeNotifierProvaider.read<
                  ChangeNotifierProvaider<StatementViewModelWidget>,
                  StatementViewModelWidget>(context);

              if (viewModel == null) {
                return;
              }

              StatementFormInfoToSubmit? formInfo = viewModel.formInfo;
              if (formInfo != null) {
                StatementsScope.of(context, listen: false)
                    .statementsBLoC
                    .add(StatementsEvent.create(itemsForm: formInfo));
                // Делать что-то с данными, например, отправить на сервер

                viewModel.changeIsSubmiting(true);
              }
            },
            child: const Text('Получить код'))
        : Text(
            'Запросить код повторно через:$_secondsRemaining',
          );
  }
}
