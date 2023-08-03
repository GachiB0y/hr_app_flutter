import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// class ScrollingWidgetExample extends StatefulWidget {
//   @override
//   _ScrollingWidgetExampleState createState() => _ScrollingWidgetExampleState();
// }

// class _ScrollingWidgetExampleState extends State<ScrollingWidgetExample> {
//   bool _isVisible = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scrolling Widget Example'),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
// child: Column(
//   children: List.generate(
//     20,
//     (index) => Container(
//       height: 100,
//       margin: EdgeInsets.symmetric(vertical: 10),
//       color: Colors.grey,
//       child: Center(
//         child: Text('Item $index'),
//       ),
//     ),
//   ),
// ),
// ),
//           AnimatedPositioned(
//             top: -100, // Позиция вверху экрана
//             left: 0,
//             right: 0,
//             duration: Duration(milliseconds: 200),
//             curve: Curves.easeInOut,
//             child: Container(
//               height: 100, // Высота виджета
//               color: Colors.blue,
//               child: Center(
//                 child: Text('Прячущийся виджет'),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             _isVisible = !_isVisible;
//           });
//         },
//         child: Icon(_isVisible ? Icons.visibility_off : Icons.visibility),
//       ),
//     );
//   }
// }

// class FlowScrollExample extends StatefulWidget {
//   @override
//   _FlowScrollExampleState createState() => _FlowScrollExampleState();
// }

// class _FlowScrollExampleState extends State<FlowScrollExample> {
//   late ScrollController _scrollController;
//   bool _isVisible = true;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();

//     _scrollController.addListener(() {
//       if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.reverse) {
//         setState(() {
//           _isVisible = false;
//         });
//       } else if (_scrollController.position.userScrollDirection ==
//           ScrollDirection.forward) {
//         setState(() {
//           _isVisible = true;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flow Scroll Example'),
//       ),
//       body: Flow(
//         delegate: FlowHideDelegate(isVisible: _isVisible),
//         children: [
//           SingleChildScrollView(
//             controller: _scrollController,
//             child: Column(
//               children: List.generate(
//                 20,
//                 (index) => Container(
//                   height: 100,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   color: Colors.grey,
//                   child: Center(
//                     child: Text('Item $index'),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Visibility(
//             visible: _isVisible,
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 200),
//               height: 100,
//               color: Colors.blue,
//               child: Center(
//                 child: Text('Скрываемый виджет'),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class FlowHideDelegate extends FlowDelegate {
//   final bool isVisible;

//   FlowHideDelegate({required this.isVisible});

//   @override
//   void paintChildren(FlowPaintingContext context) {
//     double dx = 0;
//     double dy = 0;

//     for (int i = 0; i < context.childCount; i++) {
//       if (isVisible) {
//         context.paintChild(
//           i,
//           transform: Matrix4.translationValues(dx, dy, 0.0),
//         );
//       }

//       dx += context.getChildSize(i)!.width;
//     }
//   }

//   @override
//   bool shouldRepaint(covariant FlowHideDelegate oldDelegate) {
//     return oldDelegate.isVisible != isVisible;
//   }

//   @override
//   Size getSize(BoxConstraints constraints) {
//     return Size(double.infinity, constraints.maxHeight);
//   }
// }

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  ScrollController _scrollController = ScrollController();
  bool _isWidget1Visible = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          _isWidget1Visible) {
        setState(() {
          _isWidget1Visible = false;
        });
      } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !_isWidget1Visible) {
        setState(() {
          _isWidget1Visible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Flow(
            delegate: FlowDelegateExample(),
            children: <Widget>[
              // Виджет 1
              Center(
                child: Visibility(
                  visible: true,
                  child: Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              // Виджет 2 - Скролл виджет
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollStartNotification) {
                    // Обнулить значение виджета 1 перед началом скролла
                    setState(() {
                      _isWidget1Visible = true;
                    });
                  }
                  return false;
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: List.generate(
                      20,
                      (index) => Container(
                        height: 100,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        color: Colors.grey,
                        child: Center(
                          child: Text('Item $index'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlowDelegateExample extends FlowDelegate {
  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return true;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final size = context.size;
    double dx = 0;
    double dy = 0;

    for (int i = 0; i < context.childCount; i++) {
      if (i == 0 && !context.getChildSize(i)!.isEmpty) {
        continue; // Пропустить виджет 1, если он видимый
      }

      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx, dy, 0),
      );

      dy += context.getChildSize(i)!.height;
    }
  }
}
