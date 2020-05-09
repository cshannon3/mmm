import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:de_makes_final/apis/googleclient/gmanager/gmanager.dart';
import 'package:de_makes_final/apis/googleclient/gmanager/gsheets.dart' as g;
import 'package:de_makes_final/dummy_data.dart';
import 'package:de_makes_final/utils/secrets.dart' as secrets;
import 'package:de_makes_final/utils/utility.dart';
import 'package:de_makes_final/utils/utils.dart';
import 'package:flutter/material.dart';

// Data Repo Grabs the Google Sheet of interest,
// Gets the collections data from firebase
// passes down the relavent worksheet to each Custom Collection
//checks to see if needs to update collections data based on firebase or
// if needs to show any, updates sheet Gets collections from firebase
// todo avoid infinite recursion 
class DataRepo {
  final GManager gManager;
  // = GManager(secrets.credentials);
  DataRepo(this.gManager);
  g.Spreadsheet ss;
  Map<String, dynamic> collections = {};

  initialize({bool updateFromSheet = false}) async {
    print("start");
    // Gets spreadsheet
    ss = await gManager.spreadsheet(secrets.spreadsheetId);
    // Get collections
    Firestore.instance.collection("metadata").snapshots().listen((onData) {
      onData.documents.forEach((dataItem) {
        if (dataItem.data != null) {
          print(dataItem.data);
          var map = dataItem.data;
          if (map["active"]) {
            // Set spreadsheet to collection//  CustomCollection newCollection = CustomCollection.fromJson(map);
            var newCollection = map;
            newCollection["sheet"] = ss.worksheetByTitle(map["sheetName"]);  // newCollection.initialize(updateFromSheet);
            loadFieldsFromSheet(newCollection);
            collections[newCollection["collectionName"]] = (newCollection);
          }
        }
      });
    });
  }

  initializeDummy({bool updateFromSheet = false}) async {
    print("start");
    collections = dummyCollections;
    // Gets spreadsheet
  }

  loadFieldsFromSheet(Map c) async {
    var v = await c["sheet"].values.allColumns(fromColumn: 2, length: 5);
    for (int i = 1; i < v.length; i++) {
      print(v[i]);
    }
  }

  // // GETTERS
  // dynamic getVal(String collectionName, String modelID, String fieldName,
  //     {String linkedFieldName}) {
  //   return _parseField(_getField(collectionName, modelID, fieldName),
  //       linkedFieldName: linkedFieldName);
  // }


  Map getModelData(String collectionName, String modelID) {
    Map res = {};
    //CustomCollection
    Map c = _getCollection(collectionName);
    if (c == null) return res;
    if(debug){
      print("get model data, collection $collectionName, modelID: $modelID");
    }
    res = _parseFields(c["fields"], c["models"][modelID]);
    if(debug)print(res);
    return res;
  }


  List getModelsData(String collectionName) {
    if(debug)print("get $collectionName model ids");
    Map c = _getCollection(collectionName);
    if (c == null || !c.containsKey("models") || c["models"] == null) return [];
    if(debug)print(c["models"]);//.values.toList());//  List m= c["models"].values.toList();
    List out=[];
    c["models"].forEach((modelID, v) {
      print(modelID);
      out.add(_parseFields(c["fields"], v));
      // out.add(getModelData(collectionName, modelID));
     // out.add(getModelData(collectionName, modelID));
    });
    return out;
    //c["models"].values.toList();
  }


/*
Save
*/
// TODO
 saveModel({@required String collectionName,@required Map map, bool toSheets=true, bool toFirestore=true}){
   // 
   if(collections.containsKey(collectionName)){

   }
 }
  Map _getField(String collectionName, String modelID, String fieldName) {
    Map c = _getCollection(collectionName);
    if (c == null) return null;
    if (!c["models"].containsKey(modelID)) return null;
    Map f = tryGet(key: fieldName, map: c["fields"]);
    dynamic v = tryGet(key: fieldName, map: c["models"][modelID].values);
    if (v == null || f == null) return null;
    Map out = {};
    f.forEach((key, value) {
      out[key] = value;
    });
    out["value"] = v;
    // get Field from collection
    return out;
  }

  Map _getCollection(String collectionName) =>
      tryGet(key: collectionName, map: collections);

  Map _parseFields(Map fields, Map modelData){
    Map res ={};
    if(debug){
      print("parse Fields");
      print(fields);
      print(modelData);
    }
    fields.forEach((fieldName, fieldData) {
      dynamic fieldValue = tryGet(key: fieldName, map: modelData);
      res[fieldName] = _parseField(fieldData, fieldValue);
    });
    return res;
  }

  dynamic _parseField(Map field,dynamic val, {String linkedFieldName}) {

    if (field["type"].contains("List")) {
      print("list");
       String col =field["type"].split("-")[1];
      if(debug){
        print(field["typeInfo"]);
        print(field["type"]);
        print(col);
      }
      List lv = val;
      if(lv==[]) return [];
      if(col!="ForeignKey")return lv;
      List output=[];
      val.forEach((modelID) {
        print(modelID);
        Map modelData=getModelData(field["typeInfo"], modelID);
        if(modelData.isNotEmpty)
          output.add(modelData);
      });
      if(debug){
        print(lv);
        print(output);
      }
      return output;
    } else {
      // recursively get linked data
      switch (field["type"]) {
        case "UniqueKey":
          return val;
          break;
        // case "ForeignKey":
        //   if (linkedFieldName != null) {
        //     return getVal(field["typeInfo"], val, linkedFieldName);
        //   }
        //   return val;
         // break;
        default:
          return parseType(field["type"], val);
          break;
      }
    }
  }
}

dynamic tryGet({@required String key, @required Map map}) {
  try {
    if (map.containsKey(key)) return map[key];
  } catch (e) {
    print("error getting $key from map");
  }
  return null;
}


  // Map<String, dynamic> getFullModelData(String collectionName, String modelID) {
  //   Map<String, dynamic> res = {};
  //   //CustomCollection
  //   Map c = _getCollection(collectionName);
  //   if (c == null) return res;
  //   c["fields"].forEach((fieldName, field) {
  //     dynamic v = tryGet(key: fieldName, map: c["models"][modelID].values);
  //     res[fieldName] = _parseField(field.copyWith(modelValue: v));
  //   });
  //   print(res);
  //   return res;
  // }
  // List<String> getModelIDs(String name) {
  //   if(debug)print("get $name model ids");
  //   Map c = _getCollection(name);
  //   if (c == null || !c.containsKey("models") || c["models"] == null) return [];
  //   if(debug)print(c["models"]);
  //   return c["models"].keys;
  // }


  // List getDataFromIDs(String collectionName, List ids) {
  //   if(debug)print("get $collectionName model ids");
  //   Map c = _getCollection(collectionName);
  //   if (c == null || !c.containsKey("models") || c["models"] == null) return [];
  //   List res =[];
  //   ids.forEach((id) { 
  //     var m = safeGet(key: id, map: c["models"], alt: null);
  //     if(m!=null)
  //         res.add(m);
  //   });
  //   if(debug)print(res);
  //   return res;
  // }

// case "double":
//           return (val is String) ? double.tryParse(val) : val;
//           break;
//         case "int":
//           return (val is String) ? int.tryParse(val) : val;
//           break;
//         case "String":
//           return val;
//           break;
//         case "bool":
//           return val;
//           break;
//         case "DateTime":
//           return val;
//           break;
// dynamic parseField(
//   Map data, {
//   String reqType,
//   dynamic ifNull,
//   bool nullAllowed = true,
// }) {
//   if (data['value'] == null) {
//     return null;
//   }
//   switch (data["type"]) {
//     case "double":
//       return double.tryParse(data["value"]);
//       break;
//     case "int":
//       return int.tryParse(data["value"]);
//       break;
//     case "String":
//       return data["value"];
//       break;
//     case "List":
//       return new List.from(data["value"]) ?? [];
//       break;
//     default:
//       return data["value"];
//       break;
//   }
// }

// dynamic onNull({String type, dynamic ifNull, bool nullAllowed}) {
//   if (nullAllowed) return null;
//   if (ifNull != null) return ifNull;
//   return ""; //TODO
// }

// CustomField _getField(
//     String collectionName, String modelID, String fieldName) {
//   CustomCollection c = _getCollection(collectionName);
//   if (c == null) return null;
//   if (!c.models.containsKey(modelID)) return null;
//   CustomField f = tryGet(key: fieldName, map: c.fields);
//   dynamic v = tryGet(key: fieldName, map: c.models[modelID].values);
//   if (v == null || f == null) return null;
//   // get Field from collection
//   return f.copyWith(modelValue: v);
// }

// CustomCollection _getCollection(String collectionName) =>
//     tryGet(key: collectionName, map: collections);

// List<String> getModelIDs(String name) {
//   print("get $name model ids");
//   CustomCollection c = _getCollection(name);
//   if (c == null || c.models == null) return [];
//   return c.models.keys;
// }
// // TODO
// uploadToSheet() async {
//   print("start");
//   // Gets spreadsheet
//   ss = await gManager.spreadsheet(secrets.spreadsheetId);
//   // Get collections
//   g.Worksheet sheet=ss.worksheetByTitle("Org");

//   Firestore.instance.collection("orgs").snapshots().listen((onData) {
//     onData.documents.forEach((dataItem) {
//       if (dataItem.data != null) {
//         print(dataItem.data);
//         var map = dataItem.data;
//         if (map["active"]) {
//           // Set spreadsheet to collection
//           CustomCollection newCollection = CustomCollection.fromJson(map);
//           newCollection.sheet = ss.worksheetByTitle(map["sheetName"]);
//           // newCollection.initialize(updateFromSheet);
//           loadFieldsFromSheet(newCollection);
//           collections[newCollection.collectionName] = (newCollection);
//         }
//       }
//     });
//   });
// }
////
///
///
// class CustomCollection {
//   String modelName;
//   String collectionName;
//   String spreadsheetName;
//   Map<String, CustomModel> models;
//   g.Worksheet sheet;
//   Map<String, CustomField> fields;
//   // static const String URL ="https://script.google.com/macros/s/AKfycbyjlBSajhxT6mpKfHw2NowayEX3G__JNIJiLVzfc1zV02ewHmk/exec";

//   CustomCollection(
//       {this.modelName,
//       this.collectionName,
//       this.spreadsheetName,
//       this.models,
//       this.fields,
//       this.sheet});

//   CustomCollection.fromJson(var map)
//       : modelName = map["name"] ?? "",
//         collectionName = map["collectionName"] ?? "",
//         spreadsheetName = map["sheetName"] ?? "";
// }

// class CustomModel {
//   final String id;
//   Map<String, dynamic> values;
//   CustomModel({this.id, this.values});
// }

// class CustomField {
//   String fieldName;
//   String displayName;
//   String type;
//   String typeInfo;
//   String defaultValue;
//   String description;
//   String status;
//   dynamic value;
//   CustomField(
//       {this.fieldName,
//       this.displayName,
//       this.type,
//       this.typeInfo,
//       this.defaultValue,
//       this.description,
//       this.status,
//       this.value});

//   CustomField copyWith({@required dynamic modelValue}) {
//     return CustomField(
//         fieldName: fieldName,
//         displayName: displayName,
//         type: type,
//         typeInfo: typeInfo,
//         defaultValue: defaultValue,
//         description: description,
//         status: status,
//         value: modelValue);
//   }
// }

// initialize({bool updateFromSheet=false})async {
//   // First check spreadsheet for changes to fields
//   // Second Handle any changes to spreadsheet
//   // wait to get all only if needed
//   var v = await sheet.values.allColumns(fromColumn:2, length:5);
// //  print(h);
//   for(int i =1; i<v.length;i++){
//     print(v[i]);
//   }
// }
// CustomField getField(String modelID, String fieldName){
//   if(models.containsKey(modelID) && fields.containsKey(fieldName)){
//     return fields[fieldName].copy(value:tryGet(key:fieldName, map:models[modelID].values));
//   }
//   return null;
// }

// dynamic tryGet({@required String name, String type}) {
//   if (fields.containsKey(name)){
//     return parseField(fields[name]);
//   }
//  // return
// } //this.data

/*
Each model will have a list of fields that contain
all the metadata for the model type + the current value, 

Models are made at the collection level so that metadata info can get passed in with them...
Everything is accessed from the DataRepo level so that foreign keys can get replaces with data when the object is being called


models functions include
dynamic getValue() 
setValue
 {
   CollectionName:{
     "models":[
       "modelID":{
         "fields:
            [
              "fieldName":{
                "fieldName":"fieldName",
                "displayName":"displayName",
                "type":"type",
                "typeInfo":"typeInfo",
                "defaultValue":
                "description":
                "status":
                "value":
              }
            
            ]
       },
     ]
     
   }
 }

*/

// /*
// FIRESTORE
// */
//   getAllFromFirestore() {}
//   CustomModel getOneFromFirestore() {}
//   updateOneFromFirestore() {}
//   saveOneToFirestore() {}
//   saveAllToFirestore() {}
//   deleteOneFromFirestore() {}
// /*
// Google Sheets
// */
//   checkGoogleSheets() {}
//   updateMetaData() {}
//   toGoogleSheet() {}
//   fromGoogleSheet() {}
// /*
// General
// */
//   toCustomModel() {}

//   toJson() {

//   }
//  CustomModel getOne(String id) {}
//   List<CustomModel> getList(List<String> ids) {}

// dynamic emptyVal(String type ) {
//   if(data['value']==null){
//     return null;
//   }
//   switch (data["type"]) {
//     case "double":
//       return double.tryParse(data["value"]);
//       break;
//     case "int":
//       return int.tryParse(data["value"]);
//       break;
//     case "String":
//       return data["value"];
//       break;
//     case "List":
//       return new List.from(data["value"])??[];
//       break;
//     default:
//       return data["value"];
//       break;
//   }
// }

Map<String, dynamic> defaultEnum = {};
