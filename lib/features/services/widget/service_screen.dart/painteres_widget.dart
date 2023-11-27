import 'package:flutter/widgets.dart';

class PainterRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // double radius = 100;
    double x = 52;
    double y = 26;
    final path = Path()
      ..moveTo(0, size.height) // Начало пути
      ..arcToPoint(Offset(size.width - y + 5, y / 3),
          radius: Radius.circular(
            x,
          ),
          clockwise: false)
      ..arcToPoint(
        Offset(size.width, 0),
        radius: Radius.elliptical(x, x),
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width,
          size.height) // Добавить линию, образующую правую стенку контейнера
      ..close(); // Замкнуть контур, создав обрезанный прямоугольник
    final paint = Paint()
      ..color = const Color.fromARGB(255, 224, 224, 224)
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PainterLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // double radius = 100;
    double x = 52;
    double y = 26;
    final path = Path()
      ..moveTo(size.width, size.height) // Начало пути
      ..arcToPoint(
        Offset(size.width - y - 5, y / 3),
        radius: Radius.elliptical(x, y),
      )
      ..arcToPoint(const Offset(0, 0),
          radius: Radius.circular(x), clockwise: false)
      ..lineTo(0, 0)
      ..lineTo(
          0, size.height) // Добавить линию, образующую правую стенку контейнера
      ..close(); // Замкнуть контур, создав обрезанный прямоугольник
    final paint = Paint()
      ..color = const Color.fromARGB(255, 224, 224, 224)
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
