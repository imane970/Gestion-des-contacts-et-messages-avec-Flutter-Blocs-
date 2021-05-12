import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/model/messages.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MessageItemWidget extends StatelessWidget {
  Message message;
  MessageItemWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: message.selected,
      selectedTileColor: Colors.black12,
      onLongPress: (){
        context.read<MessagesBloc>().add(new SelectMessageEvent(message));
      },
      title: Row(
        mainAxisAlignment: (message.type=="Received")?MainAxisAlignment.start:MainAxisAlignment.end,
        children: [
          (message.type=="Received")?SizedBox(width: 0,):SizedBox(width: 40,),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(20),
              color: (message.type=="Received")?Color.fromARGB(20, 255, 255, 0):Color.fromARGB(20, 0, 255, 0),
              child: Text("(${message.date.day}/${message.date.month}/${message.date.hour}-${message.date.hour}:${message.date.minute}:${message.date.second})\n${message.content}"),
              foregroundDecoration: BoxDecoration(
                border: Border.all(color: Colors.black26)
              ),
            ),
          ),
          (message.type=="Received")?SizedBox(width: 40,):SizedBox(width: 0,)
        ],
      ),
    );
  }
}
