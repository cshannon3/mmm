
import 'package:delaware_makes/forms/components/stylized_image_form_input.dart';
import 'package:delaware_makes/forms/form_entry_field.dart';
import 'package:delaware_makes/forms/form_model.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';

class FormTab extends StatefulWidget {
  final FormModel formModel;
  final Function() onDone;
  FormTab({
    Key key, 
    @required this.formModel,
    @required this.onDone
  }) : super(key: key);
  @override
  _FormTabState createState() => _FormTabState();
}

class _FormTabState extends State<FormTab> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];int i =0;
    widget.formModel.formData["items"].forEach((data) {
      items.add(line(data, i));
      items.add(SizedBox(height:safeGet(key: "b", map: data, alt: 0.0),));
      i+=1;
    });
    return padForm(
      Center(
          child: Container(
            child: Form(
                key: widget.formModel.formKey,
              child: Column(
                children:items
          ))),
        ),
        h:safeGet(key: "h", map: widget.formModel.formData, alt: 450.0),
    );
  }




  Widget line(Map data, int index){
     String t  = safeGet(key: "type", map: data, alt: "");
     String text  = safeGet(key: "text", map: data, alt: "");
     switch (t) {
        case "title": return formTitle(text); break;
        case "description":return formDescription(text); break;
        case "formEntryField":
              String key  = safeGet(key: "key", map: data, alt: "");
              int maxLines  = safeGet(key: "maxLines", map: data, alt: 1);
              var v = widget.formModel.getVal(key);
             return FormEntryField(
                  maxLines: maxLines,
                  initVal: v,
                  labelText: text,hint: text,
                  onChange:(val)=> setState(() { widget.formModel.setKey(key, val);} ));
         break;
        case "imageInputForm":
              String key  = safeGet(key: "key", map: data, alt: "");
              String url=  safeGet(key: "url", map: data, alt: null);
              String name  = safeGet(key: "name", map: data, alt: "");
              var v = widget.formModel.getVal(key);
             return StylizedImageFormInput(
                  initVal: v,
                  url: url,
                  name: name,//hint: text,
                  onChange:(val)=> setState(() { widget.formModel.setKey(key, val);}));
         break;
        case "dropdown":
              List ite = safeGet(key: "items", map: data, alt: (val){});
              String key  = safeGet(key: "key", map: data, alt: "");
              var v = widget.formModel.getVal(key);  //  Function(dynamic) onChange  = safeGet(key: "onChange", map: data, alt: (val){});
             return FormDropDown(
               options: ite, 
               onChange: (val)=> setState(() { widget.formModel.setKey(key, ite[val]); }) ,
               selectedIndex:ite.contains(v) ?ite.indexOf(v):0,
              );
         break;
        case "submitButton": // print(widget.formModel.formData["buffer"]);
          return MainUIButton(onPressed:(){
            if (widget.formModel.formKey.currentState.validate()) {
                  widget.formModel.formKey.currentState.save();
                  widget.formModel.isCompleted=true;
                  widget.onDone();}}, text: text,);
           break;
       default:
       return Container();
     }

  }

    Widget padForm(Widget widget, {double h = 400}) => Center(
    child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        width: 400.0,
        height: h,
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: widget)));
}





            // formEntryField(
            //              initVal:  safeGet(key:designData["id"], map:appstate.buffer["requests"], alt:0).toString(),
            //             labelText:'quantity',
            //           onChange: (val) {
            //             print(val);
            //             int v = int.tryParse(val);
            //             print(val);
            //             if (v != null) {
            //               setState(() {
            //                 if (appstate.buffer["requests"].containsKey(designData["id"])) {
            //                   appstate.buffer["requests"][designData["id"]] = v;
            //                 } else {appstate.buffer["requests"][designData["id"]] = v;}
            //               });
            //             }
            //           })),


  // Widget requestForm() {
  
  // return  Form(
  //   key:_requestFormKey,
  //   child: Column(children: [
  //         formTitle("Request Info"),
  //          SizedBox(
  //               width: 50.0,
  //             ),
  //         ...appstate.dataRepo.getItemsWhere("designs",
  //             fieldFilters: {"isOffered": true}).map((designData) {
  //           return 
  //         }).toList(),
  //          Expanded(child: Container(),),
  //           MainUIButton(
  //             onPressed: (){
  //                if (_requestFormKey.currentState.validate()) {
  //                _requestFormKey.currentState.save();
  //               setState(() {
  //                 screens[2] = true;
  //                 currentScreenNum += 1;
  //               });
  //                }
  //             },
  //             text:"Next"),
  //             SizedBox(
  //           height:10.0,
  //         ),
            
  //       ]),
  // );
  // }