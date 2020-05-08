
import 'package:de_makes_final/shared_widgets/shared_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;

import 'dart:developer' as developer;
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:uuid/uuid.dart';

import 'dynamic_parser.dart';


double flexW(double w)=>w==null?double.infinity:(w>600.0)?450:w-30.0;
String generateNewID()=>Uuid().v4();

dynamic safeGet({String key, Map map, dynamic alt}){
  try{
    return map.containsKey(key)?map[key]
    :map.containsKey(key.toLowerCase())?map[key.toLowerCase()]:

    alt;
  }catch(e){
    return alt;
  }
}
bool launch(String url) {
  return html.window.open(url, '') != null;
}
 int getColumnNum(double width) =>
      (width <= 500) ? 1 : (width > 1000) ? 5 : (width / 200).floor();

bool isMobile(double width)=>(width<=500);
Widget ifMobile({double width, List<Widget> items}){
  return isMobile(width)?Column(children: items,):Row(children: items,);
}
String base = "http://maps.google.com/mapfiles/kml/paddle";
Widget imageFromPath(String path)=>path.contains("http")?Image.network(path):Image.asset(path);


dynamic parseType(String type, dynamic val){
  switch (type) {
    case "double":
          return (val is String) ? double.tryParse(val) : val;
          break;
        case "int":
          return (val is String) ? int.tryParse(val) : val;
          break;
        case "String":
          return val;
          break;
        case "bool":
          return val;
          break;
        case "DateTime":
          return val;
          break;
    default:
      return val;
  }
}
Map<String, Color> statusColor ={ 
   "pending":Colors.white, 
   "open":Colors.red,
   "ongoing":Colors.amber,
   "partial":Colors.yellow, 
   "taken":Colors.amber, 
   "complete" :Colors.green
};

Map shapeStr={
  "medicalFacility":"star",
  "doctorsOffice":"diamond",
   "nursingHome":"square",
   "essentialBiz":"circle",
   "other":"blank"
};
Map colorStr={
  "pending":"wht",
  "open":"red",
  "ongoing":"ylw",
  "partial":"ylw",
  "complete":"grn"
};



RichText toRichText(String tx) {
  return RichText(
    overflow: TextOverflow.clip,
    textAlign: TextAlign.center,
    text: TextSpan(children: toTextSpan(tx)));
}


List<TextSpan> toTextSpan(String tx) {
  var vars = {
    // "text": text,
    "token": "#", // "#"
    "isBold": FontWeight.normal,
    "isHighlighted": false,
    "isItalic": FontStyle.normal,
    "fontSize": 16.0,
    "color": Colors.black,
    "fontWeight": FontWeight.normal,
    "fontFamily": null,
    "fontType": FontStyle.normal
  };
  List<String> links = [];
  bool hasLink = false;

  List<TextSpan> textWidgets = [];
  List v = ["100", "200", "300", "400", "500", "600", "700", "800", "900"];
  tx.split(vars["token"]).forEach((textSeg) {
    if (textSeg == "bold")
      vars["fontWeight"] = FontWeight.bold;
    else if (textSeg == "/bold")
      vars["fontWeight"] = FontWeight.normal;
    else if (textSeg == "normal")
      vars["fontWeight"] = FontWeight.normal;
    else if (textSeg.contains("fw") && v.contains(textSeg.substring(2)))
      vars["fontWeight"] = FontWeight.values[v.indexOf(textSeg.substring(2))];
    else if (textSeg == "italic")
      vars["fontType"] = FontStyle.italic;
    else if (textSeg == "/italic")
      vars["fontType"] = FontStyle.normal;
    else if (textSeg.contains("color"))
      vars["color"] =
          colorFromString(textSeg.substring("color".length)) ?? Colors.black;
    else if (textSeg.contains("/color"))
      vars["color"] = Colors
          .black; // else if(textSeg.contains("highlight")) vars["isHighlighted"]= !isHighlighted;
    else if (textSeg.contains("size"))
      vars["fontSize"] =
          double.tryParse(textSeg.substring("size".length)) ?? 12.0;
    else if (textSeg.contains("/size"))
      vars["fontSize"] = 16.0;
    else if (textSeg.contains("/link"))
      hasLink = false;
    else if (textSeg.contains("link")) {
      hasLink = true;
      links.add(textSeg.substring("link".length));
    } else {
      //
      final int o = links.length - 1;
      if (hasLink) {
        textWidgets.add(TextSpan(
            text: textSeg,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(links[o]);
              },
            style: GoogleFonts.oswald(
            textStyle:TextStyle(
              fontSize: vars["fontSize"],
              fontWeight: vars["fontWeight"],
            //  fontStyle: vars["fontType"],
              color: Colors.blue,
              decoration: TextDecoration.underline, //vars["color"]
        ))));
      } else {
        textWidgets.add(TextSpan(
            text: textSeg,
            style:  GoogleFonts.oswald(
            textStyle:TextStyle(
                fontSize: vars["fontSize"],
                fontWeight: vars["fontWeight"],
              //  fontStyle: vars["fontType"],
                color: vars["color"]))));
        //   backgroundColor: isHighlighted ? Colors.yellowAccent:null)));
      }
    }
  });
  return textWidgets;
}

final kAnalytics = fb.analytics();

final fb.DatabaseReference kDatabase = fb.database().ref();
final kScreenloader = CustomLoader();

String getPostTime2(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  var dt = DateTime.parse(date).toLocal();
  var dat =
      DateFormat.jm().format(dt) + ' - ' + DateFormat("dd MMM yy").format(dt);
  return dat;
}

String getdob(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  var dt = DateTime.parse(date).toLocal();
  var dat = DateFormat.yMMMd().format(dt);
  return dat;
}

String getJoiningDate(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  var dt = DateTime.parse(date).toLocal();
  var dat = DateFormat("MMMM yyyy").format(dt);
  return 'Joined $dat';
}

String getChatTime(String date) {
  if (date == null || date.isEmpty) {
    return '';
  }
  String msg = '';
  var dt = DateTime.parse(date).toLocal();

  if (DateTime.now().toLocal().isBefore(dt)) {
    return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
  }

  var dur = DateTime.now().toLocal().difference(dt);
  if (dur.inDays > 0) {
    msg = '${dur.inDays} d';
    return dur.inDays == 1 ? '1d' : DateFormat("dd MMM").format(dt);
  } else if (dur.inHours > 0) {
    msg = '${dur.inHours} h';
  } else if (dur.inMinutes > 0) {
    msg = '${dur.inMinutes} m';
  } else if (dur.inSeconds > 0) {
    msg = '${dur.inSeconds} s';
  } else {
    msg = 'now';
  }
  return msg;
}

String getPollTime(String date) {
  int hr, mm;
  String msg = 'Poll ended';
  var enddate = DateTime.parse(date);
  if (DateTime.now().isAfter(enddate)) {
    return msg;
  }
  msg = 'Poll ended in';
  var dur = enddate.difference(DateTime.now());
  hr = dur.inHours - dur.inDays * 24;
  mm = dur.inMinutes - (dur.inHours * 60);
  if (dur.inDays > 0) {
    msg = ' ' + dur.inDays.toString() + (dur.inDays > 1 ? ' Days ' : ' Day');
  }
  if (hr > 0) {
    msg += ' ' + hr.toString() + ' hour';
  }
  if (mm > 0) {
    msg += ' ' + mm.toString() + ' min';
  }
  return (dur.inDays).toString() +
      ' Days ' +
      ' ' +
      hr.toString() +
      ' Hours ' +
      mm.toString() +
      ' min';
}

String getSocialLinks(String url) {
  if (url != null && url.isNotEmpty) {
    url = url.contains("https://www") || url.contains("http://www")
        ? url
        : url.contains("www") &&
                (!url.contains('https') && !url.contains('http'))
            ? 'https://' + url
            : 'https://www.' + url;
  } else {
    return null;
  }
  cprint('Launching URL : $url');
  return url;
}


void cprint(dynamic data, {String errorIn, String event}) {
  if (errorIn != null) {
    print(
        '****************************** error ******************************');
    developer.log('[Error]', time: DateTime.now(), error:data, name:errorIn);
    print(
        '****************************** error ******************************');
  } else if (data != null) {
     developer.log(data, time: DateTime.now(), );
  }
  if (event != null) {
    // logEvent(event);
  }
}

void logEvent(String event, {Map<String, dynamic> parameter}) {
  kReleaseMode
      ? kAnalytics.logEvent(event, parameter)
      : print("[EVENT]: $event");
}

void debugLog(String log, {dynamic param = ""}) {
  final String time = DateFormat("mm:ss:mmm").format(DateTime.now());
  print("[$time][Log]: $log, $param");
}

List<String> getHashTags(String text) {
  RegExp reg = RegExp(
      r"([#])\w+|(https?|ftp|file|#)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]*");
  Iterable<Match> _matches = reg.allMatches(text);
  List<String> resultMatches = List<String>();
  for (Match match in _matches) {
    if (match.group(0).isNotEmpty) {
      var tag = match.group(0);
      resultMatches.add(tag);
    }
  }
  return resultMatches;
}

String getUserName({String name, String id}) {
  String userName = '';
  name = name.split(' ')[0];
  id = id.substring(0, 4).toLowerCase();
  userName = '@$name$id';
  return userName;
}

bool validateCredentials(
    GlobalKey<ScaffoldState> _scaffoldKey, String email, String password) {
  if (email == null || email.isEmpty) {
    customSnackBar(_scaffoldKey, 'Please enter email id');
    return false;
  } else if (password == null || password.isEmpty) {
    customSnackBar(_scaffoldKey, 'Please enter password');
    return false;
  } else if (password.length < 8) {
    customSnackBar(_scaffoldKey, 'Password must me 8 character long');
    return false;
  }

  var status = validateEmal(email);
  if (!status) {
    customSnackBar(_scaffoldKey, 'Please enter valid email id');
    return false;
  }
  return true;
}

bool validateEmal(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  var status = regExp.hasMatch(email);
  return status;
}
