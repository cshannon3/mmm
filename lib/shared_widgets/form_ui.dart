import 'package:de_makes_final/utils/utility.dart';
import 'package:flutter/material.dart';


  Widget formEntryField({
    @required String labelText,
    String hint, 
    String emptyText,
    double w,
    Function(dynamic) onChange,
      bool isNumber=false,
    bool isPassword = false
    }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width:flexW(w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
       // controller: controller,
        keyboardType:  isNumber?TextInputType.number:TextInputType.text,
        //TextInputType.emailAddress,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal,
        ),
        onChanged: onChange,
          validator: (value) =>
            (value.isEmpty) ? emptyText ?? 'Please enter $labelText' : null,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            borderSide: BorderSide(color: Colors.blue),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }
Widget formTextField(
        {@required String labelText,
        double w,
        String emptyText,
        Function(dynamic) onChange,
        bool isNumber=false,
        bool obscure = false}) =>
    Container(
       width:flexW(w),
      child: TextFormField(
          decoration: InputDecoration(labelText: labelText),
          keyboardType: isNumber?TextInputType.number:TextInputType.text,
          obscureText: obscure,
          validator: (value) =>
              (value.isEmpty) ? emptyText ?? 'Please enter $labelText' : null,
          onChanged: onChange),
    );

Widget formTitle(String title, {bool underline = false}) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20.0,
                decoration:
                    underline ? TextDecoration.underline : TextDecoration.none),
            textAlign: TextAlign.center,
          )),
    );
Widget formDescription(String title, {bool underline = false , bool small=false}) => Container(
  width: double.infinity,
  child:   Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize:small?14.0:16.0),
      ),
);

// Widget formSave(String text, {@required double w,Function() onSave})=>Container(
//       width: (w>600.0)?450:w-30.0,
//       margin: EdgeInsets.symmetric(vertical: 35),
//       child: FlatButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         color:Colors.orange,
//         onPressed:onSave,
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         child: Text(text, style:TextStyle(color: Colors.white)),
//       ),
//     );
  
// Widget formSave(String text, {Function() onSave}) => Container(
//     padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//     child: RaisedButton(onPressed: onSave, child: Text(text)));

class FormDropDown extends StatelessWidget {
  final List options;
  final int selectedIndex;
  final Function(int) onChange;
  final String title;

  FormDropDown({
    Key key, 
    @required this.options, 
    this.selectedIndex=0, 
    this.title="",
    @required this.onChange
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        hint: new Text(title),
        items: List.generate(
            options.length,
            (index) => DropdownMenuItem(
                  child: new Text(options[index]),
                  value: index,
                )),
        value: selectedIndex,
        onChanged:onChange,
        isExpanded: true,
      );
  }
}
