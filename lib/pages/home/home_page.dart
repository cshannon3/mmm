
import 'package:delaware_makes/pages/home/components/count.dart';
import 'package:delaware_makes/pages/home/components/gallery.dart';
import 'package:delaware_makes/pages/home/components/intro.dart';
import 'package:delaware_makes/pages/home/components/maker_section.dart';
import 'package:delaware_makes/pages/home/components/request_section.dart';
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/shared_widgets/sliver.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';


class HomePageMain extends StatelessWidget {

      // Widget title(String titleText)=>makeSliverHeader(
      //           Container( height: double.infinity,width: double.infinity,
      //              child:titleText==""?null: formTitle(titleText, underline:true),
      //           ),minH: 50.0, maxH: 50.0);

  @override
  Widget build(BuildContext context) {
    var platformInfo=locator<PlatformInfo>();
    bool isMobile = platformInfo.checkMobile(MediaQuery.of(context).size);
    return   Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntroBlock(),
            ),
            RequestSection(isMobile: isMobile,),
            MakerSection(isMobile: isMobile,),
          // DesignsPage(),
           Container( height: 50.0,
           width: double.infinity,
                child: formTitle("DE Community Contributions", underline:true),),

          Container(
            height: 1000.0,
            child: Gallery()),
          sizedBox(height:100),
   
      ],
        ),
      );
  }
}

               
         // title("DE Community Contributions"),
         // CountsWidget(),

//  Widget userList(AppState appState, BuildContext context) =>SliverList(
//     delegate: SliverChildListDelegate(
//       appState.dataRepo.getItemsWhere("users", fieldFilters:{"isVerified":true}).map((user) => 
//         Container(width: 300.0,height:100, child: 
//         FlatButton(
//           onPressed: (){
//             appState.setUserProfile(user);
//             tappedMenuButton(context, "/users/${user["id"]}");
//           }, child: Text(safeGet(key: "name", map: user, alt: "user"))
//           ),)
//       ).toList()
//       )
//       );



            // callToAction(
            //   join:CallToActionContainer(
            //     topText: "Willing to help make and/or deliver these items?",
            //     buttonText: "Join Us" ,
            //     onPressed:  (){
            //                 var platform = locator<PlatformInfo>();
            //                 platform.setOverlay("signUp");
            //               },
            //   ),
            //   request:CallToActionContainer(
            //     topText: "Looking for Face Shields for your organization?",
            //     buttonText: "Request" ,
            //     onPressed:  (){
            //                 var platform = locator<PlatformInfo>();
            //                 platform.setOverlay("request"); },
            //   )
            // ),

 // makeSliverHeader(
          //       Container( height: double.infinity,width: double.infinity,color: Colors.black,
          //          child: Text("Contact Info", style: TextStyle(color:Colors.white),)
          //       ),minH: 50.0, maxH: 50.0)
    //platformInfo = locator<PlatformInfo>();
   // platformInfo.widgetSize=MediaQuery.of(context).size;
    //double w = MediaQuery.of(context).size.width;

// //widget.dataController.isLoading?Center(child: CircularProgressIndicator(),):
//         Stack(
//       children: <Widget>[
//         mainPage(w),
//       ],




  // Widget header(String h) => Container(
  //       height: double.infinity, width: double.infinity,
  //       color: Colors.black,
  //       child: Center(
  //           child: Text(
  //         h,
  //         style: TextStyle(color: Colors.white, fontSize: 30.0),
  //       )),
  //     );
// class HomePageMain extends StatefulWidget {
//   final bool about;

//   const HomePageMain({Key key, this.about = false}) : super(key: key);
//   @override
//   _HomePageMainState createState() => _HomePageMainState();
// }

// class _HomePageMainState extends State<HomePageMain> {

  

  // String selected = "Designs";
  // //Widget overlayWidget = Container();
  // bool formOpen = false;
  // bool infoOpen = false;
  
          //  makeSliverHeader(
            // mainMyTabs(width: w,
            //   selected: selected,
            //   items: {
            //     "Designs":(){setState(() {selected="Designs";
            //     //activeWidget=DesignsPage();
            //     //DesignsPage(); 
            //     });},
            //     "Groups":(){setState(() {selected="Groups";
            //    // activeWidget=LocationsPage(); 
            //     });},
            //     "Gallery":(){setState(() {
            //       selected="Gallery";
            //      // activeWidget=Container(color:Colors.blue,);
            //       //GalleryPage(); 
            //       });},
            //   }
            // ), minH: 60.0, maxH: 80.0, pinned: true),


//             Widget callToAction({Widget join, Widget request}){
//   var platform = locator<PlatformInfo>();
//   return SliverList(
//       delegate: SliverChildListDelegate(
//         platform.platform==PlatformType.MOBILE?
//         [request, join]:
//       [
//         SizedBox(height: 40.0,),
//       Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              join, request,],),
//       SizedBox(height: 40.0,),
//     ]
//                       ),
//                   ) ;
// }