import 'package:flutter/material.dart';
class Tiempo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home,
              size: 120.0,
              color: Colors.blue,
            ),
            Text("Bienvenidos a la ventana Tiempo")
          ],
        ),
      ),
    );
  }
}