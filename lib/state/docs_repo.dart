
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delaware_makes/apis/googleclient/gmanager/gdocs.dart';
import 'package:delaware_makes/apis/googleclient/gmanager/gmanager.dart';
import 'package:flutter/material.dart';

String token = "_";

// Doc Repo Grabs the google doc of interest,
// Gets the documents data from firebase

class DocsRepo{
  GManager gManager;
  GoogleDocInfo doc=GoogleDocInfo();
  String content = "1uA3vdxTFktt6q3IFoQXtTyY6I_Tjmd9xI4lqVltWkko";

  DocsRepo();

  // add refresh and integration with firebase
  initialize({@required GManager gmanager}) async {
   // print("Hello");
    gManager = gmanager;
    doc=GoogleDocInfo();
    
     loadDoc();
     await Future.delayed(Duration(milliseconds: 100));
     print(doc.sections);
    // doc= await gManager.getDocData(
    //   docTitle: "Website Content",
    //   documentId:content
    // ); 
  }

loadDoc() async {
    Firestore.instance.collection("texts").snapshots().listen((onData) {
      onData.documents.forEach((dataItem) {
        if (dataItem.data != null) {

          Map<String, dynamic> map = dataItem.data;
          print(map);
          doc.sections[map["id"]]= map["text"];
        }
      });
    });
  }
}


  // doc.sections.forEach((key, value) {
    //   print(key);
    //   print(value);
    // });
    //print(doc.sections.keys);