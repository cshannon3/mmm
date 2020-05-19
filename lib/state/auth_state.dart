
//import 'package:delaware_makes/models/user.dart';
import 'package:delaware_makes/shared_widgets/shared_widgets.dart';
import 'package:delaware_makes/state/base_state.dart';
import 'package:delaware_makes/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:path/path.dart' as Path;
// TODO add in google signin

class AuthState extends BaseState {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  bool isSignInWithGoogle = false;
  FirebaseUser user;
  String userId;//final  fb.Messaging _firebaseMessaging = fb.messaging();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();//fb.Query _profileQuery;

  /// Logout from device
  void logoutCallback() {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    userId = ''; //setUserModel(logout:true);
    user = null;// _profileUserModelList = null;
    if (isSignInWithGoogle) {
      _googleSignIn.signOut();
      logEvent('google_logout');
    }
    _firebaseAuth.signOut();
    notifyListeners();
  }

 /// Create user from `google login`
  /// If user is new then it create a new user
  /// If user is old then it just `authenticate` user and return firebase user data
  Future<String> handleGoogleSignIn() async {
    try {
      /// Record log in firebase kAnalytics about Google login
      // kAnalytics.logEvent(eventName: 'google_login');
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google login cancelled by user');
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      user = (await _firebaseAuth.signInWithCredential(credential)).user;
      authStatus = AuthStatus.LOGGED_IN;
      userId = user.uid;
      isSignInWithGoogle = true;
     // createUserFromGoogleSignIn(user);
      notifyListeners();
      return user.uid;
    } on PlatformException catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    } on Exception catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    } catch (error) {
      user = null;
      authStatus = AuthStatus.NOT_LOGGED_IN;
      cprint(error, errorIn: 'handleGoogleSignIn');
      return null;
    }
  }

  
  /// Verify user's credentials for login
  Future<String> signIn(String email, String password,
      {GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      loading = true;
      
      var result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      user = result.user;
      userId = user.uid; // loading=false;
      return user.uid;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'signIn');
      customSnackBar(scaffoldKey, error.message);
      return null;
    }
  }


  /// Create new user's profile in db
  Future<String> signUp(//User newUserModel,
  String userEmail,
      {GlobalKey<ScaffoldState> scaffoldKey, String password}) async {
    try {
      
      loading = true;
   //   print("s");
      var result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail,
        password: password,).catchError((onError){
          print(onError);
        });
      user = result.user;
      //print(user);
      authStatus = AuthStatus.LOGGED_IN;  //  kAnalytics.logSignUp(signUpMethod: 'register');
      return user.uid;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'signUp');
      customSnackBar(scaffoldKey, error.message);
      return null;
    }
  }
  /// Fetch current user profile
  Future<FirebaseUser> getCurrentUser() async {
    try {
      loading = true;
      logEvent('get_currentUSer');
      user = await _firebaseAuth.currentUser();
      if (user != null) {
        print("User"); // print(user.displayName);
        authStatus = AuthStatus.LOGGED_IN;
        userId = user.uid;   //  await getProfileUser();
         return user;
      } else {
        authStatus = AuthStatus.NOT_LOGGED_IN;
      } //  loading = false;
    return user;
    } catch (error) {
      loading = false;
      cprint(error, errorIn: 'getCurrentUser');
      authStatus = AuthStatus.NOT_LOGGED_IN;
      return null;
    }
  }

  /// Reload user to get refresh user data
  Future<bool> reloadUser() async {
    await user.reload();
    user = await _firebaseAuth.currentUser();
    
    if (user.isEmailVerified) {
      
     // userModel.isVerified = true;  // If user verifed his email // Update user in firebase realtime kDatabase
    //  createUser(userModel);
      cprint('User email verification complete');
      logEvent('email_verification_complete',
          parameter: {user.email: user.email});
      return true;
    }
    return false;
  }
  /// Send email verification link to email2
  Future<void> sendEmailVerification({ 
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification().then((_) {
      logEvent('email_verifcation_sent',
          parameter: {user.displayName: user.email});
      customSnackBar(
        scaffoldKey,
        'An email verification link is send to your email.',
      );
    }).catchError((error) {
      cprint(error.message, errorIn: 'sendEmailVerification');
      logEvent('email_verifcation_block',
          parameter: {user.displayName: user.email});
      customSnackBar(
        scaffoldKey,
        error.message,
      );
    });
  }
    /// Check if user's email is verified
  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  /// Send password reset link to email
  Future<void> forgetPassword(String email,
      {GlobalKey<ScaffoldState> scaffoldKey}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email).then((value) {
        customSnackBar(scaffoldKey,
            'A reset password link is sent yo your mail.You can reset your password from there');
        logEvent('forgot+password');
      }).catchError((error) {
        cprint(error.message);
        return false;
      });
    } catch (error) {
      customSnackBar(scaffoldKey, error.message);
      return Future.value(false);
    }
  }

}




// /// Alter select auth method, login and sign up page
  // void openSignUpPage() {
  //   authStatus = AuthStatus.NOT_LOGGED_IN;
  //   userId = '';
  //   notifyListeners();
  // }


    //   UserUpdateInfo updateInfo = UserUpdateInfo();
    //   updateInfo.displayName = newUserModel.displayName;
    //   updateInfo.photoUrl = newUserModel.profilePic;
    //   await result.user.updateProfile(updateInfo);
    //   setUserModel(newUserModel: newUserModel, id: user.uid);
    //  // _userModel = userModel; // _userModel.id = user.uid;
    //   createUser(_userModel, isNewUser: true);


  /// `Create` and `Update` user
  /// IF `newUser` is true new user is created
  /// Else existing user will update with new values
  // createUser(User newUserModel, {bool isNewUser = false}) {
  //   if (isNewUser) {// Create username by the combination of name and id
  //     newUserModel.userName = getUserName(id: newUserModel.id, name: user.displayName);
  //     print(newUserModel.userName);//kAnalytics.logEvent('create_newUser',{});// Time at which user is created
  //     newUserModel.createdAt = DateTime.now().toUtc().toString();
  //   }
  //   fsRepo.saveToFirebase(
  //       collectionName: "users", itemMap: newUserModel.toJson(), id: newUserModel.id);
  //   setUserModel(newUserModel: newUserModel);
  //   if (_profileUserModelList != null) {
  //     _profileUserModelList.last = _userModel;
  //   }
  //   loading = false;
  // }

  //bool _profileQuery = false;
 // List _profileUserModelList;
 // User _userModel;//bool _isBusy;
 // bool get isLoggedIn => _userModel!=null;
 // User get userModel => _userModel;

  // User get profileUserModel {
  //   if (_profileUserModelList != null && _profileUserModelList.length > 0) {
  //     return _profileUserModelList.last;
  //   } else {
  //     return null;
  //   }
  // }

  // setUserModel({User newUserModel, String id, bool logout=false}){
  //   if(logout)
  //     _userModel=null;
  //   else{
  //     _userModel=newUserModel;
  //     if(id!=null)
  //       _userModel.id= id;
  //   }
  // }
 

  // void removeLastUser() {
  //   _profileUserModelList.removeLast();
  // }

  // /// `Fetch` user `detail` whoose userId is passed
  // Future<Map> getuserDetail(String userId) async {
  //   User user;
  //   var data =
  //       await fsRepo.getFirebaseItem(collectionName: "users", id: userId);
  //   if (data != null) {
  //     user = User.fromJson(data);
  //     return user;
  //   } else {
  //     return null;
  //   }
  // }

  // /// Fetch user profile
  // /// If `userProfileId` is null then logged in user's profile will fetched
  // Future<void> getProfileUser({String userProfileId}) async{
  //   try {
  //     loading = true;
  //     if (_profileUserModelList == null) {
  //       _profileUserModelList = [];
  //     }
  //     userProfileId = userProfileId == null ? user.uid : userProfileId;
  //     var map = await fsRepo.getFirebaseItem(collectionName: "users", id: userId);
  //       if (map == null) return;
  //         _profileUserModelList.add(User.fromJson(map));
  //         if (userProfileId == user.uid) {
  //           setUserModel(newUserModel: _profileUserModelList.last);  //  _userModel = _profileUserModelList.last;
  //           _userModel.isVerified = user.isEmailVerified;
  //           // TODO add back in email ver
  //           // if (!user.isEmailVerified) {
  //           //   // Check if logged in user verified his email address or not
  //           //   reloadUser(); }
  //           // if (_userModel.fcmToken == null) {
  //           //   updateFCMToken(); }
  //         logEvent('get_profile');
  //       }
  //       loading = false;
    
  //   } catch (error) {
  //     loading = false;
  //     cprint(error, errorIn: 'getProfileUser');
  //   }
  //   return;
  // }

  // void _onProfileChanged(Map data) {
  //   if (data != null) {
  //     final updatedUser = User.fromJson(data);
  //     if (updatedUser.id == user.uid) {
  //       setUserModel(newUserModel:updatedUser);
  //       //_userModel = updatedUser;
  //     }
  //     cprint('User Updated');
  //     notifyListeners();
  //   }
  // }
   



//  /// Create user from `google login`
//   /// If user is new then it create a new user
//   /// If user is old then it just `authenticate` user and return firebase user data
//   Future<FirebaseUser> handleGoogleSignIn() async {
//     try {
//       /// Record log in firebase kAnalytics about Google login
//       // kAnalytics.logEvent(eventName: 'google_login');
//       final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//       if (googleUser == null) {
//         throw Exception('Google login cancelled by user');
//       }
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.getCredential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//       user = (await _firebaseAuth.signInWithCredential(credential)).user;
//       authStatus = AuthStatus.LOGGED_IN;
//       userId = user.uid;
//       isSignInWithGoogle = true;
//       createUserFromGoogleSignIn(user);
//       notifyListeners();
//       return user;
//     } on PlatformException catch (error) {
//       user = null;
//       authStatus = AuthStatus.NOT_LOGGED_IN;
//       cprint(error, errorIn: 'handleGoogleSignIn');
//       return null;
//     } on Exception catch (error) {
//       user = null;
//       authStatus = AuthStatus.NOT_LOGGED_IN;
//       cprint(error, errorIn: 'handleGoogleSignIn');
//       return null;
//     } catch (error) {
//       user = null;
//       authStatus = AuthStatus.NOT_LOGGED_IN;
//       cprint(error, errorIn: 'handleGoogleSignIn');
//       return null;
//     }
//   }

  // /// Create user profile from google login
  // createUserFromGoogleSignIn(FirebaseUser user) {
  //   var diff = DateTime.now().difference(user.metadata.creationTime);
  //   // Check if user is new or old
  //   // If user is new then add new user to firebase realtime kDatabase
  //   if (diff < Duration(seconds: 15)) {
  //     User model = User(
  //       bio: 'Edit profile to update bio',
  //       location: 'Somewhere in universe',
  //       profilePic: user.photoUrl,
  //       displayName: user.displayName,
  //       email: user.email,
  //       id: user.uid,
  //       contact: user.phoneNumber,
  //       isVerified: user.isEmailVerified,
  //     );
  //     createUser(model, isNewUser: true);
  //   } else {
  //     cprint('Last login at: ${user.metadata.lastSignInTime}');
  //   }
  // }
  



  /// if firebase token not available in profile
  /// Then get token from firebase and save it to profile
  /// When someone sends you a message FCM token is used
  // void updateFCMToken() {
  //   if (_userModel == null) {
  //     return;
  //   }
  //   getProfileUser();
  //   fbMessaging.getToken().then((String token) {
  //     assert(token != null);
  //     _userModel.fcmToken = token;
  //     createUser(_userModel);
  //   });
  // }
  /// `Update user` profile
  // Future<void> updateUserProfile(User userModel, {File image}) async {
  //   try {
  //     if (image == null) {
  //       createUser(userModel);
  //     } else {

  //       Uri imageUri = await fbStorage.getImageURI(imagePath:"users/${userModel.profilePic}");
  //       print(imageUri);
  //       UserUpdateInfo updateInfo = UserUpdateInfo();
  //       updateInfo.displayName = userModel?.displayName ?? user.displayName;
  //       updateInfo.photoUrl = imageUri.path;
  //       await user.updateProfile(updateInfo);
  //       if (userModel != null) {
  //         userModel.profilePic = imageUri.path;
  //         createUser(userModel);
  //       } else {
  //         _userModel.profilePic = imageUri.path;
  //         createUser(_userModel);
  //       }
  //     }
  //     logEvent('update_user');
  //   } catch (error) {
  //     cprint(error, errorIn: 'updateUserProfile');
  //   }
  // }
