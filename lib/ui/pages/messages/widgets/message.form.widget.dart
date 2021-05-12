import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:app_contacts_managment/model/messages.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MessagesFormWidget extends StatelessWidget {
  TextEditingController textEditingController = new TextEditingController();
  Contact contact;
  MessagesFormWidget(this.contact);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Your message",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  )
                ),
              )
          ),
          IconButton(
              icon: Icon(Icons.send),
              onPressed: (){
                print(textEditingController.text);
                Message message = new Message(type: 'Sent',contactID: contact.id, content: textEditingController.text, selected: false);
                context.read<MessagesBloc>().add(new AddNewMessageEvent(message));
                textEditingController.clear();
                Message replay = new Message(type: 'Received',contactID: contact.id, content: "hello mehdi", selected: false);
                context.read<MessagesBloc>().add(new AddNewMessageEvent(replay));
              },
          )
        ],
      )
    );
  }
}
