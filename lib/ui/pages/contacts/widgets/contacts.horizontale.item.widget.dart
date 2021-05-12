import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ContactsHorizontale extends StatelessWidget {
  Contact contact;
  int index;
  ScrollController scrollController;
  ContactsHorizontale({this.contact, this.index, this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          context.read<MessagesBloc>().add(new MessagesByContactEvent(contact));
          scrollController.animateTo((index*200-150).toDouble(), duration: Duration(microseconds: 2000), curve: Curves.ease);
        },
        child: BlocBuilder<MessagesBloc, MessagesState>(
          builder: (context, messagesState){
            return Card(
              child: Container(
                  padding: EdgeInsets.all(16),
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: (messagesState.currentContact==contact)?3:1,
                          color: Colors.red)
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(child: Text("${contact.profile}"),),
                      Text('${contact.nom}'),
                      Text("${contact.score}"),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
