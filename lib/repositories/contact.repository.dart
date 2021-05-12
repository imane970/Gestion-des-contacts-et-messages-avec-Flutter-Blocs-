import 'dart:math';

import 'package:app_contacts_managment/model/contact.model.dart';

class ContactsRepository{

  Map<int, Contact> contactList = {
    1:Contact(id: 1,nom: "mehdi",profile: "MO",score: 123, type: "Student"),
    2:Contact(id: 2,nom: "anas",profile: "YO",score: 456, type: "Student"),
    3:Contact(id: 3,nom: "ali",profile: "HO",score: 75, type: "Developer"),
    4:Contact(id: 4,nom: "mekouar",profile: "AL",score: 14, type: "Developer"),
    5:Contact(id: 5,nom: "yassine",profile: "FL",score: 79, type: "Developer"),
    6:Contact(id: 6,nom: "mohamed",profile: "EL",score: 78, type: "Developer"),
    7:Contact(id: 7,nom: "ahmed",profile: "YP",score: 45, type: "Student"),
    8:Contact(id: 8,nom: "karim",profile: "ER",score: 53, type: "Student"),
  };


//communiquer avec le backend
  Future<List<Contact>> allContacts() async{
    var futur = await Future.delayed(Duration(seconds: 1));
    
    //generer un nombre aleatoire entre 0 et 10
    int rnd = new Random().nextInt(10);
    if (rnd > 3) {
      return contactList.values.toList();
    }else{
      throw new Exception("Internet Error");
    }
  }

  Future<List<Contact>> contactsByType(String type) async{
    var futur = await Future.delayed(Duration(seconds: 1));
    //generer un nombre aleatoire entre 0 et 10
    int rnd = new Random().nextInt(10);
    if (rnd > 3) {
      return contactList.values.toList().where((element) => element.type==type).toList();
    }else{
      throw new Exception("Internet Error");
    }
  }



}