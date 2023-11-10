import 'package:flutter/material.dart';

import '../../../library/custom_provider/inherit_widget.dart';
import 'file_picker_custom_model.dart';

class FilePickerWidget extends StatefulWidget {
  const FilePickerWidget({super.key});

  @override
  _FilePickerWidgetState createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends State<FilePickerWidget> {
  @override
  Widget build(BuildContext context) {
    final model = ChangeNotifierProvaider.watch<
        ChangeNotifierProvaider<FilePickerCustomModel>,
        FilePickerCustomModel>(context);
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Выбранные фаилы:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 120,
                itemCount: model?.fileNames.length,
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
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                model?.deleteFile(indexFile: index);
                              },
                            ),
                          ),
                        ]),
                        Text(
                          '${model?.fileNames[index]}',
                          style: const TextStyle(
                              fontSize: 16, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
