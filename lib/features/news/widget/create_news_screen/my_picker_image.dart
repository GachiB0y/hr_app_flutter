import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hr_app_flutter/core/components/database/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/core/model/image.dart';
import 'package:hr_app_flutter/features/news/widget/create_news_screen/create_events_view_model.dart';

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
  void initState() {
    super.initState();
    final newsModel = ChangeNotifierProvaider.read<
        ChangeNotifierProvaider<CreateEventsViewModel>,
        CreateEventsViewModel>(context);
    if (newsModel != null && newsModel.file != null) {
      _myImage.imageFile = newsModel.file;
    }
  }

  @override
  Widget build(BuildContext context) {
    const double radius = 10.0;
    return Stack(
      children: [
        _myImage.imageFile != null
            ? Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(radius),
                  image: DecorationImage(
                    image: FileImage(_myImage.imageFile as File),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     IconButton(
                //       splashColor: Colors.transparent,
                //       highlightColor: Colors.transparent,
                //       onPressed: () {},
                //       icon: const Icon(
                //         Icons.add,
                //         size: 30,
                //         color: Colors.black,
                //       ),
                //     ),
                //   ],
                // ),
              )
            : Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 8,
                        offset: const Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(radius),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 70,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Добавь фото\nЖеательно горизонтальное фото',
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    )
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
                        ChangeNotifierProvaider<CreateEventsViewModel>,
                        CreateEventsViewModel>(context)
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
