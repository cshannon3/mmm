


import 'package:delaware_makes/apis/googleclient/gmanager/checks.dart';
import 'checks.dart';

String token = "%%";
class GoogleDocInfo {
  String docID;
  String title;
  String text;
 // List<String> sections=[];
  Map<String, dynamic> sections={};
  GoogleDocInfo({this.docID, this.text, this.title,});
}


Map<String, dynamic>  parseDataList({dynamic data}) {
  var content = checkPath(data, ["body", "content"]);
  if (!content[0]) return null;
  
  //List<String> out = [""];
  bool italic = false;
  bool bold = false;
  String fontType = "normal";
  String currentSection="header";
  //   String fontFamily;
Map<String, dynamic>  out = {};
out[currentSection]="";
  int fontWeight = 400;
  int fontsize = 10;
  Map<String, int> namedStySize = {
    "TITLE": 40,
    "NORMAL_TEXT": 18,
    "HEADING_2": 30,
    "HEADING_1": 35,
    "HEADING_3": 25,
  };
  content[1].forEach((cont) {
    
    var sty = checkPath(cont, ["paragraph", "paragraphStyle", "namedStyleType"]);
    if (sty[0] && namedStySize[sty[1]] != fontsize) {
      fontsize = namedStySize[sty[1]];
      //out.add("#size$fontsize#"); 
      out[currentSection]+="\n#size$fontsize#";
    }


    var elements = checkPath(cont, ["paragraph", "elements"]);
    bool back = false;
    if (elements[0] && elements[1] is List)
      elements[1].forEach((t) {
        String elemContent = checkPath(t, ["textRun", "content"])[1] ?? "";
        if(elemContent[0]=="#"){
        //  print(elemContent);
          currentSection=elemContent.substring(1).trim();
          out[currentSection]="";
          elemContent="";
        }
        var textStyle = checkPath(t, ["textRun", "textStyle"]);
        String nFront = "";
        back = false;

        if (textStyle[0]) {
          textStyle = textStyle[1];
          if (textStyle.containsKey("italic") &&
              textStyle["italic"] &&
              !italic) {
            fontType = "italic";
            nFront += "#italic#";
            italic = true;
          } else if (!textStyle.containsKey("italic") && italic) {
            nFront += "#normal#";
            fontType = "normal";
            italic = false;
          }
          if (textStyle.containsKey("bold") && textStyle["bold"] && !bold) {
            fontWeight = 700;
            nFront += "#fw$fontWeight#";
            bold = true;
          } else if (!textStyle.containsKey("bold") && bold) {
            fontWeight = 400;
            nFront += "#fw$fontWeight#";
            bold = false;
          }
          var link = checkPath(textStyle, ["link", "url"]);
          if (link[0]) {
           // out.last += "#link${link[1]}#$elemContent#/link#";
            out[currentSection] += "#link${link[1]}#$elemContent#/link#";
            // print(link[1]);
            //  nBack="#/link#";
            back = true;
          }

          var font = checkPath(textStyle, ["fontSize", "magnitude"]);
          if (font[0] && font[1] != fontsize) {
            // ts.containsKey("fontSize") && ts["fontSize"].containsKey("magnitude") &&ts["fontSize"]["magnitude"]!=fontsize){
            fontsize = textStyle["fontSize"]["magnitude"];
            nFront += "#size$fontsize#";
          }
        }
        // print("d");
        //  var ffam= checkPath(ts, ["weightedFontFamily", "fontFamily"]);
        //   if(ffam[0] && fonts.containsKey(ffam[1])){
        //     if(ffam[1]!=fontFamily && fonts[ffam[1]][fontType].contains(fontWeight)){
        //       fontFamily=ffam[1];
        //     nFront+="#fontfam$fontFamily#"; }
        // }
        // print(nFront);
        // print(elemContent);

        if (!back) {
         // out.last += nFront + elemContent;
         out[currentSection] += nFront + elemContent;
        } // +nBack;nBack = "";}
        //else{out += nFront + elemContent +nBack;}
        //print(out);
      });
  });
  //print(out);
  return out;
}

String parseData({dynamic data}) {
  var content = checkPath(data, ["body", "content"]);
  if (!content[0]) return null;
  String out = "";
  bool italic = false;
  bool bold = false;
  String fontType = "normal";
  //   String fontFamily;

  int fontWeight = 400;
  int fontsize = 10;
  Map<String, int> namedStySize = {
    "TITLE": 30,
    "NORMAL_TEXT": 18,
    "HEADING_2": 25,
    "HEADING_1": 20,
  };
  content[1].forEach((cont) {
    var sty =
        checkPath(cont, ["paragraph", "paragraphStyle", "namedStyleType"]);
    if (sty[0] && namedStySize[sty[1]] != fontsize) {
      fontsize = namedStySize[sty[1]];
      out += "#size$fontsize#"; //print(namedStySize[sty[1]].toString());
    }
    var elements = checkPath(cont, ["paragraph", "elements"]);
    // String nBack = "";
    bool back = false;
    if (elements[0] && elements[1] is List)
      elements[1].forEach((t) {
        var elemContent = checkPath(t, ["textRun", "content"])[1] ?? "";
        var textStyle = checkPath(t, ["textRun", "textStyle"]);
        String nFront = "";
        back = false;

        if (textStyle[0]) {
          textStyle = textStyle[1];
          if (textStyle.containsKey("italic") &&
              textStyle["italic"] &&
              !italic) {
            fontType = "italic";
            nFront += "#italic#";
            italic = true;
          } else if (!textStyle.containsKey("italic") && italic) {
            nFront += "#normal#";
            fontType = "normal";
            italic = false;
          }
          if (textStyle.containsKey("bold") && textStyle["bold"] && !bold) {
            fontWeight = 700;
            nFront += "#fw$fontWeight#";
            bold = true;
          } else if (!textStyle.containsKey("bold") && bold) {
            fontWeight = 400;
            nFront += "#fw$fontWeight#";
            bold = false;
          }
          var link = checkPath(textStyle, ["link", "url"]);
          if (link[0]) {
            out += "#link${link[1]}#$elemContent#/link#";
            // print(link[1]);
            //  nBack="#/link#";
            back = true;
          }

          var font = checkPath(textStyle, ["fontSize", "magnitude"]);
          if (font[0] && font[1] != fontsize) {
            // ts.containsKey("fontSize") && ts["fontSize"].containsKey("magnitude") &&ts["fontSize"]["magnitude"]!=fontsize){
            fontsize = textStyle["fontSize"]["magnitude"];
            nFront += "#size$fontsize#";
          }
        }
        // print("d");
        //  var ffam= checkPath(ts, ["weightedFontFamily", "fontFamily"]);
        //   if(ffam[0] && fonts.containsKey(ffam[1])){
        //     if(ffam[1]!=fontFamily && fonts[ffam[1]][fontType].contains(fontWeight)){
        //       fontFamily=ffam[1];
        //     nFront+="#fontfam$fontFamily#"; }
        // }
        // print(nFront);
        // print(elemContent);

        if (!back) {
          out += nFront + elemContent;
        } // +nBack;nBack = "";}
        //else{out += nFront + elemContent +nBack;}
        //print(out);
      });
  });
  //print(out);
  return out;
}









// class GoogleDocInfo {
//   String docID;
//   String title;
//   String text;
//   GoogleDocInfo({this.docID, this.text, this.title});

//   RichText toRichText() {
//     return RichText(text: TextSpan(children: toTextSpan()));
//   }

//   List<TextSpan> toTextSpan() {
//     var vars = {
//       // "text": text,
//       "token": "#", // "#"
//       "isBold": FontWeight.normal,
//       "isHighlighted": false,
//       "isItalic": FontStyle.normal,
//       "fontSize": 16.0,
//       "color": Colors.black,
//       "fontWeight": FontWeight.normal,
//       "fontFamily": null,
//       "fontType": FontStyle.normal
//     };
//     List<String> links = [];
//     bool hasLink = false;

//     List<TextSpan> textWidgets = [];
//     List v = ["100", "200", "300", "400", "500", "600", "700", "800", "900"];

//     text.split(vars["token"]).forEach((textSeg) {
//       if (textSeg == "bold")
//         vars["fontWeight"] = FontWeight.bold;
//       else if (textSeg == "/bold")
//         vars["fontWeight"] = FontWeight.normal;
//       else if (textSeg == "normal")
//         vars["fontWeight"] = FontWeight.normal;
//       else if (textSeg.contains("fw") && v.contains(textSeg.substring(2)))
//         vars["fontWeight"] = FontWeight.values[v.indexOf(textSeg.substring(2))];
//       else if (textSeg == "italic")
//         vars["fontType"] = FontStyle.italic;
//       else if (textSeg == "/italic")
//         vars["fontType"] = FontStyle.normal;
//       else if (textSeg.contains("color"))
//         vars["color"] =
//             colorFromString(textSeg.substring("color".length)) ?? Colors.black;
//       else if (textSeg.contains("/color"))
//         vars["color"] = Colors
//             .black; // else if(textSeg.contains("highlight")) vars["isHighlighted"]= !isHighlighted;
//       else if (textSeg.contains("size"))
//         vars["fontSize"] =
//             double.tryParse(textSeg.substring("size".length)) ?? 12.0;
//       else if (textSeg.contains("/size"))
//         vars["fontSize"] = 16.0;
//       else if (textSeg.contains("/link"))
//         hasLink = false;
//       else if (textSeg.contains("link")) {
//         hasLink = true;
//         links.add(textSeg.substring("link".length));
//       } else {
//         //
//         final int o = links.length - 1;
//         if (hasLink) {
//           textWidgets.add(TextSpan(
//               text: textSeg,
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () {
//                   launch(links[o]);
//                 },
//               style: TextStyle(
//                 fontSize: vars["fontSize"],
//                 fontWeight: vars["fontWeight"],
//                 fontStyle: vars["fontType"],
//                 color: Colors.blue,
//                 decoration: TextDecoration.underline, //vars["color"]
//               )));
//         } else {
//           textWidgets.add(TextSpan(
//               text: textSeg,
//               style: TextStyle(
//                   fontSize: vars["fontSize"],
//                   fontWeight: vars["fontWeight"],
//                   fontStyle: vars["fontType"],
//                   color: vars["color"])));
//           //   backgroundColor: isHighlighted ? Colors.yellowAccent:null)));
//         }
//       }
//     });
//     return textWidgets;
//   }
// }


// Future<GoogleDocInfo> getData(
//     {AutoRefreshingAuthClient client, String documentId, docTitle}) async {
//   // List<GoogleDocInfo> docs = [];
//   var _url;
//   var _body;
//   http.Client cl = client;
//   commons.ApiRequester _requester = commons.ApiRequester(
//       cl, "https://docs.googleapis.com/", "", 'dart-api-client docs/v1');

//   //sampleDocs.forEach((docTitle, documentId) {
//   if (documentId == null) {
//     throw new ArgumentError("Parameter documentId is required.");
//   }
//   var _queryParams = new Map<String, List<String>>();
//   var _uploadMedia;
//   var _uploadOptions;
//   var _downloadOptions = req.DownloadOptions.Metadata;
//   _url = 'v1/documents/' + commons.Escaper.ecapeVariable('$documentId');
//   var _response = _requester.request(_url, "GET",
//       body: _body,
//       queryParams: _queryParams,
//       uploadOptions: _uploadOptions,
//       uploadMedia: _uploadMedia,
//       downloadOptions: _downloadOptions);
//   return _response.then((docData) {
//     List<String> txt = parseDataList(data: docData);
//       print(txt);
//       return GoogleDocInfo(docID: documentId, title: docTitle, text: txt[0], sections: txt);
//   });
//   // });
//   // return docs;
// }