
import 'package:carousel_slider/carousel_slider.dart';
import 'package:de_makes_final/service_locator.dart';
import 'package:de_makes_final/state/app_state.dart';
import 'package:de_makes_final/utils/constant.dart';
import 'package:de_makes_final/utils/utility.dart';
import 'package:flutter/material.dart';

class DesignsPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    var appState = locator<AppState>();
    double w = MediaQuery.of(context).size.width;
    return SliverGrid.count(
                crossAxisCount: getColumnNum(w),
                children: []..addAll(
                    appState.dataRepo.getModelsData("designs").map((v) { 
                     if(debug){print("designsPage"); print(v);}
                      return DesignTile(
                          designData: v,
                          select: () { },
                    );
                     } ) // widget.dataController.listOf("designs")
               )
                            
    );
  }
}

class DesignTile extends StatefulWidget {
  const DesignTile(
      {Key key,
      @required this.designData,
      @required this.select})
      : super(key: key);

  final Map designData;
  final Function() select;

  @override
  _DesignTileState createState() => _DesignTileState();
}

class _DesignTileState extends State<DesignTile> {
  bool isOn = false;


  @override
  Widget build(BuildContext context) {
    return Container(
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            Expanded(
              child: Container(
                  child: CarouselSlider(
                    options: CarouselOptions(),
                    items: imageSliders(safeGet(map:widget.designData, key:"resources", alt: []))
                  )
                ),
            ),
            ListTile(
              title:Text("Face Shields")
            )
          ],
        ),
      ),
    ));
    
  }
  List<Widget> imageSliders(List resources) {
    print(resources);
    List<Widget> imgs=[];
    resources.forEach((resData) {
      String url=safeGet(key:"url", map:resData, alt: "");
      if(safeGet(key:"isImage", map:resData, alt: false) && url!=""){
        imgs.add(
Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(url, fit: BoxFit.cover, width: 1000.0),
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
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                safeGet(key:"name", map:resData, alt: ""),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )
    ),
  ),
        ));
      }
    });
 
return imgs;
}

}





                     // List res = appState.dataRepo.getDataFromIDs("resources", safeGet(map: v, key: "resources", alt: []));
                    //  v["resources"]=res;
  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Container(
  //       height: 180.0,
  //       decoration: BoxDecoration(
  //         color: Colors.grey[200],
  //         borderRadius: BorderRadius.circular(5.0),
  //       ),
  //       child: Column(
  //         children: <Widget>[
  //           Expanded(
  //             child: InkWell(
  //               onHover: (b) {
  //                 if (b != isOn)
  //                   setState(() {   isOn = b; });  },
  //               onTap: () {
  //                 // if(widget.d.sourcePath!="")launch(widget.d.sourcePath);
  //               },
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(5.0),
  //                     image: DecorationImage(
  //                       fit: BoxFit.cover,
  //                       image: NetworkImage("https://media.prusaprinters.org/thumbs/cover/1200x630/media/prints/27950/images/279325_253e1b16-a093-49be-91fc-94f9d58f6cf5/3_pins.jpg")
  //                       // widget.d.imagePath.contains("http")
  //                       //     ? NetworkImage(widget.d.imagePath)
  //                       //     : AssetImage(widget.d.imagePath),
  //                     )),
  //                 clipBehavior: Clip.antiAlias,
  //                 child: (isOn )
  //                     ? Container(
  //                         height: double.infinity,
  //                         width: double.infinity,
  //                         color: Colors.grey.withOpacity(0.2),
  //                         child: Stack(children: [
  //                           Align(
  //                             alignment: Alignment.topLeft,
  //                             child: Container(
  //                               height: 25.0,
  //                               decoration: BoxDecoration(
  //                                 shape: BoxShape.circle,
  //                                 color: Colors.white,
  //                               ),
  //                               child: IconButton(
  //                                   padding: EdgeInsets.all(0.0),
  //                                   icon: Icon(Icons.info, color: Colors.black),
  //                                   onPressed: () {
  //                                     widget.select();
  //                                   }),
  //                             ),
  //                           ),
  //                           Align(
  //                             alignment: Alignment.bottomRight,
  //                             child: Container(
  //                               height: 50.0,
  //                               width: 50.0,
  //                               child: Stack(children: [
  //                                 IconButton(
  //                                     iconSize: 30.0,
  //                                     padding: EdgeInsets.all(0.0),
  //                                     // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
  //                                     icon: FaIcon(
  //                                       FontAwesomeIcons.heart,
  //                                       color: Colors.pink,
  //                                     ),
  //                                     onPressed: () {
  //                                       print("Pressed");
  //                                     }),
  //                                 Center(
  //                                     child: Padding(
  //                                   padding: const EdgeInsets.only(bottom: 8.0),
  //                                   child: Text(
  //                                     "fill",
  //                                    // widget.d.score.toString(),
  //                                     style: TextStyle(color: Colors.white),
  //                                   ),
  //                                 ))
  //                               ]),
  //                             ),
  //                           )
  //                         ]))
  //                     : Container(
  //                         height: double.infinity, width: double.infinity),
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(5.0),
  //             child: Text("Fill",
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 14.0,
  //                 )),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

// class ImageSliderDemo extends StatelessWidget {
//   final List
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Image slider demo')),
//       body: Container(
//         child: CarouselSlider(
//           options: CarouselOptions(),
//           items: imgList.map((item) => Container(
//             child: Center(
//               child: Image.network(item, fit: BoxFit.cover, width: 1000)
//             ),
//           )).toList(),
//         )
//       ),
//     );
//   }
// }


//   return imgList.map((item) => Container(
//   child: Container(
//     margin: EdgeInsets.all(5.0),
//     child: ClipRRect(
//       borderRadius: BorderRadius.all(Radius.circular(5.0)),
//       child: Stack(
//         children: <Widget>[
//           Image.network(item, fit: BoxFit.cover, width: 1000.0),
//           Positioned(
//             bottom: 0.0,
//             left: 0.0,
//             right: 0.0,
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(200, 0, 0, 0),
//                     Color.fromARGB(0, 0, 0, 0)
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ),
//               ),
//               padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//               child: Text(
//                 'No. ${imgList.indexOf(item)} image',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )
//     ),
//   ),
// )).toList();