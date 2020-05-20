
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/data_repo.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const String makerCTA = "Willing to Help Produce and Distribute These Items?";
const double tileW = 200.0;
const double tileH = 220.0;
const double tileWdesk = 160.0;
const double tileHdesk = 180.0;

class MakerSection extends StatelessWidget {
  final bool isMobile;
  const MakerSection({
    Key key,
    @required this.isMobile,
  }) : super(key: key);
  Widget cta(BuildContext context) => Center(
        child: Container(
          width: 300.0,
          child: CallToActionButton(
            name: "Get Involved",
             onPressed:  () {
            tappedMenuButton(context, "/designs");},),
        ),
      );

  @override
  Widget build(BuildContext context) {

    var dataRepo= locator<DataRepo>();
    List groupsData=dataRepo.getItemsWhere("groups",getLinkedData: true);
    groupsData.sort((a,b) => safeGet(map: b, key:"claims", alt:[]).length.compareTo(safeGet(map: a, key:"claims", alt:[]).length));
  if(groupsData.length>13)groupsData= groupsData.sublist(0, 13);
   List<String> groupsNames = [];
   groupsData.forEach((value) {
     String orgName=  safeGet(map: value, key:"name", alt:"");
     if(orgName!="")groupsNames.add(orgName);
   });

    return isMobile
        ? Container(height:850.0,
          child:
           Column(
           children:[
            SizedBox(
              height: 30.0,
            ),
            formTitle(makerCTA),
            SizedBox(
              height: 20.0,
            ),
            cta(context),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                designs(context, isMobile), 
                 locations(context, isMobile)
               // faceshield()
                ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Container(height: double.infinity, width: double.infinity,
                         child:ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child:Stack(children: [
     Container(
       height: double.infinity,width:double.infinity,
       child: Image.network(
         "https://scontent.fphl2-1.fna.fbcdn.net/v/t1.15752-9/s2048x2048/97004143_237907727468307_3348191839210438656_n.jpg?_nc_cat=100&_nc_sid=b96e70&_nc_ohc=f5XU8kL6bVIAX9WZaBz&_nc_ht=scontent.fphl2-1.fna&_nc_tp=7&oh=d91b91d0aa5c5392ce61cd4ab6ee8bd1&oe=5EE9CFBA",
         fit: BoxFit.cover,
         )),
                Container(height: double.infinity,width:double.infinity, color:Colors.black.withOpacity(0.6),
                child: Padding(
                  padding:EdgeInsets.only(left:8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height:20),
                    Text("Groups Involved:", style: TextStyle( color:Colors.white, fontSize: 20.0),),
                    SizedBox(height:10),
                    ...groupsNames.map((e) => Padding(
                      padding: EdgeInsets.only(top:3.0),
                      child: Text(e, style: TextStyle( color:Colors.white, fontSize: 16.0)),
                    )),
                    Text("...", style: TextStyle( color:Colors.white, fontSize: 20.0),),
                  
                  ],),
                ),
                ),

          ]))),
                       ),
                 
          ),
              SizedBox(
              height: 10.0,
            ),
          ])//)
          
        ): Container(
          height: 460.0,
          child: Row(
            children: [
                 Expanded(
                       child: Padding(
                         padding: const EdgeInsets.all(20.0),
                         child: Container(height: double.infinity, width: double.infinity,
                         child:ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child:Stack(children: [
     Container(
       height: double.infinity,width:double.infinity,
       child: Image.network(
         "https://scontent.fphl2-1.fna.fbcdn.net/v/t1.15752-9/s2048x2048/97004143_237907727468307_3348191839210438656_n.jpg?_nc_cat=100&_nc_sid=b96e70&_nc_ohc=f5XU8kL6bVIAX9WZaBz&_nc_ht=scontent.fphl2-1.fna&_nc_tp=7&oh=d91b91d0aa5c5392ce61cd4ab6ee8bd1&oe=5EE9CFBA",
         fit: BoxFit.cover,
         )),
                Container(height: double.infinity,width:double.infinity, color:Colors.black.withOpacity(0.6),
                child: Padding(
                  padding:EdgeInsets.only(left:8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(height:20),
                    Text("Groups Involved:", style: TextStyle( color:Colors.white, fontSize: 20.0),),
                    SizedBox(height:10),
                    ...groupsNames.map((e) => Padding(
                      padding: EdgeInsets.only(top:3.0),
                      child: Text(e, style: TextStyle( color:Colors.white, fontSize: 16.0)),
                    )),
                    Text("...", style: TextStyle( color:Colors.white, fontSize: 20.0),),
                  
                  ],),
                ),
                ),
          ]))),
                       ),
                 
          ),
              Expanded(
                child: Column(
                  children:
                    //delegate: SliverChildListDelegate([
                   [ SizedBox(
                      height: 30.0,
                    ),
                    formTitle(makerCTA),
                    SizedBox(
                      height: 20.0,
                    ),
                    cta(context),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        designs(context, isMobile),
                        locations(context, isMobile)
                 
                      ],
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                  ]),
              ),
            ],
          ),
        );
  }
  Widget share(bool mobile) => Container(
      width: 220.0,
      height: 220.0,
      child: StylizedImageBox(
          bottomText: "Share Makes",
          url:
              "https://firebasestorage.googleapis.com/v0/b/million-more-makers.appspot.com/o/userupdates%2F45813f00-9636-11ea-ad9c-85a16895bf4b?alt=media&token=dc6f4399-8826-45e9-a451-d712e8e76494"));
  
  Widget discover(bool mobile) => Container(
      width: 220.0,
      height: 220.0,
      child: StylizedImageBox(
          bottomText: "Discover Other Designs",
          url:
              "https://scontent.fphl2-4.fna.fbcdn.net/v/t1.0-9/97340636_3236644053022009_4108035780813783040_o.jpg?_nc_cat=110&_nc_sid=825194&_nc_ohc=ZniW0vNucD4AX8pDhI4&_nc_ht=scontent.fphl2-4.fna&oh=8eb173d87f38e05e32da6604e33ebc9d&oe=5EE3D2F4"));

  Widget designs(BuildContext context,bool mobile) => Container(
      width: mobile ?tileW:tileWdesk,
      height: mobile ?tileH:tileHdesk,
      child: StylizedImageBox(
          onPressed: () {
            tappedMenuButton(context, "/designs");
          },
          bottomText: "Learn More",
          url:"https://scontent.fphl2-1.fna.fbcdn.net/v/t1.0-9/92470100_10222513279318993_2011992938938105856_o.jpg?_nc_cat=103&_nc_sid=825194&_nc_ohc=ZSuZYyg4pvoAX8gClpc&_nc_ht=scontent.fphl2-1.fna&oh=704f95c416f69fbce85cb118565722ca&oe=5EE55C61"));


Widget locations(BuildContext context, bool mobile) => Container(
      width: mobile ?tileW:tileWdesk,
      height: mobile ?tileH:tileHdesk,
      child: StylizedImageBox(
        //topRightWidget: iconButton(icon: CommonIcons.INFO, onPressed: null, ),
          onPressed: () {
             tappedMenuButton(context, "/map");
            },
          bottomText: "Help Produce Items",
          url: "https://scontent.fphl2-1.fna.fbcdn.net/v/t1.0-9/93378709_3139143336119330_2227783348703461376_o.jpg?_nc_cat=103&_nc_sid=825194&_nc_ohc=f5BgQjmFw74AX9AmNSt&_nc_ht=scontent.fphl2-1.fna&oh=d815e1bbda06cc71ad42149fca2a50ca&oe=5EEA94D4"));


}


// Widget delivery()=> Container(
  //               width:200.0,
  //               height:220.0,
  //               child: StylizedImageBox(
  //                 bottomText: "Deliver Items",
  //                 url:"https://scontent.fphl2-4.fna.fbcdn.net/v/t1.0-9/95258229_10163550216665092_3526744581871763456_o.jpg?_nc_cat=106&_nc_sid=730e14&_nc_ohc=OBfvlwqR748AX9Z9-EW&_nc_ht=scontent.fphl2-4.fna&oh=aa44c4960dc3dbfaac3140cf21330604&oe=5EE39A03" ));


    // Widget faceshield() => Container(
  //     width: 220.0,
  //     height: 220.0,
  //     child: StylizedImageBox(
  //       topRightWidget: iconButton(icon: CommonIcons.INFO, onPressed: null, toolTip: 'If you don\'t have plastic for the shields, enter info here'),
  //         onPressed: () {
  //           var formManager = locator<FormManager>();
  //           formManager.setForm("requestMaterial");
  //           },
  //         bottomText: "Request Plastic Shields",
  //         url: "https://www.tcr-online.com/v/vspfiles/photos/EYE-8160-2T.jpg"));