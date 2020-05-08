
import 'package:de_makes_final/shared_widgets/title_text.dart';
import 'package:de_makes_final/utils/utility.dart';
import 'package:flutter/material.dart';

Widget topButton(String name, {Function() onPressed, double fontSize=20.0,double h=50.0, String link=""})=> 
MaterialButton(
                    height: h,
                    minWidth: 80.0,
                    onPressed: onPressed??(link!="")?()=>launch(link):(){},
                    color: Colors.orangeAccent,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0)),
                    child: Text(name,
                        style:  TextStyle(color: Colors.white, fontSize: fontSize)),
             //     ),
  );



Widget altButton({@required double w, @required Function() onPressed, @required String text})=>
      Container(
             // margin: EdgeInsets.symmetric(vertical: 15),
              width: flexW(w),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.grey[300],
                onPressed: onPressed,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TitleText(text, color: Colors.black),
              ),
            );

Widget googleSignInWidget(
        {@required Function() onTap, double h = 50.0, double w = 120}) =>
    Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: w,
          height: h,
          child: Image.network(
              'https://www.wethebuilders.com/assets/google-signin-91dc17d460e647bc21b07825041e93c6.png'),
        ),
      ),
    );

Widget closeIcon({@required Function() onPressed}) => Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.close), color: Colors.red, onPressed: onPressed),
    );


 Widget loggedIn({Function() onPress, String displayName=""}) => InkWell(
        onTap:  onPress,
        child: Container(
            width: 120.0,
            height: 50.0,
            child: Center(
                child: Text(
              displayName,
              style: TextStyle(color: Colors.white),
            ))),
      );

  Widget notLoggedIn({Function() onPress}) => InkWell(
        onTap: onPress,
        child: Container(
            width: 120.0,
            height: 50.0,
            child: Center(
                child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ))),
      );



// class RippleButton extends StatelessWidget {
//   final Widget child;
//   final Function onPressed;
//   final BorderRadius borderRadius;
//   final Color splashColor;
//   RippleButton({Key key, this.child, this.onPressed, this.borderRadius = const BorderRadius.all(Radius.circular(0)), this.splashColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         child,
//         Positioned(
//           left: 0,
//           right: 0,
//           top: 0,
//           bottom: 0,
//           child: FlatButton(
//             splashColor: splashColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: borderRadius
//             ),
//               onPressed: () {
//                 if (onPressed != null) {
//                   onPressed();
//                 }
//               },
//               child: Container()),
//         )
//       ],
//     );
//   }
// }

// Widget topButton(String name, {Function() onPressed, double fontSize=20.0,double h=50.0})=> Center(
//     child: MaterialButton(
//                     height: h,
//                     minWidth: 80.0,
//                     onPressed:onPressed??null,
//                     color: Colors.orangeAccent,
//                     textColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(18.0)),
//                     child: Text(name,
//                         style:  TextStyle(color: Colors.white, fontSize: fontSize)),
//                   ),
//   );


//  var f=[
            
// topButton("Request PPE", link:"https://forms.gle/RqJYsD6mbgFEwwpU9"),
//                 topButton("Request Bias Tape Maker", link:"https://forms.gle/rv3u8kkqcUG2osBw8", fontSize: 16.0, h:40.0),
//                 topButton("Join Us",login: true, fontSize: 16.0, h:40.0 ),
//             ]


// Widget actionButton(String name, {Function() onPressed, double fontSize=20.0,double h=50.0, String link=""})=>
//            Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: MaterialButton(
//                           height: 40.0,
//                           minWidth: 80.0,
//                           onPressed: (){ 
//                             launch("https://forms.gle/DBqWCo3oYw1drCc37");  //   tappedMenuButton(context, "/request");
//                             },
//                           color: Colors.orangeAccent,
//                           textColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: new BorderRadius.circular(18.0)),
//                           child: Text("Request",
//                               style:  TextStyle(color: Colors.white, fontSize: 20.0)),
//                         ),
//               );

