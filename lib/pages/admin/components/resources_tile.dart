

import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



 int getColumnNum(double width) =>
      (width <= 500) ? 1 : (width > 1200) ? 6: (width / 200).floor();

class AdminResources extends StatefulWidget {
  @override
  _AdminResourcesState createState() => _AdminResourcesState();
}

class _AdminResourcesState extends State<AdminResources> {

  @override
  Widget build(BuildContext context) {
    AppState appState = locator<AppState>();
    Size s = MediaQuery.of(context).size;
    return Container(
          height:500.0,
          child: GridView.count(
              crossAxisCount: getColumnNum(s.width),
              children: imageSliders(appState.dataRepo.getItemsWhere("resources"), appState)
        ),
        );
  }


  List<Widget> imageSliders(List resources, AppState appState) {
   //print(resources);
    List<Widget> imgs = [];
    resources.forEach((resData) {
      String url = safeGet(key: "url", map: resData, alt: "");
      Map u = appState.dataRepo.getItemByID("users", safeGet(key: resData["userID"], map: resData, alt: ""));
      if (url != ""  &&
      (resData["type"]=="Image" || resData["type"]=="Update")) {
        imgs.add(
          StylizedImageBox(
            url:url,
            topLeftWidget: IconButton(icon: Icon(FontAwesomeIcons.checkCircle, color: safeGet(key: "isVerified", map: resData, alt: false)??false?Colors.green:Colors.grey,), onPressed: (){
                     appState.dataRepo.updateModelValue(
                       modelID: resData["id"], 
                       collectionName: "resources", 
                       fieldName: "isVerified", 
                       newVal: true
                    );
                   }),
            topRightWidget: closeIcon(onPressed: (){
                      setState((){
                       // print("p");
                          appState.dataRepo.deleteItem(modelID: resData["id"], collectionName: "resources");
                      });
                    }),
            bottomText:safeGet(key: "displayName", map: u, alt: ""),
          )
        );}
    });
    return imgs;
  }

}