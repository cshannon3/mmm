import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:de_makes_final/apis/googleclient/gmanager/gmanager.dart';

String token = "_";

// Doc Repo Grabs the google doc of interest,
// Gets the documents data from firebase

class DocsRepo{
  final GManager gManager;
  // = GManager(secrets.credentials);
  DocsRepo(this.gManager);
  initialize() async {
    print("start");
    // Gets spreadsheet
 // Get collections
    Firestore.instance.collection("metadata").snapshots().listen((onData) {
        onData.documents.forEach((dataItem) {
         if(dataItem.data!=null){
           print(dataItem.data);
           var map = dataItem.data;
           if (map["active"]){
             // Set spreadsheet to collection
         
           }
         }
        });
  });
  }
}
