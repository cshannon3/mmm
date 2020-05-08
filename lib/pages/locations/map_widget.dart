
import 'package:de_makes_final/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart'as gmaps;
import 'dart:ui' as ui;

import 'package:universal_html/html.dart';
// still todo
//  description
// fix icons, decription
class GoogleMap extends StatelessWidget {
  //final Function(CustomModel place) clickPlace;
  final List orgsData;
  //final List<CustomModel> hubs;
  const GoogleMap({Key key, this.orgsData}) : super(key: key);
 //const GoogleMap({Key key, this.clickPlace, this.places, this.hubs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var dataRepo = locator<DataRepo>();
    String htmlId = "7";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = gmaps.MapOptions()
        ..zoom = 8
        ..center = gmaps.LatLng(39.18, -75.277);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = gmaps.GMap(elem, mapOptions);
      if(orgsData!=null){
      orgsData.forEach((place) {
  var contentString = '<div id="content">' +
    '<div id="siteNotice">' +
    '</div>' +
     '<h1 id="firstHeading" class="firstHeading">${safeGet(key:"Name", map:place, alt:"")}</h1>' +
    // '<img src="https://scontent.fphl2-2.fna.fbcdn.net/v/t1.15752-9/94710630_280291472978037_3910705887810945024_n.jpg?_nc_cat=103&_nc_sid=b96e70&_nc_ohc=gmoLv7UYpNsAX-U0m54&_nc_ht=scontent.fphl2-2.fna&oh=077fdf9879c9821df26c626f0dcbee72&oe=5ED624C3" alt="Smiley face" height="250" width="250">'+
    '<div id="bodyContent">' +
    '<p><b>Address:${safeGet(key:"Address", map:place, alt:"")}</b>.</p>';
    //int k =0;
    // place.requests.forEach((element) { 
    //   if(element.designID!="sewnmask"){
    //   contentString+='<p><b>${element.designID} :${element.quantityRecieved}/${element.quantityRequested}</b>.</p>';
    //   }
    //  // k+=1;
    // });
   contentString+=// '<p><b> Pickup Times:</b>.</p>' +
   // '<p><b> Contact Info:</b><a href="https://www.facebook.com/kathy.buterbaugh.7"> Kathy Buterbaugh </p>' +
    '</div>' +
    '</div>';
   
        final infoWindow = gmaps.InfoWindow(gmaps.InfoWindowOptions()..content = contentString);
        gmaps.Icon i = gmaps.Icon()
             //  ..url=place.icon??"http://maps.google.com/mapfiles/kml/paddle/grn-circle-lv.png"
             ..url="http://maps.google.com/mapfiles/kml/paddle/grn-circle-lv.png"
               ..scaledSize=gmaps.Size(20,20)
               ..size=gmaps.Size(20,20);
        double lat= safeGet(key:"Lat", map:place, alt:null );
        double lng= safeGet(key:"Lng", map:place, alt:null);
        if(lat!=null && lng!=null){
        final marker1= gmaps.Marker(gmaps.MarkerOptions()
        ..position = gmaps.LatLng(lat,lng)
        ..map = map
        ..title = safeGet(key:"Name", map:place, alt:"")
        
        // TODO back to icons
        ..icon =i
        );
        marker1..onClick.listen((event) { 
        //  clickPlace(place);
          infoWindow.open(map, marker1);
         } );
        }
      });
      return elem;
      }
    });
    
    return HtmlElementView(viewType: htmlId);
  }
}

