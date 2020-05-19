import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delaware_makes/apis/googleclient/gmanager/gmanager.dart';
import 'package:delaware_makes/apis/googleclient/gmanager/gsheets.dart' as g;
import 'package:delaware_makes/dummy_data.dart';
import 'package:delaware_makes/utils/secrets.dart' as secrets;
import 'package:delaware_makes/utils/utility.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';

// Data Repo Grabs the Google Sheet of interest,
// Gets the collections data from firebase
// passes down the relavent worksheet to each Custom Collection
//checks to see if needs to update collections data based on firebase or
// if needs to show any, updates sheet Gets collections from firebase
// todo avoid infinite recursion 

class DaRepo {
  final GManager gManager; // = GManager(secrets.credentials);
  DaRepo(this.gManager);
  g.Spreadsheet ss;
  Map<String, dynamic> collections = {};
  int count=0;


  /// `Gets All Model Data` and `Update` user
  /// IF `newUser` is true new user is created
  /// Else existing user will update with new values
    List getModelsData(String collectionName) {
    if(true)print("get $collectionName model ids");
    if(!collections.containsKey(collectionName))return [];
    //Map<String, dynamic> collections;
   // if (c == null || !c.containsKey("models") || c["models"] == null) return [];
    if(debug)print(collections[collectionName]["models"]);//.values.toList());//  List m= c["models"].values.toList();
    // INIT
    List out=[];
    collections[collectionName]["models"].forEach((modelID, modelFieldValsMap) {
      if(modelID !=null&& modelFieldValsMap!=null){
        Map<String ,dynamic> fieldValsMap = _checkFieldsForIDList(collectionName, modelFieldValsMap);
        if(fieldValsMap!=null && fieldValsMap!={})
            out.add(fieldValsMap);
      }
    });
    return out;
  }
  Map<String, dynamic> getModelData(String collectionName, String modelID) {
    Map res = {};
    if (!collections.containsKey(collectionName)) return res;
    if(debug){
      print("get model data, collection $collectionName, modelID: $modelID");
      print(collections[collectionName]["models"]);
    }
    if(collections[collectionName]["models"].containsKey(modelID)){
      res=collections[collectionName]["models"][modelID];
    } if(debug)print(res);
    return res;
  }

  Map<String, dynamic> _checkFieldsForIDList(String collectionName, Map modelFieldValMap){
    Map res ={};
    collections[collectionName]["fields"].forEach((fieldName, fieldData) {
      if(!modelFieldValMap.containsKey(fieldName)){
        var val = modelFieldValMap[fieldName];
        if(fieldData["type"]=="List-ForeignKey"){
          String fieldCollectionName=fieldData["typeInfo"];
          List<Map<String,dynamic>> linkedModelsList=[];
          try{
              val.forEach((linkedItemID) { //print(modelID);
                  Map<String, dynamic> linkedItemData=getModelData(fieldCollectionName, linkedItemID);
                  //if(linkedItemData!=null )
                    linkedModelsList.add(linkedItemData);
            });
            res[fieldName]=linkedModelsList;
          }
          catch(e){ res[fieldName]=[];}  
        } else res[fieldName]=val;
      }
    });
    return res;
  }


  dynamic _parseField(Map field,dynamic val, {String linkedFieldName}) {

    if (val is List && field["type"].contains("List")) {
     // print("list");
       String col =field["type"].split("-")[1];
      if(debug){
        print(field["typeInfo"]);
        print(field["type"]);
        print(col);
        print(val);
      }
      
      List lv = val;
      if(lv==[]) return [];
      if(col!="ForeignKey")return lv;
      List output=[];
      print("Foreign Key : $lv");
      val.forEach((modelID) {
        print(modelID);
        Map modelData=getModelData(field["typeInfo"], modelID);
        if(modelData !=null || modelData.isNotEmpty)
          output.add(modelData);
      });
      if(debug){
        print(lv);
        print(output);
      }
      return output;
    } else {
      return val;
      // // recursively get linked data
      // switch (field["type"]) {
      //   case "UniqueKey":
      //     return val;
      //     break;
      //   // case "ForeignKey":
      //   //   if (linkedFieldName != null) {
      //   //     return getVal(field["typeInfo"], val, linkedFieldName);
      //   //   }
      //   //   return val;
      //    // break;
      //   default:
      //     return parseType(field["type"], val);
      //     break;
     // }
    }
  }
}




class CustomParser {
  CustomParser();


  parseList(){

  }

  parseString(){

  }
  parseDouble(){
    
  }


}



Map<String, dynamic> defaultEnum = {};
