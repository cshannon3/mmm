
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/image_widgets.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/utils/constant.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';
class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  AppState appState;
    List<Widget>  tiles;

  
  
  @override
  void initState() { // loader = CustomLoader();
    tiles = galleryTiles();
    super.initState();
  }

  List<Widget> galleryTiles() {
    appState = locator<AppState>();
    List<Widget> out=[];
    List<String> r= ["Submission"];

   List resources= appState.dataRepo.getItemsWhere("resources", );
   resources.shuffle();
   resources.forEach((resource) {
     String type= safeGet(key: "type", map: resource, alt: "");
     String url =safeGet(key: "url", map:resource, alt:null);
    Widget bottomWid;
     if(resource.containsKey("userID")){
        Map user = appState.dataRepo.getItemByID("users", resource["userID"]);
        bottomWid= ListTile(
          onTap: (){
            appState.setUserProfile(user);
            tappedMenuButton(context, "/users/${user["id"]}");
          },
          leading: Container(
            height:50.0,
            width: 50.0,
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(safeGet(key: "url", map:user, alt:placeHolderUrl)),
            ),
          ),
          title: Text(safeGet(key: "name", map:user, alt:"User"), style: TextStyle(color:Colors.white),),
        );
       
     }
    
     if(r.contains(type)&&url!=null){
       out.add(Padding(
         padding: EdgeInsets.all(8.0),
         child: Container(
           decoration: BoxDecoration(image:DecorationImage(image:NetworkImage(url))),
           
            margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                     // Image.network(url, fit: BoxFit.cover, width: 1000.0, alignment: Alignment.center,),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child:bottomWid
                        ),
                      ),
                     
                    ],
                  )),
            )));
        }});
        
   return out;
    
}

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    
    return GridView.count(crossAxisCount: getColumnNum(w), children:tiles);
  }
}