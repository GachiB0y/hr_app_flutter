import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../domain/blocs/lean_production_form_bloc/lean_production_form_bloc.dart';
import '../../../domain/entity/lean_productions_entity/my_lean_productions_entity/my_lean_productions_entity.dart';
import '../../../utils/get_icon_by_text_func.dart';
import '../../components/custom_text_form_field/custom_text_form_field.dart';

@RoutePage()
class LeanProductionInfoProposalsScreen extends StatelessWidget {
  const LeanProductionInfoProposalsScreen(
      {super.key,
      required this.modelLeanProduction,
      required this.blocLeanProduction});

  final MyLeanProductionsEntity modelLeanProduction;
  final LeanProductionFormBloc blocLeanProduction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text('Заявление №${modelLeanProduction.number}'),
      ),
      body: InfoProposalsForm(
        modelLeanProduction: modelLeanProduction,
        blocLeanProduction: blocLeanProduction,
      ),
    );
  }
}

class InfoProposalsForm extends StatefulWidget {
  const InfoProposalsForm(
      {super.key,
      required this.modelLeanProduction,
      required this.blocLeanProduction});

  final MyLeanProductionsEntity modelLeanProduction;
  final LeanProductionFormBloc blocLeanProduction;

  @override
  _InfoProposalsFormState createState() => _InfoProposalsFormState();
}

class _InfoProposalsFormState extends State<InfoProposalsForm> {
  MyLeanProductionsEntity get modelLeanProduction => widget.modelLeanProduction;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                  initialValue: modelLeanProduction.status,
                  readOnly: true,
                  iconData: getIconByText(modelLeanProduction.status),
                  inputText: 'Статус',
                  nameController: null),

              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  initialValue: modelLeanProduction.issue,
                  readOnly: true,
                  iconData: const Icon(Icons.receipt),
                  inputText: 'Суть проблемы',
                  nameController: null),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  initialValue: modelLeanProduction.solution,
                  readOnly: true,
                  iconData: const Icon(Icons.question_mark_outlined),
                  inputText: 'Как решить',
                  nameController: null),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  initialValue: modelLeanProduction.expenses,
                  readOnly: true,
                  iconData: const Icon(Icons.paid),
                  inputText: 'Ориентировочные затраты',
                  nameController: null),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                  initialValue: modelLeanProduction.benefit,
                  readOnly: true,
                  iconData: const Icon(Icons.star),
                  inputText: 'Польза предложения',
                  nameController: null),
              const SizedBox(
                height: 10,
              ),
              FileInfoWidget(
                modelLeanProduction: modelLeanProduction,
                blocLeanProduction: widget.blocLeanProduction,
              ),
              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: modelLeanProduction.length,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.only(top: 10.0),
              //       child: CustomTextFormField(
              //           readOnly: true,
              //           iconData: Icons.person_4,
              //           inputText: 'Исполнитель ${index + 1}',
              //           nameController: _executorsControllers[index]),
              //     );
              //   },
              // ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Подано реализованным'),
                value: false,
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FileInfoWidget extends StatelessWidget {
  const FileInfoWidget(
      {super.key,
      required this.modelLeanProduction,
      required this.blocLeanProduction});
  final MyLeanProductionsEntity modelLeanProduction;
  final LeanProductionFormBloc blocLeanProduction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Файлы:',
            style: TextStyle(fontSize: 16),
          ),
          modelLeanProduction.files.isNotEmpty
              ? SizedBox(
                  height: 160,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 120,
                      itemCount: modelLeanProduction.files.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Stack(children: [
                                Container(
                                  margin: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.file_present,
                                      size: 60,
                                    ),
                                    onPressed: () {
                                      // Действия при нажатии на иконку документа
                                      blocLeanProduction.add(
                                          LeanProductionFormEvent
                                              .downloadFileWithLeanProduction(
                                        url: modelLeanProduction
                                            .files[index].url,
                                      ));
                                    },
                                  ),
                                ),
                              ]),
                              Text(
                                modelLeanProduction.files[index].fileName,
                                style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              : const Text(
                  'Отсутствуют.',
                  style: TextStyle(overflow: TextOverflow.ellipsis),
                ),
        ],
      ),
    );
  }
}
