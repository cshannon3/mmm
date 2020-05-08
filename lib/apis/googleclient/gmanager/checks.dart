

import 'package:flutter/material.dart';

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
List trimList(var list, {skipEmpty=true}){
  List out = [];
  list.forEach((l){
    if(l.trim()!="" || !skipEmpty)out.add(l.trim());
    });
  return out;
}
dynamic ifIs(var tokens, var name) => 
    (tokens!=null && name!=null && tokens.containsKey(name)) ? tokens[name] : null;
dynamic ifIsOne(var tokens, var names) {
  if (tokens==null || names==null || !(names is List))return null;
  var out;
  int index = 0;
  while (out==null && index<names.length){out=ifIs(tokens, names[index]);index+=1;}
   return out;

}

List<Widget> tryAdd(List<Widget> items, var wid){
  if (wid is List<Widget>) items.addAll(wid);
  else if  (wid is Widget) items.add(wid);
  return items;

}
String capWord(String word) {
  if (!word.contains("_")) return word[0].toUpperCase() + word.substring(1);
  String out = "";
  word.split("_").forEach((w) => out += capWord(w));
  return out;
}

int getLongestStr(var strings){
  int longestStr = 0;
  if(strings is List){
    strings.forEach((s){
      if (s.length> longestStr)longestStr=s.length;
    });
  }else if (strings is Map){
    strings.forEach((k, v)=>longestStr = searchFontSize(k, v, longestStr));
  }
  return longestStr;
 // double pixelsPerLetter= width/longestStr;
  // print(longestStr);
  // print(pixelsPerLetter);
  // return pixelsPerLetter;
  }
  // say 160 pixel space with 8 letters ends with 20 pixels per letter, make font 20*scale factor

int searchFontSize(String k, dynamic v, int longestStr){
  if(k.length>longestStr)longestStr =k.length ;
  if(v is Map) v.forEach((k2, v2)=>longestStr = searchFontSize(k2, v2, longestStr));
  return longestStr;
}
bool hasChildren(String key){
   var widgetInfo = key.contains("_") ? key.split("_") : [key];
   return (["stack", "column", "row", "listview"].contains(widgetInfo[0]));
 }

dynamic tokensToMap(var tokens){
  //print(tokens);
  var mapOut = {};
  for (int i = 0; i<tokens.length; i++){
    mapOut[tokens[i]]=mapOut[tokens[i+1]];
    i+=1;
  }
 // print(mapOut);
  return mapOut;
}
