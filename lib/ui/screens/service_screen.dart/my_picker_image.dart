import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_app_flutter/domain/entity/image.dart';
import 'package:hr_app_flutter/library/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/ui/screens/service_screen.dart/bottom_sheet_create_events_model.dart';
import 'package:image_picker/image_picker.dart';

class MyPickerImage extends StatefulWidget {
  const MyPickerImage({
    Key? key,
  }) : super(key: key);

  @override
  _MyPickerImageState createState() => _MyPickerImageState();
}

class _MyPickerImageState extends State<MyPickerImage> {
  final MyImage _myImage = MyImage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _myImage.imageFile != null
            ? Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: FileImage(_myImage.imageFile as File),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
        SizedBox(
          width: double.infinity,
          height: 200,
          child: InkWell(
            onTap: () async {
              await _myImage.pickImage(ImageSource.gallery);
              final imageFile = _myImage.imageFile;
              if (imageFile != null) {
                final File file = File(imageFile.path);
                ChangeNotifierProvaider.read<
                        ChangeNotifierProvaider<BottomSheetCreateEventsModel>,
                        BottomSheetCreateEventsModel>(context)
                    ?.file = file;

                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
