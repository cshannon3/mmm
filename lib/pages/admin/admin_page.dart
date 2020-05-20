
import 'package:delaware_makes/forms/form_entry_field.dart';
import 'package:delaware_makes/pages/admin/components/resources_tile.dart';
import 'package:delaware_makes/pages/admin/components/user_tile.dart';
import 'package:delaware_makes/pages/admin/components/org_tile.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  AppState appState ;
  String key="orange";
  String entry="";
  String screen = "home";
  //!appState.isUserAdmin()
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
     appState = locator<AppState>();
    return key==entry?view():login();
   // Container(child: Center(child:Text("You ain't no admin")),):
    
  }

  Widget login(){
    return Container(
      child: Center(child: Column(
        children: [
          Text("Enter Code"),
          Container(width: 300.0,
          child: 
          FormEntryField(
            labelText: 'code',
              initVal:entry,
              onChange: (val)=>setState(()=>entry=val)
          )
          ,)
        ],
      ),)
    );
  }

  Widget view(){
    return 
    
     ListView(
      children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: formTitle("Admin Page", underline: true),
       ),
        Row(children: <Widget>[gSheet(), gDoc(),],),
      //  AdminOrg(),
        AdminUsers(),
        formTitle("Resources", underline: true),
        AdminResources()
      ]
    );
  }

  

saveAll() async{
  List vals = [];

 appState.dataRepo.getItemsWhere("orgs").forEach((element) async{
                 
   vals.add(requestToSheet(element,appState.dataRepo ));
 });
 print(vals);
 appState.dataRepo.addRowsToSheet(vals:vals, collectionName:"orgs");
                  
}


                
  Widget gSheet()=>Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      launch("https://docs.google.com/spreadsheets/d/1xEktD6kL8YOLqDeSmmpesUOfheb82m0qXrqMmbJq1uc/edit?usp=sharing");
                    },
                    icon: Icon(FontAwesomeIcons.file),
                  ),
                   IconButton(
                    onPressed: saveAll,
                     
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
               Text("Sheet")
            ],
          );
Widget gDoc()=>Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: (){
                      launch("https://docs.google.com/document/d/1uA3vdxTFktt6q3IFoQXtTyY6I_Tjmd9xI4lqVltWkko/edit?usp=sharing");
                    },
                    icon: Icon(FontAwesomeIcons.fileWord),
                  ),
                   IconButton(
                    onPressed: (){
                      },
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
               Text("Doc")
            ],
          );
}








