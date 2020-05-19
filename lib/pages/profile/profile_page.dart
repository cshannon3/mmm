import 'package:carousel_slider/carousel_slider.dart';
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/app_state.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:delaware_makes/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//, this.profileId
class ProfilePage extends StatelessWidget {
  var state = locator<AppState>();
  PlatformInfo platformInfo=  locator<PlatformInfo>();
  ProfilePage({Key key, }) : super(key: key);

  List<Widget> updateTiles(List updates) {
    List<Widget> tiles = [];
    updates.forEach((element) {
      tiles.add(Container(
        height: 100.0,
        width: 100.0,
        child: Image.network(element["url"]),
      ));
    });
    return tiles;
  }

  Widget userInfoWidget(double w, BuildContext context) {
    return (w < 600)
        ? Column(children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: Image.network(safeGet(
                      key: "url",
                      map: state.getProfileData(),
                      alt:"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/nature-quotes-1557340276.jpg?crop=1.00xw:0.757xh;0,0.0958xh&resize=768:*"))
                  .image,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              safeGet(key: "name", map: state.getProfileData(), alt: ""),
              textScaleFactor: 4,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              safeGet(key: "bio", map: state.getProfileData(), alt: ""),

              textScaleFactor: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
          ])
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.network(safeGet(
                        key: "url",
                        map: state.getProfileData(),
                        alt:
                            "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/nature-quotes-1557340276.jpg?crop=1.00xw:0.757xh;0,0.0958xh&resize=768:*"))
                    .image,
              ),
              SizedBox(
                width: 20,
              ),
              Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  safeGet(key: "displayName", map: state.getProfileData(), alt: ""),
                  textScaleFactor: 4,
                ),
                SizedBox(
                  height: 20,
                ),
                 state.isCurrentUser() ? MainUIButton(
              text:"Sign Out",
              onPressed: () {
                state.logout();
                //platformInfo.setOverlay("");
                tappedMenuButton(context, "/");
              },
              ):SizedBox(
                  height: 50,
                ),
           
                SizedBox(
                  height: 40,
                ),
              ])
            ],
          );
  }

  Widget claimsList(BuildContext context){
    List<Widget> clWidget=[];
    List claims = safeGet(map: state.getProfileData(), key: "claims",alt: []);
    claims.forEach((cl) {
     // print(cl);
     // Map des =state.designs.firstWhere((element) => element["id"]== cl["designID"], orElse: ()=>{});
    Map des = state.dataRepo.getItemByID("designs", cl["designID"]);
      Map org = state.dataRepo.getItemByID("orgs", cl["orgID"]);
     // Map org =state.orgs.firstWhere((element) => element["id"]== cl["orgID"], orElse: ()=>{});
      String d= safeGet(key: "name", map: des, alt: "design");
      String o= safeGet(key: "name", map: org, alt: "Organization");
      clWidget.add(
        ListTile(
          leading: IconButton(icon: Icon(FontAwesomeIcons.checkCircle), onPressed: null),
          title:Text("${cl["quantity"]} $d to $o"),
          trailing: (state.isCurrentUser() && !safeGet(map: cl, key: "isDone",alt: false))?
          Container(width:150.0, child: MainUIButton(text:"Update Claim",
          onPressed: (){
             var formManager = locator<FormManager>();
             formManager.initUpdate(claimData:cl);  
            formManager.setForm("update", resetBuffer: false);
                    }
          )):SizedBox(width:20.0)
          )
      );
    });
    return Column(children: clWidget);
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: ListView(
            children: <Widget>[
          userInfoWidget(w, context),
          SizedBox(
            height: 40,
          ),
        state.isCurrentUser() ?  MainUIButton(
             
              onPressed: () {
                 var formManager = locator<FormManager>();
              
            formManager.setForm("update", );
                // state.initUpdate();
                // platformInfo.setOverlay("update");
               // tappedMenuButton(context, "/update");
              },
              text: "New Update"):Container(),
          TitleText("Claims"),
          claimsList(context),
           SizedBox(
            height: 40,
          ),
          TitleText("Updates"),
                Container(
          height:500.0,
          child: GridView.count(
  crossAxisCount: getColumnNum(w),
  children: imageSliders(safeGet(
                            map: state.getProfileData(),
                            key: "resources",
                            alt: [])))
                            )
        
        
          // Container(
          //   width: 300.0,
          //   height: 400.0,
          //   child: UpdatesTile(userData: state.getProfileData(),),
          // )
        ]
        //..addAll(updateTiles(state.getProfileData()["updatesList"] ?? []))),
      )),
    );
  }

 List<Widget> imageSliders(List resources) {
   // print(resources);
    List<String> r= ["Image", "Update", "Submission"];

    List<Widget> imgs = [];
    resources.forEach((resData) {
      String url = safeGet(key: "url", map: resData, alt: "");
      String type = safeGet(key: "type", map: resData, alt: "");
      if (url != "" && r.contains(type)){
        imgs.add(Container(
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
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          "",
                          //safeGet(key:"name", map:resData, alt: ""),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
      }
    });

    return imgs;
  }

}

class UpdatesTile extends StatefulWidget {
  const UpdatesTile({Key key, @required this.userData})
      : super(key: key);

  final Map userData;

  @override
  _DesignTileState createState() => _DesignTileState();
}

class _DesignTileState extends State<UpdatesTile> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Expanded(
                child: Container(
                    child: 
                    CarouselSlider(
                        options: CarouselOptions(),
                        items: imageSliders(safeGet(
                            map: widget.userData,
                            key: "resources",
                            alt: [])))
                            ),
              ),
              ListTile(title: Text("Stats:  "))
            ],
          ),
        ),
      )),
    );
  }
  List<Widget> imageSliders(List resources) {
   // print(resources);
    List<Widget> imgs = [];
    resources.forEach((resData) {
      String url = safeGet(key: "url", map: resData, alt: "");
      if (url != "" && resData["type"]=="Update") {
        imgs.add(Container(
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
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          "",
                          //safeGet(key:"name", map:resData, alt: ""),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ));
      }
    });

    return imgs;
  }
}








     // Text(
                //   safeGet(key: "bio", map: state.getProfileData(), alt: ""),
                //   // style: Theme.of(context).textTheme.caption,
                //   textScaleFactor: 2,
                //   textAlign: TextAlign.center,
                // ),



// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: Column(
//         children: [
//           Text(state.getProfileData()["displayName"]),

//           //Expanded(child: UpdateForm(),)
//         ],
//       ));
//   }
// }
// class ProfilePage extends StatefulWidget {
//   ProfilePage({Key key}) : super(key: key);

//   //final String profileId;

//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage>
//     with SingleTickerProviderStateMixin {
//   bool isMyProfile = true;
//   int pageIndex = 0;
//   var state =  locator<AuthState>();

//   @override
//   void initState() {
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     // //  var authstate = Provider.of<AuthState>(context, listen: false);
//     //   //state.getProfileUser(userProfileId: widget.profileId);
//     //   //isMyProfile =
//     //      // widget.profileId == null || widget.profileId == authstate.userId;
//     // });
//    // _tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   SliverAppBar getAppbar() {
//     return SliverAppBar(
//       forceElevated: false,
//       expandedHeight: 180,
//       elevation: 0,
//       iconTheme: IconThemeData(color: Colors.white),
//       backgroundColor: Colors.transparent,
//       actions: <Widget>[
//         state.isbusy
//             ? SizedBox.shrink()
//             : PopupMenuButton<Choice>(
//                 onSelected: (d) {},
//                 itemBuilder: (BuildContext context) {
//                   return choices.map((Choice choice) {
//                     return PopupMenuItem<Choice>(
//                       value: choice,
//                       child: Text(choice.title),
//                     );
//                   }).toList();
//                 },
//               ),
//       ],
//       flexibleSpace: FlexibleSpaceBar(
//         background: state.isbusy
//             ? SizedBox.shrink()
//             : Stack(
//                 children: <Widget>[
//                   SizedBox.expand(
//                     child: Container(
//                       padding: EdgeInsets.only(top: 50),
//                       height: 30,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Container(height: 50, color: Colors.black),

//                   /// User avatar, message icon, profile edit and follow/following button
//                   Container(
//                     alignment: Alignment.bottomLeft,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[

//                         Container(
//                           margin: EdgeInsets.only(top: 60, right: 30),
//                           child: Row(
//                             children: <Widget>[
//                               Container(height: 40),

//                               SizedBox(width: 10),

//                              Container(
//                                   padding: EdgeInsets.symmetric(
//                                     horizontal: 10,
//                                     vertical: 5,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color:// isFollower()?
//                                         TwitterColor.dodgetBlue,
//                                        // : TwitterColor.white,
//                                     border: Border.all(
//                                         color:// isMyProfile   ?
//                                             Colors.black87.withAlpha(180),
//                                           //  : Colors.blue,
//                                         width: 1),
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),

//                                   /// If [isMyProfile] is true then Edit profile button will display
//                                   // Otherwise Follow/Following button will be display
//                                   child: Text(
//                                    'Edit Profile',
//                                        // : isFollower() ? 'Following' : 'Follow',
//                                     style: TextStyle(
//                                       color: Colors.black87.withAlpha(180),
//                                        //   : isFollower()
//                                             //  ? TwitterColor.white
//                                             //  : Colors.blue,
//                                          fontSize: 17,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),

//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget _floatingActionButton() {
//     return FloatingActionButton(
//       onPressed: () {
//         Navigator.of(context).pushNamed('/CreateFeedPage');
//       },
//       child: customIcon(
//         context,
//         icon: AppIcon.fabTweet,
//         istwitterIcon: true,
//         iconColor: Theme.of(context).colorScheme.onPrimary,
//         size: 25,
//       ),
//     );
//   }

//   Widget _emptyBox() {
//     return SliverToBoxAdapter(child: SizedBox.shrink());
//   }

//   Future<bool> _onWillPop() async {
//     /// It will remove last user's profile from profileUserModelList
//     state.removeLastUser();
//     return true;
//   }

//  // TabController _tabController;

//   @override
//   build(BuildContext context) {
//     return Expanded(
//       child: Container(color:Colors.green,
//         child: Center(child: Text(state.userModel.displayName

//       ))),
//     );

//     // WillPopScope(
//     //   onWillPop: _onWillPop,
//     //   child: Scaffold(
//     //     floatingActionButton: !isMyProfile ? null : _floatingActionButton(),
//     //     backgroundColor: TwitterColor.mystic,
//     //     body: NestedScrollView(
//     //       // controller: _scrollController,
//     //       headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
//     //         return <Widget>[
//     //           getAppbar(),
//     //           state.isbusy
//     //               ? _emptyBox()
//     //               : SliverToBoxAdapter(
//     //                   child: Container(
//     //                     color: Colors.white,
//     //                     child: state.isbusy
//     //                         ? SizedBox.shrink()
//     //                         : UserNameRowWidget(
//     //                             user: state.userModel,
//     //                             isMyProfile: true,
//     //                           ),
//     //                   ),
//     //                 ),

//     //         ];
//     //       },
//     //       body:Container()

//     //     ),
//     //   ),
//     // );
//   }

// }

// class UserNameRowWidget extends StatelessWidget {
//   const UserNameRowWidget({
//     Key key,
//     @required this.user,
//     @required this.isMyProfile,
//   }) : super(key: key);

//   final bool isMyProfile;
//   final User user;

//   String getBio(String bio) {
//     if (isMyProfile) {
//       return bio;
//     } else if (bio == "Edit profile to update bio") {
//       return "No bio available";
//     } else {
//       return bio;
//     }
//   }

//   Widget _tappbleText(
//       BuildContext context, String count, String text, String navigateTo) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, '/$navigateTo');
//       },
//       child: Row(
//         children: <Widget>[
//           customText(
//             '$count ',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
//           ),
//           customText(
//             '$text',
//             style: TextStyle(color: AppColor.darkGrey, fontSize: 17),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 10),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: 10,
//           ),
//           child: Row(
//             children: <Widget>[
//               UrlText(
//                 text: user.displayName,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//               SizedBox(
//                 width: 3,
//               ),
//               user.isVerified
//                   ? customIcon(context,
//                       icon: AppIcon.blueTick,
//                       istwitterIcon: true,
//                       iconColor: AppColor.primary,
//                       size: 13,
//                       paddingIcon: 3)
//                   : SizedBox(width: 0),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 9),
//           child: customText(
//             '${user.userName}',
//             style: subtitleStyle.copyWith(fontSize: 13),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: customText(
//             getBio(user.bio),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           child: Row(
//             children: <Widget>[
//               customIcon(context,
//                   icon: AppIcon.locationPin,
//                   size: 14,
//                   istwitterIcon: true,
//                   paddingIcon: 5,
//                   iconColor: AppColor.darkGrey),
//               SizedBox(width: 10),
//               customText(
//                 user.location,
//                 style: TextStyle(color: AppColor.darkGrey),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//           child: Row(
//             children: <Widget>[
//               customIcon(context,
//                   icon: AppIcon.calender,
//                   size: 14,
//                   istwitterIcon: true,
//                   paddingIcon: 5,
//                   iconColor: AppColor.darkGrey),
//               SizedBox(width: 10),
//               customText(
//                 getJoiningDate(user.createdAt),
//                 style: TextStyle(color: AppColor.darkGrey),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Choice {
//   const Choice({this.title, this.icon});

//   final IconData icon;
//   final String title;
// }

// const List<Choice> choices = const <Choice>[
//   const Choice(title: 'Share', icon: Icons.directions_car),
//   const Choice(title: 'Draft', icon: Icons.directions_bike),
//   const Choice(title: 'View Lists', icon: Icons.directions_boat),
//   const Choice(title: 'View Moments', icon: Icons.directions_bus),
//   const Choice(title: 'QR code', icon: Icons.directions_railway),
// ];

// class ChoiceCard extends StatelessWidget {
//   const ChoiceCard({Key key, this.choice}) : super(key: key);

//   final Choice choice;

//   @override
//   Widget build(BuildContext context) {
//     final TextStyle textStyle = Theme.of(context).textTheme.display1;
//     return Card(
//       color: Colors.white,
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Icon(choice.icon, size: 128.0, color: textStyle.color),
//             Text(choice.title, style: textStyle),
//           ],
//         ),
//       ),
//     );
//   }
// }

//       // RippleButton(
//                               //   splashColor:
//                               //       TwitterColor.dodgetBlue_50.withAlpha(100),
//                               //   borderRadius:
//                               //       BorderRadius.all(Radius.circular(60)),
//                               //   onPressed: () {
//                               //     // if (isMyProfile) {
//                               //     //   Navigator.pushNamed(
//                               //     //       context, '/EditProfile');
//                               //     // } else {
//                               //     //   authstate.followUser(
//                               //     //     removeFollower: isFollower(),
//                               //     //   );
//                               //     // }
//                               //   },
//   // : RippleButton(
//                                   //     splashColor: TwitterColor.dodgetBlue_50
//                                   //         .withAlpha(100),
//                                   //     borderRadius: BorderRadius.all(
//                                   //       Radius.circular(20),
//                                   //     ),
//                                   //     onPressed: null,

//                                   //     child: Container(
//                                   //       height: 35,
//                                   //       width: 35,
//                                   //       padding: EdgeInsets.only(
//                                   //           bottom: 5,
//                                   //           top: 0,
//                                   //           right: 0,
//                                   //           left: 0),
//                                   //       decoration: BoxDecoration(
//                                   //           border: Border.all(
//                                   //               color: isMyProfile
//                                   //                   ? Colors.black87
//                                   //                       .withAlpha(180)
//                                   //                   : Colors.blue,
//                                   //               width: 1),
//                                   //           shape: BoxShape.circle),
//                                   //       child: Icon(
//                                   //         IconData(AppIcon.messageEmpty,
//                                   //             fontFamily: 'TwitterIcon'),
//                                   //         color: Colors.blue,
//                                   //         size: 20,
//                                   //       ),

//                                   //       // customIcon(context, icon:AppIcon.messageEmpty, iconColor: TwitterColor.dodgetBlue, paddingIcon: 8)
//                                   //     ),
//                                   //   ),
//     //var state = Provider.of<FeedState>(context);
//     //var authstate = Provider.of<AuthState>(context);
//     //List<FeedModel> list;
//    // String id = widget.profileId ?? authstate.userId;

//     /// Filter user's tweet among all tweets available in home page tweets list
//    // if (state.feedlist != null && state.feedlist.length > 0) {
//     //  list = state.feedlist.where((x) => x.userId == id).toList();
//    // }

//   // isFollower() {
//   //   var authstate = Provider.of<AuthState>(context);
//   //   if (authstate.profileUserModel.followersList != null &&
//   //       authstate.profileUserModel.followersList.isNotEmpty) {
//   //     return (authstate.profileUserModel.followersList
//   //         .any((x) => x == authstate.userModel.userId));
//   //   } else {
//   //     return false;
//   //   }
//   // }

//   /// This meathod called when user pressed back button
//   /// When profile page is about to close
//   /// Maintain minimum user's profile in profile page list
//   ///
//   ///
//   ///
//                   /// Banner image
//                   // Padding(
//                   //   padding: EdgeInsets.only(top: 30),
//                   //   child: customNetworkImage(
//                   //       'https://pbs.twimg.com/profile_banners/457684585/1510495215/1500x500',
//                   //       fit: BoxFit.fill),
//                   // ),
