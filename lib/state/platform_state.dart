
import 'package:delaware_makes/forms/form_manager.dart';
import 'package:delaware_makes/forms/form_overlay.dart';
import 'package:delaware_makes/service_locator.dart';
//import 'package:delaware_makes/forms/form_model.dart';
//import 'package:delaware_makes/forms/forms.dart';
//import 'package:delaware_makes/service_locator.dart';
import 'package:flutter/material.dart';//import 'package:delaware_makes/pages/pages.dart';
//import 'app_state.dart';
import 'base_state.dart';

//import 'package:delaware_makes/state/app_state.dart';
// import 'package:delaware_makes/utils/utils.dart';

// import 'package:firebase/firebase.dart' as fb;
// import 'package:universal_html/prefer_universal/html.dart' as html;

enum PlatformType{
  MOBILE,
  DESKTOP
}

class PlatformInfo {//extends BaseState {
  Size _screenSize;
  Size _currentWidgetSize;
  PlatformType _platformType;//Widget _currentOverlay;
  bool refreshScreen=false;
  bool hasOverlay=false;
  PlatformInfo();
  //String _currentType="root";

  Size get screenSize => _screenSize;
  Size get size => _currentWidgetSize;
  PlatformType get platform => _platformType;
  double get w => _screenSize.width;
  double get h => _screenSize.height;
  //String get currentType => _currentType;

  set screenSize(Size size){
    _screenSize=size;
    _setPlatformType();
    //notifyListeners();
  }
  set widgetSize(Size size){
    _currentWidgetSize=size;
   // notifyListeners();
  }

  bool checkMobile(Size s){
    return s.width<650;
  }

  _setPlatformType(){
      _platformType = _screenSize.width<650?PlatformType.MOBILE:PlatformType.DESKTOP;
  }





}


// setOverlay(String type){
//   _currentType=type;
//   notifyListeners();
// }

  // if(_currentType=="root" || _currentType==""){  //  print("null overlay");
  //   return SizedBox();
  //   }


 //formManager.getOverlayWidget(_currentType)
// Widget _getOverlayWidget(){
//   var appstate = locator<AppState>();
  
//   switch (_currentType) {
//     case "signUp":
//      return Signup();
//        break;
//     case "signIn":
//       return  SignIn();
//       break;
//     case 'login':
//     return   WelcomePage();
//      break;
//     case 'update':
//   return  UpdateForm();
//       break;
//     case 'claim':
//     return 
//     ClaimsForm();
//       break;
//     case "request":
//        // appstate.initRequest();
//         return  FormOverlay(
//           forms: [
//             FormModel(formData:userInfo()),
//             FormModel(formData:orgInfo( )),
//             FormModel(formData:requestInfo(
//               appstate.dataRepo.getItemsWhere("designs",fieldFilters: {"isOffered": true}) 
//             )),
//             FormModel(formData:deliveryInfo()),
//           ],
//           onComplete: (Map data){

//           },
//         );
//       break;
//   case "requestMaterial":
//    return  MaterialRequestPage();



//       break;
//     default:
//     return SizedBox();
//       break;
//   }
   
// }
//  uploadImage() {
//     // HTML input element
//     html.InputElement uploadInput = html.FileUploadInputElement();
//     uploadInput.click();
//     uploadInput.onChange.listen(
//       (changeEvent) {
//         final file = uploadInput.files.first;
//         final reader = html.FileReader();
//         reader.readAsDataUrl(file);
//         reader.onLoadEnd.listen(
//           // After file finiesh reading and loading, it will be uploaded to firebase storage
//           (loadEndEvent) async {
//            // loader.showLoader(context);
//              uploadImageFile(file,);
//           },
//         );
//       },
//     );
//   }


//   uploadImageFile(html.File image,
//         ) async { // print(image.name);
//         String name = safeGet(map:appstate.currentUser??{}, key:"displayName", alt:"");
//         String label = name + generateIDTime().substring(0, 5);
//       fb.StorageReference storageRef = fb.storage().ref('userupdates/$label');
//       fb.UploadTaskSnapshot uploadTaskSnapshot = await storageRef.put(image).future;
//       Uri imageUri = await uploadTaskSnapshot.ref.getDownloadURL();
//       //loader.hideLoader();
//       setState(() {
//          imgPath = imageUri.toString();
//          appstate.buffer["url"]=imgPath;
//       });
//       return imageUri;
//   }