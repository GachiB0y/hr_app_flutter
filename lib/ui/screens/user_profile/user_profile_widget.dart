import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';
import 'package:hr_app_flutter/library/custom_provider/inherit_widget.dart';
import 'package:hr_app_flutter/ui/screens/user_profile/user_profile_widget_model.dart';

@RoutePage()
class ProfileWidgetScreen extends StatefulWidget {
  final User user;

  const ProfileWidgetScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ProfileWidgetScreen> createState() => _ProfileWidgetScreenState();
}

class _ProfileWidgetScreenState extends State<ProfileWidgetScreen> {
  late final UserProfileWidgetModel _model;
  @override
  void initState() {
    super.initState();
    _model = UserProfileWidgetModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvaider<UserProfileWidgetModel>(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SaveButtonWidget(),
          ],
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: Image.network(widget.user.avatar).image,
                  radius: 50,
                ),
                const SizedBox(height: 16),
                Text(
                  '${widget.user.name} ${widget.user.nameI}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.user.phoneOne,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.user.staffPosition,
                  style: const TextStyle(fontSize: 16),
                ),
                const TagsWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (ChangeNotifierProvaider.watch<
                ChangeNotifierProvaider<UserProfileWidgetModel>,
                UserProfileWidgetModel>(context) !=
            null &&
        ChangeNotifierProvaider.watch<
                ChangeNotifierProvaider<UserProfileWidgetModel>,
                UserProfileWidgetModel>(context)!
            .isSave) {
      return TextButton(
        child: const Text('Сохранить'),
        onPressed: () {},
      );
    } else {
      return SizedBox.shrink();
    }
  }
}

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key});

  @override
  _TagsWidgetState createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  List<String> tags = [];
  final tagController = TextEditingController();

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          children: tags.map((tag) => Chip(label: Text(tag))).toList(),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            labelText: 'Введите название тега',
            suffixIcon: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                if (tagController.text.isNotEmpty) {
                  ChangeNotifierProvaider.read<
                          ChangeNotifierProvaider<UserProfileWidgetModel>,
                          UserProfileWidgetModel>(context)
                      ?.changeIsSave();
                  addTag(tagController.text);
                  tagController.clear();
                }
              },
            ),
          ),
          controller: tagController,
        ),
      ],
    );
  }
}
