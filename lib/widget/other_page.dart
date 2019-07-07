import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
        children: <Widget>[
          LimitedBox(
            maxWidth: 50.0,
            maxHeight: 50.0,
            child: Container(
              width: 100.0,
              height: 100.0,
              color: Colors.green,
              child: Text('jimmy'),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
//            widthFactor: 2.0,
//            heightFactor: 2.0,
            child: Container(
              color: Colors.blue,
              width: 200.0,
              height: 200.0,
              child: Text(
                'hello jimmy',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 100.0,
              maxHeight: 100.0,
            ),
            child: Container(
              width: 300.0,
              height: 300.0,
              color: Colors.green,
              child: Text('jimmy'),
            ),
          )

        ],
      );
  }
}
