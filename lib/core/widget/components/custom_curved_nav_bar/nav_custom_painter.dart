import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }
  double radius = 20;
  @override
  void paint(Canvas canvas, Size size) {
    // final paint = Paint()
    //   ..color = color

    //   ..style = PaintingStyle.fill;
    Paint paint = Paint()..style = PaintingStyle.fill;

    Shader shader = LinearGradient(
      colors: [color, const Color(0xFF33A970)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(const Rect.fromLTWH(0, 0, 200, 200));

    paint.shader = shader;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.03) * size.width, 0)
      ..arcToPoint(Offset(((loc - 0.03) + s * 0.2) * size.width, radius),
          radius: Radius.circular(radius))
      ..lineTo(
          ((loc - 0.03) + s * 0.2) * size.width, size.height - (radius * 2))
      ..arcToPoint(
          Offset((((loc - 0.03) + s * 0.2) * size.width) + radius,
              size.height - radius),
          radius: Radius.circular(radius),
          clockwise: false)
      ..lineTo((loc + s - s * 0.20) * size.width, size.height - radius)
      ..arcToPoint(Offset((loc + s) * size.width, size.height - radius * 2),
          radius: Radius.circular(radius), clockwise: false)
      ..lineTo((loc + s) * size.width, radius)
      ..arcToPoint(
        Offset((loc + s + s * 0.20) * size.width, 0),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
