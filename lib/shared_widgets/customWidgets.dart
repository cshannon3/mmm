
import 'dart:io';

import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_advanced_networkimage/provider.dart';

//import 'package:image_picker/image_picker.dart';
Widget customTitleText(String title, {BuildContext context}){
  return Text(title ?? '',style: TextStyle(color: Colors.black87,fontFamily: 'HelveticaNeue', fontWeight:FontWeight.w900, fontSize: 20),);
}
Widget  heading(String heading,{double horizontalPadding = 10,BuildContext context}){
  double fontSize =  16;
  if(context != null){
     fontSize = getDimention(context,16) ;
  }
    return Padding(
               padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(heading,style: AppTheme.apptheme.typography.dense.display1.copyWith(fontSize: fontSize),),);
  }
Widget userImage(String path, {double height = 100}){
  return  Container(
          child:  Container(
          width: height,height: height,
          alignment:   FractionalOffset.topCenter,
           decoration: BoxDecoration(
                  boxShadow: shadow,
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(height/2),
                  image: DecorationImage( image: NetworkImage(path))
            ),
          ));
}
Widget customIcon(BuildContext context,{int icon, bool isEnable = false,double size = 18,bool istwitterIcon = true, bool isFontAwesomeRegular = false,bool isFontAwesomeSolid = false,Color iconColor, double paddingIcon  = 10}){
  iconColor = iconColor ?? Theme.of(context).textTheme.caption.color;
  return  Padding(
    padding: EdgeInsets.only( bottom:istwitterIcon ?  paddingIcon: 0),
    child: Icon(
             IconData(
               icon,fontFamily: istwitterIcon ? 'TwitterIcon' : isFontAwesomeRegular ? 'AwesomeRegular' : isFontAwesomeSolid ? 'AwesomeSolid' : 'Fontello'),
               size: size,color: isEnable 
               ? Theme.of(context).primaryColor :
                iconColor,),
  );
}
Widget customTappbleIcon(BuildContext context,int icon ,{double size = 16,bool isEnable =false, Function(bool,int) onPressed1,bool isBoolValue,int id,
                         Function onPressed2,bool isFontAwesomeRegular = false,bool istwitterIcon = false,bool isFontAwesomeSolid = false,Color iconColor,EdgeInsetsGeometry padding}){
 if(padding == null){
   padding  = EdgeInsets.all(10);
 }
 return MaterialButton(
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    minWidth: 10,height: 10,
    padding: padding,
    shape: CircleBorder(),
    color: Colors.transparent,
    elevation: 0,
    onPressed: (){
      if(onPressed1 != null){
       onPressed1(isBoolValue,id);
      }
      else if(onPressed2 != null){
        onPressed2();
      }
  }
  ,child:  customIcon(context,icon:icon,size: size,isEnable: isEnable,istwitterIcon:istwitterIcon,isFontAwesomeRegular:isFontAwesomeRegular,isFontAwesomeSolid: isFontAwesomeSolid,iconColor: iconColor ));
}
Widget customText(String msg, {Key key, TextStyle style,TextAlign textAlign = TextAlign.justify,TextOverflow overflow = TextOverflow.visible,BuildContext context,bool softwrap = true}){

  if(msg == null){
    return SizedBox(height: 0,width: 0,);
  }
  else{
    if(context != null && style != null){
      var fontSize = style.fontSize ?? Theme.of(context).textTheme.body1.fontSize;
      style =  style.copyWith(fontSize: fontSize - ( fullWidth(context) <= 375  ? 2 : 0));
    }
    return Text(msg,style: style,textAlign: textAlign,overflow:overflow,softWrap: softwrap,key: key,);
  }
}
// Widget customImage(BuildContext context, String path,{double height = 50, bool isBorder = false,}){
//   return 
//    Container(
//       decoration: BoxDecoration(
//        shape: BoxShape.circle,
//        border: Border.all(color:Colors.grey.shade100,width: isBorder ? 2 : 0),
//       ) ,
//      child: 
//       CircleAvatar(
//         maxRadius: height/2,
//         backgroundColor: Theme.of(context).cardColor,
//         backgroundImage:  customAdvanceNetworkImage(path ?? dummyProfilePic),
//    ));
// }
double fullWidth(BuildContext context) {
  // cprint(MediaQuery.of(context).size.width.toString());
  return MediaQuery.of(context).size.width;
} 
double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
} 
Widget customInkWell({Widget child,BuildContext context,Function(bool,int) function1,Function onPressed,bool isEnable = false, int no = 0,Color color = Colors.transparent,Color splashColor,BorderRadius radius}){
  if(splashColor == null){
    splashColor = Theme.of(context).primaryColorLight;
  }
  if(radius == null){
    radius = BorderRadius.circular(0);
  }
  return Material(
    
    color:color,
    child: InkWell(
      borderRadius: radius,
      onTap: (){
        if(function1 != null){
          function1(isEnable,no);
        }
        else if(onPressed != null){
          onPressed();
        }
      },
      splashColor: splashColor,
      child: child,
    ),
  );
}
void showAlert(BuildContext context,{@required Function onPressedOk,@required String title,String okText = 'OK', String cancelText = 'Cancel'}) async{
   showDialog(
     context: context,
     builder: (context){ return  customAlert(context,onPressedOk: onPressedOk,title: title,okText: okText,cancelText: cancelText);  }
   );
  }
Widget customAlert(BuildContext context,{@required Function onPressedOk,@required String title,String okText = 'OK', String cancelText = 'Cancel'}) {
    return AlertDialog(
          title: Text('Alert',style: TextStyle(fontSize: getDimention(context,25),color: Colors.black54)),
          content: customText(title,style: TextStyle(color: Colors.black45)),
          actions: <Widget>[
          FlatButton(
            textColor: Colors.grey,
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text(cancelText),
           ),
           FlatButton(
             textColor: Theme.of(context).primaryColor,
            onPressed: (){
              Navigator.pop(context);
              onPressedOk();
            },
            child: Text(okText),
         )
       ],
    );
  }
void customSnackBar(GlobalKey<ScaffoldState> _scaffoldKey,String msg,{double height = 30, Color backgroundColor = Colors.black}){
    if( _scaffoldKey == null || _scaffoldKey.currentState == null){
      return;
    }
    _scaffoldKey.currentState.hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content:Text(msg, style: TextStyle(color:Colors.white,),));
           _scaffoldKey.currentState.showSnackBar(snackBar);
  }



 Widget loader(){
   if(Platform.isIOS){
     return Center(child: CupertinoActivityIndicator(),);
   }
   else{
     return Center(
       child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),),
     );
   }
 }
  Widget customSwitcherWidget({@required child, Duration duraton = const Duration(milliseconds: 500)}){
   return AnimatedSwitcher(
      duration: duraton,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: child,
   );
  }
  
  Widget customExtendedText(String text, bool isExpanded,{BuildContext context, TextStyle style,@required Function onPressed, @required TickerProvider provider,AlignmentGeometry alignment = Alignment.topRight,@required EdgeInsetsGeometry padding , int wordLimit = 100,bool isAnimated = true }){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         AnimatedSize(
          vsync: provider,
          duration:  Duration(milliseconds: (isAnimated ? 500 : 0)),
          child: ConstrainedBox(
            constraints: isExpanded  ?  BoxConstraints() :  BoxConstraints(maxHeight: wordLimit == 100 ? 100.0 : 260.0),
              child:  customText(
                text,
                softwrap: true,
                overflow: TextOverflow.fade,
                style: style ,
                context: context,
                textAlign: TextAlign.start))),
              text != null && text.length > wordLimit ? 
              Container(
                alignment: alignment,
                child: InkWell(
                 onTap: onPressed,
                  child: Padding(
                    padding: padding,
                    child: Text(!isExpanded ? 'more...' : 'Less...',style: TextStyle(color: Colors.blue,fontSize: 14),),
                  )
                )
                ,
              )
               : Container()
    ]);
  }
  double getDimention(context, double unit){
  if(fullWidth(context) <= 360.0){
    return unit / 1.3;
  }
  else {
    return unit;
  }
}


Widget customListTile(BuildContext context,{Widget title,Widget subtitle, Widget leading,Widget trailing,Function onTap}){
   return customInkWell(
     context: context,
     onPressed: (){if(onTap != null){onTap();}},
     child: Padding(
       padding: EdgeInsets.symmetric(vertical: 0),
       child:Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           SizedBox(width: 10,),
           Container(
                 width: 40,
                 height: 40,
                 child: leading,
               ),
           SizedBox(width: 20,),
           Container(
             width: fullWidth(context) - 80 ,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Row(
                   children: <Widget>[
                     Expanded(child:title ?? Container()),
                    trailing ?? Container(),
                   ],
                 ),
                 subtitle
               ],
             ),
           ),
            SizedBox(width: 10,),
         ],
       )
     )
   );
}

// openImagePicker(BuildContext context,Function onImageSelected) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext context) {
//           return Container(
//             height: 100,
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: <Widget>[
//                 Text(
//                   'Pick an image',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10),
//                 Row(children: <Widget>[
//                    Expanded(
//                      child:  FlatButton(
//                     color: Theme.of(context).primaryColor,
//                     child: Text('Use Camera',style: TextStyle(color: Theme.of(context).backgroundColor),),
//                       onPressed: () {
//                         getImage(context, ImageSource.camera,onImageSelected);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Expanded(
//                     child: FlatButton(
//                     color: Theme.of(context).primaryColor,
//                     child: Text('Use Gallery',style: TextStyle(color: Theme.of(context).backgroundColor),),
//                     onPressed: () {
//                        getImage(context, ImageSource.gallery,onImageSelected);
//                     },
//                   ),
//                 )
//                 ],)
//               ],
//             ),
//           );
//         });
//   }
//   getImage(BuildContext context, ImageSource source,Function onImageSelected) {
//     ImagePicker.pickImage(source: source,imageQuality: 50).then((File file) {
//       onImageSelected(file);
//       Navigator.pop(context);
//     });
//   }