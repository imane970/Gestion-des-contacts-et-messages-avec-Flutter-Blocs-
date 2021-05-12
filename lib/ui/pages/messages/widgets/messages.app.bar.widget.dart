import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';



class MyAppBarWidget extends AppBar{
  Contact contact;
  MyAppBarWidget(this.contact):super(
    title: Text("Les messages de ${contact.nom}"),
    actions: [
      BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state){
          if(state.selectedMessages.length>0){
            return CircleAvatar(
              child: Text("${state.selectedMessages.length}"),
            );
          }else{
            return Container();
          }

        },
      ),
      BlocBuilder<MessagesBloc, MessagesState>(
        builder: (context, state){
          if(state.selectedMessages.length>0){
            return IconButton(
                icon: Icon(Icons.restore_from_trash),
                onPressed: (){

                  context.read<MessagesBloc>().add(new DeleteMessagesEvent());

                });
          }else{
            return Container();
          }

        },
      ),
    ],
  );
}