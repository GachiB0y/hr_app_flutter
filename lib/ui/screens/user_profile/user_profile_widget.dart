import 'package:flutter/material.dart';
import 'package:hr_app_flutter/domain/entity/user/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;

  const ProfileWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(user.avatar),
            radius: 50,
          ),
          SizedBox(height: 16),
          Text(
            '${user.name} ${user.nameI}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            user.phoneOne,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          Text(
            user.staffPosition,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
