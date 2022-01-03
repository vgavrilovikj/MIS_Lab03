import 'package:flutter/material.dart';

class Kolokvium extends StatelessWidget {

  final Color _textColor;
  String _courseName, _date, _time;

  Kolokvium(this._courseName, this._date, this._time, this._textColor);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.8,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  _courseName,
                  style: TextStyle(
                      fontSize: 24,
                      color: _textColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                      '$_date $_time',
                      style: TextStyle(color: Colors.grey[400])
                  )
              ),
            ])
    );

  }

}