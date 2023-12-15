import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hr_app_flutter/router/router.dart';

@RoutePage()
class BookingMeetingsFirstScreen extends StatelessWidget {
  const BookingMeetingsFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Бронирование переговорки'),
      ),
      body: const SafeArea(
          child: Column(
        children: [BookingMeetingButton(), MyBookingButton()],
      )),
    );
  }
}

class BookingMeetingButton extends StatelessWidget {
  const BookingMeetingButton({super.key});

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    return Container(
      height: (MediaQuery.of(context).size.height / 10) * textScaleFactor,
      margin:
          const EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.primary),
      child: Stack(children: [
        const Center(
          child: Text(
            'Забронировать',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
            softWrap: true,
            maxLines: 3,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {
              context.pushRoute(const BookingMeetingSecondRoute());
            },
          ),
        ),
      ]),
    );
  }
}

class MyBookingButton extends StatelessWidget {
  const MyBookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    if (textScaleFactor < 1) textScaleFactor = 1;
    return Container(
      height: (MediaQuery.of(context).size.height / 10) * textScaleFactor,
      margin:
          const EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.primary),
      child: Stack(children: [
        const Center(
          child: Text(
            'Мои бронирования',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
            softWrap: true,
            maxLines: 3,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () {},
          ),
        ),
      ]),
    );
  }
}
