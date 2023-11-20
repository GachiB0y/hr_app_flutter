import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/statements_bloc/statements_form_bloc/statements_bloc.dart';
import 'package:hr_app_flutter/domain/blocs/statements_bloc/statements_type_list_bloc/statement_type_list_bloc.dart';
import 'package:hr_app_flutter/domain/entity/statements/statements.dart';
import '../../../domain/repository/auth_repository.dart';
import '../../../domain/repository/statements_repository.dart';

@RoutePage()
class StatementFormScreen extends StatelessWidget implements AutoRouteWrapper {
  const StatementFormScreen(
      {super.key,
      required this.repositoryStatements,
      required this.authRepository});
  final IStatementsRepository repositoryStatements;
  final IAuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подача заявления'),
      ),
      body: const SafeArea(child: DropdownWidget()),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<StatementTypeListBLoC>(
        create: (BuildContext context) => StatementTypeListBLoC(
          authRepository: authRepository,
          repositoryStatements: repositoryStatements,
        ),
      ),
      BlocProvider<StatementsBLoC>(
        create: (BuildContext context) => StatementsBLoC(
          authRepository: authRepository,
          repositoryStatements: repositoryStatements,
        ),
      ),
    ], child: this);
  }
}

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  List<StatementFielTypedEntity> filteredStatementFields = [];

  TextEditingController filterController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    final blocStatements = context.read<StatementTypeListBLoC>();
    blocStatements.add(const StatementTypeListEvent.fetch());
    filteredStatementFields =
        blocStatements.state.hasData ? blocStatements.state.data! : [];
  }

  void filterStatementFields(
      String filter, List<StatementFielTypedEntity>? oldList) {
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
    final blocStatementsTypeList = context.watch<StatementTypeListBLoC>();
    final blocStatements = context.watch<StatementsBLoC>();

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              DropdownMenu<StatementFielTypedEntity>(
                menuStyle: const MenuStyle(
                    maximumSize: MaterialStatePropertyAll(Size(300, 300))),
                width: 300,
                menuHeight: 300,
                controller: colorController,
                onSelected: (StatementFielTypedEntity? value) {
                  if (value != null) {
                    blocStatements
                        .add(StatementsEvent.fetch(id: value.documentType));
                  }
                },
                dropdownMenuEntries:
                    blocStatementsTypeList.state.data!.map((statementField) {
                  return DropdownMenuEntry<StatementFielTypedEntity>(
                      value: statementField,
                      label: statementField.name,
                      style: const ButtonStyle(
                          maximumSize: MaterialStatePropertyAll(Size(300, 300)),
                          textStyle: MaterialStatePropertyAll(
                              TextStyle(overflow: TextOverflow.ellipsis))));
                }).toList(),
              ),
              const SizedBox(
                height: 16.0,
              ),
              StatementsHRLinkFormWidget(
                formKey: _formKey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatementsHRLinkFormWidget extends StatefulWidget {
  const StatementsHRLinkFormWidget({
    super.key,
    required final GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final GlobalKey<FormState> _formKey;
  @override
  _StatementsHRLinkFormWidgetState createState() =>
      _StatementsHRLinkFormWidgetState();
}

class _StatementsHRLinkFormWidgetState
    extends State<StatementsHRLinkFormWidget> {
  List<TemplateField> textFieldsData = [];
  List<TextEditingController> listController = [];
  Map<String, String?> convertListToMap(List<TemplateField> textFieldsData) {
    Map<String, String?> resultMap = {};

    for (TemplateField field in textFieldsData) {
      resultMap[field.name] = field.value;
    }

    return resultMap;
  }

  @override
  Widget build(BuildContext context) {
    // final blocStatements = context.watch<StatementsBLoC>();

    return BlocBuilder<StatementsBLoC, StatementsState>(
        builder: (context, state) {
      if (state is StatementsState$Idle) {
        return state.data != null
            ? Column(
                children: [
                  for (int i = 0; i < state.data!.template.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return 'Поле обязательно для заполнения';
                            } else {
                              setState(() {
                                final newInput = TemplateField(
                                    name: state.data!.template[i].name,
                                    value: value!);
                                textFieldsData.add(newInput);
                              });
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: state.data?.template[i].name,
                          ),
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      if (widget._formKey.currentState != null) {
                        if (widget._formKey.currentState!.validate()) {
                          final Map<String, String?> resultMap =
                              convertListToMap(textFieldsData);
                          final TemplateFormStatementsEntity
                              templateFormStatementsEntity =
                              TemplateFormStatementsEntity.fromJson(resultMap);

                          final StatementFormInfo formInfo = StatementFormInfo(
                              documentType: state.data!.documentType,
                              template: templateFormStatementsEntity);
                          // context
                          //     .read<StatementsBLoC>()
                          //     .add(StatementsEvent.create(itemsForm: formInfo));
                          // Делать что-то с данными, например, отправить на сервер

                          print(
                              '${formInfo.documentType} ${formInfo.template.firstName}');
                        }
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              )
            : const SizedBox.shrink();
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
