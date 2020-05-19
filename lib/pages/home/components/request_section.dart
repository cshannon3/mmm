import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/service_locator.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/platform_state.dart';
import 'package:flutter/widgets.dart';



const double tileW = 220.0;
const double tileH = 220.0;

class RequestSection extends StatelessWidget {
  final bool isMobile;
  const RequestSection({Key key, @required this.isMobile}) : super(key: key);
  @override

  Widget build(BuildContext context) {
   
    return  isMobile?  
     Container(
       height: 680.0,
       child: Column(
               // delegate: 
              children: 
        //  SliverChildListDelegate(
                 [
                    SizedBox(height: 20.0,),
                  formTitle("Is your organization in need of the following items?" ),
                  SizedBox(height: 10.0,),
                            Center(
                      child: Container(
                        width: 300.0,
                        child: CallToActionButton(
                  name: "Request Donation" ,
                  onPressed:  (){
                      var formManager = locator<FormManager>();
                      formManager.setForm("request");
                       },
                ),
                      ),
                    ),
                 SizedBox(height: 40.0,),
                Container(
                  width:tileW,
                  height:tileH,
                  child: StylizedImageBox(
                    bottomText: "Face Shields",
                    url:"https://cdn.myminifactory.com/assets/object-assets/5e8d747938361/images/720X720-img-20200408-083219749.jpg" )),
                Container(
                  width:tileW,
                  height:tileH,
                  child: StylizedImageBox(
                    bottomText: "Ear Savers",
                    url:"https://www.kold.com/resizer/V2_1DOI5V4K4m57fH9SdmUKZZYg=/1400x0/arc-anglerfish-arc2-prod-raycom.s3.amazonaws.com/public/SCALPHZ4Y5GLFDNEO63FGWO76Y.jpg" )),
               
                  SizedBox(height: 30.0,),
                   ] ))
        :
       //  SliverChildListDelegate(
               Container(
                 height:420.0,
                 child:Column(
                children:[
                     SizedBox(height: 20.0,),
                  formTitle("Is your organization in need of these items?" ),
                  SizedBox(height: 10.0,),
                            Center(
                      child: Container(
                        width: 300.0,
                        child: CallToActionButton(
                  name: "Request Donation" ,
                  onPressed:  (){
                      var formManager = locator<FormManager>();
                      formManager.setForm("request");
                     },
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                Container(
                  width:tileW,
                  height:tileH,
                  child: StylizedImageBox(
                    bottomText: "Face Shields",
                    url:"https://cdn.myminifactory.com/assets/object-assets/5e8d747938361/images/720X720-img-20200408-083219749.jpg" )),
               
                Container(
                  width:tileW ,
                  height:tileH,
                  child: StylizedImageBox(
                    bottomText: "Ear Savers",
                    url:"https://www.kold.com/resizer/V2_1DOI5V4K4m57fH9SdmUKZZYg=/1400x0/arc-anglerfish-arc2-prod-raycom.s3.amazonaws.com/public/SCALPHZ4Y5GLFDNEO63FGWO76Y.jpg" )),
                  ],),
                  SizedBox(height: 30.0,), ] 
       // )
    ),
     );
  }
}
