// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HeaderTextColor extends StatelessWidget {
//   String text;
//   HeaderTextColor( this.text, {Key? key}) : super(key: key);
  
 
  
//   @override

//   Widget build(BuildContext context) {
//     final providerWatch = context.watch<ColorProvider>();
//     final providerRead = context.read<ColorProvider>();
   
//     return Scaffold(
//         body: Container(
//       child: Center(
//         child: GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTap: () => providerRead.changeColor(),
//             child: Text(
//               text,
//               style: TextStyle(color: providerWatch.color),
//             )),
//       ),
//     ));
//   }
// }


// class ColorProvider extends ChangeNotifier {
//   ColorProvider();
//   bool isPressed = true;

//   Color color = Colors.black;

//   changeColor() {
//     if (isPressed == true) {
//       color = Colors.green;
//       isPressed = false;
//     } else {
//       color = Colors.black;
//       isPressed = true;
//     }
//     notifyListeners();
//     return isPressed;
//   }
// }