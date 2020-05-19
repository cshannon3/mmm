import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/routes.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:flutter/widgets.dart';

const String makerCTA = "Willing to Help Produce and Distribute These Items?";

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
            tappedMenuButton(context, "/designs");
          },
             //() {
            //   var platform = locator<PlatformInfo>();
            //   platform.setOverlay("signUp");
            // },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Container(height:500.0,
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
              children: <Widget>[designs(context), faceshield()],
            ),

            
            SizedBox(
              height: 60.0,
            ),
          ])//)
        ): Container(
          height: 460.0,
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
                  designs(context),
                  faceshield(),
                  //  share(),
                  // discover(),
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
            ]),
        );
  }

  Widget share() => Container(
      width: 220.0,
      height: 220.0,
      child: StylizedImageBox(
          bottomText: "Share Makes",
          url:
              "https://firebasestorage.googleapis.com/v0/b/million-more-makers.appspot.com/o/userupdates%2F45813f00-9636-11ea-ad9c-85a16895bf4b?alt=media&token=dc6f4399-8826-45e9-a451-d712e8e76494"));
  // Widget delivery()=> Container(
  //               width:200.0,
  //               height:220.0,
  //               child: StylizedImageBox(
  //                 bottomText: "Deliver Items",
  //                 url:"https://scontent.fphl2-4.fna.fbcdn.net/v/t1.0-9/95258229_10163550216665092_3526744581871763456_o.jpg?_nc_cat=106&_nc_sid=730e14&_nc_ohc=OBfvlwqR748AX9Z9-EW&_nc_ht=scontent.fphl2-4.fna&oh=aa44c4960dc3dbfaac3140cf21330604&oe=5EE39A03" ));
  Widget discover() => Container(
      width: 220.0,
      height: 220.0,
      child: StylizedImageBox(
          bottomText: "Discover Other Designs",
          url:
              "https://scontent.fphl2-4.fna.fbcdn.net/v/t1.0-9/97340636_3236644053022009_4108035780813783040_o.jpg?_nc_cat=110&_nc_sid=825194&_nc_ohc=ZniW0vNucD4AX8pDhI4&_nc_ht=scontent.fphl2-4.fna&oh=8eb173d87f38e05e32da6604e33ebc9d&oe=5EE3D2F4"));

  Widget designs(BuildContext context) => Container(
      width: 220.0,
      height: 220.0,
      child: StylizedImageBox(
          onPressed: () {
            tappedMenuButton(context, "/designs");
          },
          bottomText: "Help Produce Items",
          url:"https://scontent.fphl2-1.fna.fbcdn.net/v/t1.0-9/92470100_10222513279318993_2011992938938105856_o.jpg?_nc_cat=103&_nc_sid=825194&_nc_ohc=ZSuZYyg4pvoAX8gClpc&_nc_ht=scontent.fphl2-1.fna&oh=704f95c416f69fbce85cb118565722ca&oe=5EE55C61"));

  Widget faceshield() => Container(
      width: 220.0,
      height: 220.0,
      child: StylizedImageBox(
        topRightWidget: iconButton(icon: CommonIcons.INFO, onPressed: null, toolTip: 'If you don\'t have plastic for the shields, enter info here'),
          onPressed: () {
            var formManager = locator<FormManager>();
            formManager.setForm("requestMaterial");
            },
          bottomText: "Request Plastic Shields",
          url: "https://www.tcr-online.com/v/vspfiles/photos/EYE-8160-2T.jpg"));
}

