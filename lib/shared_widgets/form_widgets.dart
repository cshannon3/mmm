//import 'package:de_makes_final/utils/utility.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

import 'package:delaware_makes/extensions/hover_extension.dart';






 Widget formInputSimple(
   String labelText,
    Function(dynamic) onChange,)=> TextFormField(
        onChanged: onChange,
    decoration: InputDecoration(labelText: labelText),
    validator: (value) {
      if (value.isEmpty) {
          return 'Enter $labelText';
      }
    },
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

Widget formDescription(String title,
        {double w, bool underline = false, bool small = false, String tooltip,}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0),
      child: Container(
        width: double.infinity,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: small ? 14.0 : 16.0, color: Colors.grey[600]),
                ),
              ),
              tooltip==null?SizedBox():Tooltip(
                margin: EdgeInsets.symmetric(horizontal:50.0),
                message: tooltip, child:
              Icon(Icons.info_outline, color: Colors.grey[500],))
            ],
          ),
        ),
    )
    ;


class FormDropDown extends StatelessWidget {
  final List options;
  final int selectedIndex;
  final Function(int) onChange;
  final String title;

  FormDropDown(
      {Key key,
      @required this.options,
      this.selectedIndex = 0,
      this.title = "",
      @required this.onChange})
      : super(key: key);

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
      onChanged: onChange,
      isExpanded: true,
    );
  }
}


// Widget formDescription(String title,
//         {double w, bool underline = false, bool small = false, String tooltip}) =>
//     Padding(
//       padding:  (w==null)?EdgeInsets.all(8.0):
//         EdgeInsets.symmetric(horizontal: 30, vertical: 20.0),
//     child: Container(
//       width: double.infinity,
//         child: Text(
//           title,
//           textAlign: TextAlign.left,
//           style: TextStyle(fontSize: small ? 14.0 : 16.0),
//         ),
//       ),
//     );