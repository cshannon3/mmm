
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



