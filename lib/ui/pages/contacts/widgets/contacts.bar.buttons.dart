import 'package:app_contacts_managment/bloc/contact.bloc.dart';
import 'package:app_contacts_managment/bloc/contacts.actions.dart';
import 'package:app_contacts_managment/ui/pages/contacts/widgets/contacts.button.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsBarButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContactsButtonItem(buttonLabel: "contacts",contactsEvent: new LoadAllContactsEvent(),),
          ContactsButtonItem(buttonLabel: "Students",contactsEvent: new LoadStudentsEvent(),),
          ContactsButtonItem(buttonLabel: "Developers",contactsEvent: new LoadDevelopersEvent(),),
        ],
      ),
    );
  }
}
