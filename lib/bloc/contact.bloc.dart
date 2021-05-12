import 'package:app_contacts_managment/bloc/contacts.actions.dart';
import 'package:app_contacts_managment/bloc/contacts.state.dart';
import 'package:app_contacts_managment/bloc/messages/messages.actions.dart';
import 'package:app_contacts_managment/bloc/messages/messages.bloc.dart';
import 'package:app_contacts_managment/enums/enums.dart';
import 'package:app_contacts_managment/model/contact.model.dart';
import 'package:app_contacts_managment/repositories/contact.repository.dart';
import 'package:bloc/bloc.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState>{

  ContactsRepository contactsRepository;

  MessagesBloc messagesBloc;

  ContactsBloc({initialState, this.contactsRepository, this.messagesBloc}) : super(initialState);

  @override
  Stream<ContactsState> mapEventToState(ContactsEvent event) async*{
    if(event is LoadAllContactsEvent){
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event
      );

      try{
        List<Contact> data = await contactsRepository.allContacts();
        yield ContactsState(contacts: data, requestState: RequestState.LOADED, currentContact: data[0]);
        messagesBloc.add(new MessagesByContactEvent(data[0]));

      }catch(e){
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event
        );
      }
    }else if(event is LoadStudentsEvent){
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event
      );

      try{
        List<Contact> data = await contactsRepository.contactsByType("Student");
        yield ContactsState(contacts: data, requestState: RequestState.LOADED);
      }catch(e){
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event
        );
      }
    }else if(event is LoadDevelopersEvent){
      yield ContactsState(
          contacts: state.contacts,
          requestState: RequestState.LOADING,
          currentEvent: event
      );

      try{
        List<Contact> data = await contactsRepository.contactsByType("Developer");
        yield ContactsState(contacts: data, requestState: RequestState.LOADED);
      }catch(e){
        yield ContactsState(
            contacts: state.contacts,
            requestState: RequestState.ERROR,
            errorMessage: e.message,
            currentEvent: event
        );
      }
    }


  }
  
  
}