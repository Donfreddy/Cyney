import 'package:cyney/src/utils/app_color.dart';
import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          RaisedButton(
            color: white,
            child: Text('Retry', style: TextStyle(color: black)),
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
