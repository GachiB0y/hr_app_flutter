import 'package:flutter/material.dart';

class CustomProgressIndicatorWidget extends StatelessWidget {
  const CustomProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: <Color>[
            Colors.white.withOpacity(0.0),
            Colors.white,
          ],
        ).createShader(const Rect.fromLTWH(0.0, 0.0, 60.0, 60.0));
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SizedBox(
          width: 64.0,
          height: 64.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            strokeWidth: 8,
          ),
        ),
      ),
    );
  }
}
