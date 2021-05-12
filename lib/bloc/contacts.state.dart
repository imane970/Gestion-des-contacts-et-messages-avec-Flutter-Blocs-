
import 'package:app_contacts_managment/bloc/contacts.actions.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/model/contact.model.dart';

class ContactsState{
  List<Contact> contacts;
  RequestState requestState;
  String errorMessage;
  ContactsEvent currentEvent;
  Contact currentContact;

  ContactsState({this.contacts, this.requestState, this.errorMessage, this.currentEvent, this.currentContact});
}