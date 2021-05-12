import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/bloc/messages/messages.state.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:app_contacts_managment/model/messages.model.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/contact.info.widget.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/message.form.widget.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/messages.app.bar.widget.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/messages.list.widget.dart';
import 'package:app_contacts_managment/ui/pages/messages/widgets/messages.widget.page.dart';
import 'package:app_contacts_managment/ui/shared/circular.progress.ind.widget.dart';
import 'package:app_contacts_managment/ui/shared/error.retry.action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesPage extends StatelessWidget {
  Contact contact;

  @override
  Widget build(BuildContext context) {
    //1 pour initialiser le contact d'abord
    this.contact = ModalRoute.of(context).settings.arguments;
    //2 apres initialisation du contact
    context.read<MessagesBloc>().add(MessagesByContactEvent(this.contact));

    return Scaffold(
      appBar: MyAppBarWidget(this.contact),
      body: Column(
        children: [
          ContactInfoWidget(contact: contact,),
          MessagesWidget(),
          MessagesFormWidget(this.contact),
        ],
      )
    );
  }
}
