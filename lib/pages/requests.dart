
// import 'package:de_makes_final/shared_widgets/buttons.dart';
// import 'package:de_makes_final/shared_widgets/form_ui.dart';
// import 'package:de_makes_final/utils/utility.dart';
// import 'package:flutter/material.dart';
// //https://medium.com/flutter-community/realistic-forms-in-flutter-part-1-327929dfd6fd


// class RequestPage extends StatefulWidget {
//   //final DataController dataController;
//   final Function() onDone;

//   RequestPage({Key key, 
//  // this.dataController, 
//   this.onDone})
//       : super(key: key);

//   @override
//   _RequestPageState createState() => _RequestPageState();
// }

// class _RequestPageState extends State<RequestPage> {
//   bool newOrgOpen = true;
//   String orgID;
//   String displayName = "";
//   String email = "";
//  // final _org = SimpleOrg();
//  // List<Request> requests = [];
//   List<String> req = [];
//   int _selectedOrgType = 0;
//   List<int> orders = [0,0];
//   List org = [
//     ""
//     "medicalFacility",
//     "doctorsOffice",
//     "nursingHome",
//     "essentialBiz",
//     "other"
//   ];

//    Widget requestDesign(Design design) {
//     return Column(children: openReqWidgets(design),);
//   }

            
 
//   List<Widget> openReqWidgets(Design design){
//       int index;
//       if (requests.any((request) => request.designID == design.id)) {
//         index = requests.indexWhere((request) => request.designID == design.id);
//       } else {
//       //  requests.add( widget.dataController.newRequest(orgID: orgID, designID: design.id,));
//         index = requests.length - 1;
//       }
//       return  [ 
//         formTitle(design.name),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 100.0,
//               child: Center(child: imageFromPath(design.imagePath)),
//             ),
//           ),
//           TextFormField(
//             decoration: InputDecoration(labelText: '# items requested'),
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter quantity';
//               }
//               if (int.tryParse(value) == null) return 'Please enter number';
//             },
//             onChanged: (val) => setState(() {
//                 requests[index].quantityRequested = int.tryParse(val) ?? 0;
//                 if(design.id=="faceshield")_org.sheilds=int.tryParse(val) ??0;
//                 else _org.earsavers=int.tryParse(val)??0 ;
//                // _org.
//             }
//           )),
//         ];
//     }
  
//   @override
//   Widget build(BuildContext context) {
//     //var designRepo = locator<DesignRepo>();
//     return Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0),
//           color: Colors.white,
//         ),
//         padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
//         child: Stack(
//           children: <Widget>[
//             Container(
//               height: double.infinity,
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView(
//                   children: <Widget>[
//                     formTitle("Contact Info"),
//                         formTextField(
//                             labelText: 'Name',
//                             onChange: (val) => setState(() => _org.name = val)),
//                         formTextField(
//                             labelText: 'Email',
//                             onChange: (val) => setState(() => _org.email = val)),
                  
//               formTitle("Organization Info"),
//                 formDescription("Organization Type:"),
//                 FormDropDown(
//                   title: "Select From List",
//                   options: org,
//                   selectedIndex: _selectedOrgType,
//                   onChange: (value) {
//                     setState(() {
//                       _selectedOrgType = value;
//                       _org.orgType = org[_selectedOrgType];
//                     });
//                   },
//                 ),
//                 (_selectedOrgType == 3) // If other enter org type
//                     ? formTextField(
//                         labelText: 'Organization Type',
//                         onChange: (val) => setState(() => _org.orgType = val))
//                     : Container(),
//                 formTextField(
//                     labelText: 'Organization Name',
//                     onChange: (val) => setState(() => _org.orgName = val)),
//                 formTextField(
//                     labelText: 'Organization Address',
//                     onChange: (val) => setState(() => _org.address = val)),
 
//      Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//               width: double.infinity,
//               child: Text(
//                 "Requests",
//                 style: TextStyle(
//                     fontSize: 20.0, decoration: TextDecoration.underline),
//                 textAlign: TextAlign.center,
//               )),
//         )]..addAll(
         
//                         designRepo.getDesigns().where((des) => des.approved)
//                         .map((des) => requestDesign(des)).toList())
//                      ..add(formSave("Save",
//                      onSave: (){
                    
                     
//                          widget.onDone();
//                         }
//                      )
//                      )))),
//             closeIcon(onPressed:widget.onDone)
//           ]
//         ));
//   }
// }



