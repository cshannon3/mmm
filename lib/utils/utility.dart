
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:universal_html/html.dart' as html;

import 'dart:developer' as developer;
import 'package:firebase/firebase.dart' as fb;
import 'package:uuid/uuid.dart';
dynamic checkPath(var map, List path){
  int i = 0;
  if(map is Map){
    while (map.containsKey(path[i])){
      map = map[path[i]];
      i++;
      if(i==path.length)return [true, map];
    }
    return [false, null];
  }else return [false, null];
}
dynamic ifIs(var tokens, var name) => 
    (tokens!=null && name!=null && tokens.containsKey(name)) ? tokens[name] : null;

bool noneEmpty({dynamic test}){
  if (test==null)return false;
  if (test==[]||test==""||test=={})return false;
  if(test is List){
    int i = 0;
    while (i< test.length){
      if(!noneEmpty(test:test[i])){
        return false;
      }
      i++;
    }
  }
  return true;
}


double flexW(double w){
  if(w==null)return 0;
  double maxW=450.0;//double minW=300.0;
  double m = (w>maxW)?((w-maxW)/2):5.0;
 // print(m);
  return m;
}
String generateNewID()=>Uuid().v4();
String generateIDTime()=>Uuid().v1();

dynamic safeGet({@required String key, @required Map map,@required dynamic alt}){
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
      (width <= 500) ? 1 : (width > 1200) ? 4: (width / 300).floor();

bool isMobile(double width)=>(width<=650);
Widget ifMobile({double width, List<Widget> items}){
  return isMobile(width)?Column(children: items,):Row(children: items,);
}
String base = "http://maps.google.com/mapfiles/kml/paddle";
Widget imageFromPath(String path)=>path.contains("http")?Image.network(path):Image.asset(path);


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
  id = id.substring(0, 2).toLowerCase();
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

  var status = validateEmail(email);
  if (!status) {
    customSnackBar(_scaffoldKey, 'Please enter valid email id');
    return false;
  }
  return true;
}

bool validateEmail(String email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  var status = regExp.hasMatch(email);
  return status;
}
