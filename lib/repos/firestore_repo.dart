
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
      
      

saveToFirebase({@required String collectionName,String id, dynamic item, Map itemMap}) async{
    Map m = itemMap??item.toMap();
    await Firestore.instance
          .collection(collectionName)
          .document(id)
          .setData(m);
  }

Future<Map<String, dynamic>> getFirebaseItem({@required String collectionName,String id,}) async{
   // Map m = itemMap??item.toMap();
    DocumentSnapshot ds =  await Firestore.instance
     .collection(collectionName)
     .document(id)
        .get();
    return ds.data;
  }


updateField({@required String documentPath, @required String fieldName, @required dynamic newValue}){
  final DocumentReference postRef = Firestore.instance.document(documentPath);
  Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(postRef);
    if (postSnapshot.exists) {
      await tx.update(postRef, <String, dynamic>{fieldName: newValue});
    }
  });
}

// Future<List> getAll({@required String collectionName}) async{
//   List result=[];
//  await Firestore.instance.collection(collectionName).snapshots().listen((onData) {
//         onData.documents.forEach((dataItem) {
//          if(dataItem.data!=null)result.add(dataItem.data);
//         });
//   }).
//   return result;
// }
     //   .then((DocumentSnapshot ds)
  //   await Firestore.instance
  //         .collection(collectionName)
  //         .document(id)
  //         .setData(m);
  // }