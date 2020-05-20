

import 'package:delaware_makes/forms/components/Image_upload_widget.dart';
import 'package:delaware_makes/forms/components/stylized_image_form_input.dart';
import 'package:delaware_makes/forms/form_entry_field.dart';
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/forms/form_model.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:delaware_makes/extensions/hover_extension.dart';




class FormOverlay extends StatefulWidget {
  //final Function(Map) onComplete;//final List<FormModel> forms;
FormOverlay({
    Key key,//  @required this.forms,//@required this.onComplete
  }) : super(key: key);
  @override
  _FormOverlayState createState() => _FormOverlayState();
}

class _FormOverlayState extends State<FormOverlay> { // int currentScreenNum = 0; // Map buffer;//AppState appstate;
   CustomLoader loader;
   FormManager formManager;
    final  List<GlobalKey> formKeys =  [GlobalKey<FormState>(),GlobalKey<FormState>(),GlobalKey<FormState>(),GlobalKey<FormState>()];


     @override
  void dispose() {
    // TODO: implement dispose
    formKeys.forEach((element) {
      element.currentState.dispose();
    });
    super.dispose();
  }
  

  
   @override
  void initState() {
    formManager= locator<FormManager>();
    loader = CustomLoader();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return (formManager.currentForm.formData.containsKey("formKey"))? Container(
      width: 400.0,
      child: Form(
       key: formKeys[formManager.currentScreenNum],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
              progressRow(),
              SizedBox( height: 10.0, ), // padForm(userInfoForm(),  h: 450.0),
              formTab() //FormTab(formModel: formManager.activeFormScreens[currentScreenNum],onDone: ()=>next(),),// screenWidgets[currentScreenNum]
          ]),
      ),
    ):Container(
      width: 400.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
            progressRow(),
            SizedBox( height: 10.0, ), // padForm(userInfoForm(),  h: 450.0),
            formTab() //FormTab(formModel: formManager.activeFormScreens[currentScreenNum],onDone: ()=>next(),),// screenWidgets[currentScreenNum]
        ]),
    )
    ;
  }

  Widget iconButton(int itemNum){
        bool current = itemNum==formManager.currentScreenNum;
        //currentScreenNum;
        bool done =formManager.activeFormScreens[itemNum].isCompleted;
      return  Container(
          decoration: BoxDecoration(
          border: Border.all(color:current?Colors.blue:done?Colors.green:Colors.grey, width: 2.0),
            shape:BoxShape.circle
            ),
          child:Tooltip(
            message: safeGet(key: "tooltip", map: formManager.activeFormScreens[itemNum].formData, alt: "Tooltip"),
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: IconButton(
                onPressed: (){
                  bool isAvailable=true;
                  for (int i = 0;i<itemNum; i++){
                    if(!formManager.activeFormScreens[itemNum].isCompleted)
                      isAvailable=false;
                  }
                  if(isAvailable){ setState(() { formManager.currentScreenNum=itemNum; }); }
                },
                icon: Icon(
                  safeGet(key: "icon", map: formManager.activeFormScreens[itemNum].formData, alt: Icons.reorder),
                   color: done?Colors.green:Colors.grey,)),
            ),
          )).showCursorOnHover.moveUpOnHover;
        }

  Widget progressRow(){
    List<Widget> icons =[];
    int i=0;
    formManager.activeFormScreens.forEach((form) {
      if(form.showIconBar){
        icons.add(iconButton(i));
      }i+=1;
    });return Container(
        decoration: BoxDecoration(
                color: Colors.white,//.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)), ),
        width: 400.0,
        child: Padding(padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: icons  ),
        ),
      );
  }

  Widget formTab(){
    //print(formManager.currentForm.formData);
    List<Widget> items = [];int i =0;
    formManager.currentForm.formData["items"].forEach((data) {
      
      items.add(line(data, i));
      items.add(SizedBox(height:safeGet(key: "b", map: data, alt: 0.0),));
      i+=1;
    });
    return 
    // formManager.currentForm.validate?
    // padForm(
    //   Center(
    //       child: Container(
    //         child: Form(
    //             key: formManager.currentForm.formKey,
    //           child: Column(
    //             children:items
    //       ))),
    //     ),
    //     h:safeGet(key: "h", map: formManager.currentForm.formData, alt: 450.0),
    // ):
    padForm(
      Center(
          child: Container(
            child: Column(
              children:items
          )),
        ),
        h:safeGet(key: "h", map: formManager.currentForm.formData, alt: 450.0),
    );
  }

  Widget line(Map data, int index){
     String t  = safeGet(key: "type", map: data, alt: "");
     String text  = safeGet(key: "text", map: data, alt: "");
     switch (t) {
        case "title": return formTitle(text); break;
        case "description":return formDescription(text); break;
        case "image":
          String url = safeGet(key: "url", map: data, alt: "");
          return  Container(
            height:200.0,
            child: Center(child: Container(width:200.0, height:200.0, 
                  child:Image.network((url!="")?url:placeHolderUrl)
                  ,),),
          );
          break;
        case "formEntryField":
              String key  = safeGet(key: "key", map: data, alt: "");
              int maxLines  = safeGet(key: "maxLines", map: data, alt: 1);
              var v = formManager.currentForm.getVal(key);
            //  print(v);
             // print(data);
             var f = new FormEntryField(
                  maxLines: maxLines,
                  initVal: v,
                  labelText: text,hint: text,
                  onChange:(val)=> setState(() { formManager.currentForm.setKey(key, val);} ));
            return f;
         break;

        case "imageInputForm":
              String key  = safeGet(key: "key", map: data, alt: "");
              String url=  safeGet(key: "url", map: data, alt: null);
              String name  = safeGet(key: "name", map: data, alt: "");
              var v = formManager.currentForm.formData["buffer"]["requests"][key];
              print(key);
              print(v);
             return StylizedImageFormInput(
                  initVal: v,
                  url: url,
                  name: name,//hint: text,
                  onChange:(val)=> setState(() { formManager.currentForm.formData["buffer"]["requests"][key]=val;}));
         break;

         case "imageUpload":
              String key  = safeGet(key: "key", map: data, alt: "");
              String url=  formManager.currentForm.getVal(key);
              String name  =formManager.currentForm.getVal("name");
            //  print(name);
             // bool  isActive =formManager.currentForm.getVal("isActive")??false;
             return ImageUploadWidget(
                  url: url,
                  imageName: name,
                  onCheckActive:(){
                    if (formManager.checkCode()){
                            print("validate");
                          //  formManager.currentForm.formKey.currentState.save();
                              return true;
                    }else{
                      print("error"); 
                     // customSnackBar(scaf, "Enter Valid Code");
                        return false;
                    } 
                  },
                  onImageUpload:(val)=> setState(() { 
                    formManager.currentForm.setKey(key, val);
                  }));
         break;
        case "dropdown":
              List ite = safeGet(key: "items", map: data, alt: (val){});
              String key  = safeGet(key: "key", map: data, alt: "");
              var v = formManager.currentForm.getVal(key);  //  Function(dynamic) onChange  = safeGet(key: "onChange", map: data, alt: (val){});
             return FormDropDown(
               options: ite, 
               onChange: (val)=> setState(() { formManager.currentForm.setKey(key, ite[val]); }) ,
               selectedIndex:ite.contains(v) ?ite.indexOf(v):0,
              );
         break;
        case "submitButton": // print(formManager.currentForm.formData["buffer"]);
          return MainUIButton(onPressed:() async{
            print("Hello Submit");
            if(!formManager.currentForm.validate){
              loader.showLoader(context);
              formManager.currentForm.isCompleted=true;
                formManager.next().then((value) {}).whenComplete((){
                   loader.hideLoader();
                   print(formManager.currentScreenNum);
                   if((formManager.currentScreenNum)>=formManager.activeFormScreens.length){
                      formManager.isActive=false;
                       
                    }else{
                      formManager.currentScreenNum += 1;
                    }
                    setState(() { 
                      print(formManager.currentScreenNum);
                     }); } 
                );
            }
  
            }, text: text,);
           break;
      case "expanded":
      return Expanded(child: Container(),);
       default:
       return Container();
     }
  }
}

          // else if (formManager.currentForm.formKey.currentState.validate()) {
          //        print("validate");
          //         formManager.currentForm.formKey.currentState.save();
          //          loader.showLoader(context);
          //         formManager.currentForm.isCompleted=true;
          //          formManager.next().then((value) {}).whenComplete((){
          //            print("Complete");
          //           Future.delayed(Duration(seconds: 1));
          //           loader.hideLoader();
          //           if((formManager.currentScreenNum)==formManager.activeFormScreens.length){
          //             formManager.isActive=false;
          //           }else{formManager.currentScreenNum += 1;}
          //           setState(() { 
                     
          //            }); } 
          //       );
                  
          //   }


 //  next()  {
  //    currentScreenNum += 1;
  //    if(currentScreenNum<formManager.activeFormScreens.length)setState(() { });
  //    else {
  //      Map buffers = {};
  //      formManager.activeFormScreens.forEach((element) {   // buffers[element.formData["id"]]=
  //      print(element.formData["buffer"]);
  //        element.formData["buffer"].forEach((k,v){
  //          buffers[k]=v;
  //        });
  //      });
  //      print(buffers);
  //      widget.onComplete(buffers);
  //    }
  //  }



  //  <Widget>[
  //             iconButton(0),
  //             iconButton(1),
  //             //iconButton(2),
  //             //iconButton(3)
  //           ],



  //   appstate = locator<AppState>();
  //   appstate.initRequest();
  //  // _selectedOrgType=0;
  //   if (appstate.currentUser != null) {
  //     appstate.buffer["userID"] = appstate.currentUser["id"];
  //     appstate.buffer["contactName"] = appstate.currentUser["name"];
  //     appstate.buffer["contactEmail"] = appstate.currentUser["email"];
  //    // screens[0] = true;
  //     currentScreenNum = 1;
  //   }


//  void _submitForm() {
//     loader.showLoader(context);
//     appstate.submitRequest().then((status) {}).whenComplete(
//       () {

//         loader.hideLoader();
//         setState(() {
//          // screens[3] = true;
//                 currentScreenNum += 1;
//         });
//       },
//     );
//   }
// class FormManager{
  
//   int currentScreenNum = 0;
//   Map buffer;

//   FormManager({this.forms});

  



//   }