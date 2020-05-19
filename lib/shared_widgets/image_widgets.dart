
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delaware_makes/utils/utils.dart';

import 'package:delaware_makes/extensions/hover_extension.dart';
class StylizedImageBox extends StatelessWidget {
     final Widget topLeftWidget;
     final Widget topRightWidget;
     final Widget topCenterWidget;
     final Widget bottomWidget;
     final String url;
     final String bottomText;
     final Function onPressed;

     StylizedImageBox({
       Key key, 
       this.topLeftWidget, 
       this.topRightWidget, 
       this.topCenterWidget, 
       this.bottomWidget, 
       this.onPressed,
      @required this.url, 
       this.bottomText}) : super(key: key);


    Widget getBottomWidget()=>bottomWidget??Text( 
                          bottomText??"",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );

     @override
     Widget build(BuildContext context) {
       return  Container(
          child: InkWell(
            onTap: onPressed,
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(url, fit: BoxFit.cover, width: 1000.0, alignment: Alignment.center,),
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
                          child: getBottomWidget()
                        ),
                      ),
                      Align(alignment:Alignment.topLeft, child: topLeftWidget??SizedBox(),),
                      Align(alignment:Alignment.topCenter, child: topCenterWidget??SizedBox(),),
                      Align(alignment:Alignment.topRight, child: topRightWidget??SizedBox(),),
                    ],
                  )),
            ),
          ),
        ).showCursorOnHover.moveUpOnHover;
     }
   }




Widget getImageCarousel({@required List resources})=>CarouselSlider(
  options: CarouselOptions(),
  items: imageSliders(resources));
  
List<Widget> imageSliders(List resources) {
   //print(resources);
    List<Widget> imgs = [];
    resources.forEach((resData) {
      String url = safeGet(key: "url", map: resData, alt: "");
      if (url != "" && resData["isVerified"]==true &&
      (resData["type"]=="Image" || resData["type"]=="Update")) {
        imgs.add(StylizedImageBox(url:url));
      }
    });
    return imgs;
  }


