import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:file_picker/file_picker.dart';
import 'package:hr_app_flutter/ui/components/custom_date_picker/custom_date_picker.dart';
import 'package:hr_app_flutter/ui/components/custom_date_picker/custom_date_pikcer_model.dart';

import '../../../library/custom_provider/inherit_widget.dart';

@RoutePage()
class LeanProductionFormScreen extends StatelessWidget {
  const LeanProductionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text('Подача заявления'),
      ),
      body: const MyFormWidget(),
    );
  }
}

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _managerNameController = TextEditingController();
  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _solutionController = TextEditingController();
  final TextEditingController _costController = TextEditingController();
  final TextEditingController _benefitController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final List<TextEditingController> _executorsControllers = [
    TextEditingController()
  ];
  bool isChecked = false;

  @override
  void dispose() {
    _dateController.dispose();
    _employeeNameController.dispose();
    _managerNameController.dispose();
    _problemController.dispose();
    _solutionController.dispose();
    _costController.dispose();
    _benefitController.dispose();
    _authorController.dispose();
    _executorsControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ChangeNotifierProvaider<CustomDatePickerModel>(
        model: CustomDatePickerModel(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Дата'),
                        SizedBox(
                          height: 5,
                        ),
                        CustomDatePicker(),
                      ],
                    )),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Подано реализованным'),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
                CustomTextFormField(
                    iconData: Icons.person,
                    inputText: 'ФИО сотрудника',
                    nameController: _employeeNameController),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _executorsControllers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CustomTextFormField(
                          iconData: Icons.person_4,
                          inputText: 'Исполнитель ${index + 1}',
                          nameController: _executorsControllers[index]),
                    );
                  },
                ),
                _executorsControllers.length < 3
                    ? Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Center(
                          child: ElevatedButton(
                            child: const Text('Добавить исполнителя'),
                            onPressed: () {
                              if (_executorsControllers.length < 3) {
                                setState(() {
                                  _executorsControllers
                                      .add(TextEditingController());
                                });
                              }
                            },
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    iconData: Icons.receipt,
                    inputText: 'Суть проблемы',
                    nameController: _problemController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    iconData: Icons.question_mark_outlined,
                    inputText: 'Как решить',
                    nameController: _solutionController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    iconData: Icons.paid,
                    inputText: 'Ориентировочные затраты',
                    nameController: _costController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    iconData: Icons.star,
                    inputText:
                        'Польза предложения (экономия времени, средств и т.д.)',
                    nameController: _benefitController),
                const SizedBox(
                  height: 10,
                ),
                const FilePickerWidget(),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: ElevatedButton(
                    child: const Text('Отправить'),
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        if (_formKey.currentState!.validate()) {
                          // Perform form submission
                          // ...
                          print('GOOOOD');
                        } else {
                          print('SO BAD !');
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required TextEditingController nameController,
    required IconData? iconData,
    required String inputText,
  })  : _nameController = nameController,
        _iconData = iconData,
        _inputText = inputText;

  final TextEditingController _nameController;
  final IconData? _iconData;
  final String _inputText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_inputText),
          TextFormField(
            maxLines: 10,
            minLines: 1,
            controller: _nameController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              icon: Icon(_iconData),
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Поле обязательно для заполнения';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  String _fileName = '';

  FilePickerResult? result;
  String? path;

  void _pickFile() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt', 'doc', 'jpg', 'png'],
    );

    if (result != null) {
      setState(() {
        path = result!.files.single.path;
        _fileName = result!.files.single.name;
      });
    }
  }

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
          GestureDetector(
            onTap: _pickFile,
            child: const Text(
              'Выберите файл ...',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
          const SizedBox(height: 16),
          _fileName != ''
              ? Text(
                  'Выбранный фаил: $_fileName',
                  style: const TextStyle(fontSize: 16),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
