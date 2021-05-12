import 'package:app_contacts_managment/bloc/contact.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorRetryMessage extends StatelessWidget {
  String errorMessage;
  Function onAction;
  ErrorRetryMessage({this.errorMessage,this.onAction});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${errorMessage}", style: TextStyle(color: Colors.red),),
        RaisedButton(
          onPressed: this.onAction,
          child: Text(
            "Retry",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.lightBlue,
        )
      ],
    );
  }
}
