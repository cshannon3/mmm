

        // Container(
            //   margin: EdgeInsets.symmetric(vertical: 15),
            //   width: MediaQuery.of(context).size.width,
            //   child: FlatButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30)),
            //     color: Colors.black,
            //     onPressed: () { 
            //       tappedMenuButton(context, "/signUp");
            //     },
            //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //     child: TitleText('Create account', color: Colors.white),
            //   ),
            // )
     // Container(
            //  // margin: EdgeInsets.symmetric(vertical: 15),
            //   width: (w>600.0)?450:w-30.0,
            //   child: FlatButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(30)),
            //     color: Colors.grey[300],
            //     onPressed: () {
            //       tappedMenuButton(context, "/signIn");
            //     },
            //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            //     child: TitleText('Sign In', color: Colors.black),
            //   ),
            // ),


// class WelcomePage extends StatefulWidget {
//   WelcomePage({Key key}) : super(key: key);

//   @override
//   _WelcomePageState createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   Widget _submitButton() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 15),
//       width: MediaQuery.of(context).size.width,
//       child: FlatButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         color: Colors.blueAccent,
//         onPressed: () {
//        //   var state = Provider.of<AuthState>(context,listen: false);
//           tappedMenuButton(context, "/signUp");
//         },
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         child: TitleText('Create account', color: Colors.white),
//       ),
//     );
//   }

//   Widget _body() {
//     return SafeArea(
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: 40,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TitleText(
//               'Already Have an Account?',
//               fontSize: 25,
//             ),
//             SizedBox(
//               height: 20,
//             ),

//                 InkWell(
//                   onTap: () {
//                  //   var state = Provider.of<AuthState>(context,listen: false);
//                   //  state.
//                     tappedMenuButton(context, "/signIn");
//                   },
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
//                     child: TitleText(
//                       ' Log in',
//                       fontSize: 14,
//                       color: TwitterColor.dodgetBlue,
//                       fontWeight: FontWeight.w300,
//                     ),
//                   )),

//             SizedBox(height: 20),
//               _submitButton(),

//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var state = Provider.of<AuthState>(context,listen: false);
//     return  state.authStatus == AuthStatus.NOT_LOGGED_IN ||
//               state.authStatus == AuthStatus.NOT_DETERMINED
//           ? _body()
//           : HomePageMain()
//     ;
//   }
// }

// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) =>
//         SignIn(loginCallback: state.getCurrentUser),
//   ),
// );

// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => Signup(loginCallback: state.getCurrentUser),
//   ),
// );




// formSave("Save", onSave:(){
                    //   _emailLogin(context);

                    // })
  //  var state = Provider.of<AuthState>(context, listen: false);
    // if (state.isbusy) {
    //   return;
    // }
// Widget _entryFeild(String hint,
//     {TextEditingController controller, bool isPassword = false}) {
//   return Container(
//     margin: EdgeInsets.symmetric(vertical: 15),
//     decoration: BoxDecoration(
//       color: Colors.grey.shade200,
//       borderRadius: BorderRadius.circular(30),
//     ),
//     child: TextField(
//       controller: controller,
//       keyboardType: TextInputType.emailAddress,
//       style: TextStyle(
//         fontStyle: FontStyle.normal,
//         fontWeight: FontWeight.normal,
//       ),
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         hintText: hint,
//         border: InputBorder.none,
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(30.0)),
//             borderSide: BorderSide(color: Colors.blue)),
//         contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       ),
//     ),
//   );
// }

// Widget _body(BuildContext context) {

//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 150),
//             _entryFeild('Enter email', controller: _emailController),
//             _entryFeild('Enter password', controller: _passwordController, isPassword: true),
//             _emailLoginButton(context),
//             SizedBox(height: 20),
//             _labelButton('Forget password?', onPressed: () {
//               Navigator.of(context).pushNamed('/ForgetPasswordPage');
//             }),
//             Divider(
//               height: 30,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             GoogleLoginButton(
//               loginCallback:  state.getCurrentUser,
//               loader: loader,
//             ),
//             SizedBox(height: 100),
//           ],
//         ),
//       ),
//     );
//   }

// Widget _emailLoginButton(BuildContext context) {
//   return Container(
//     width: fullWidth(context),
//     margin: EdgeInsets.symmetric(vertical: 35),
//     child: FlatButton(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//       color: Colors.blueAccent,
//       onPressed: _emailLogin,
//       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//       child: TitleText('Submit', color: Colors.white),
//     ),
//   );
// }

// class SignIn extends StatefulWidget {
//   const SignIn({Key key,}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   TextEditingController _emailController;
//   TextEditingController _passwordController;
//   CustomLoader loader;
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     loader = CustomLoader();
//     super.initState();
//   }
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//   Widget _body(BuildContext context) {
//     var state = Provider.of<AuthState>(context, listen: false);
//     return SingleChildScrollView(
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 150),
//             _entryFeild('Enter email', controller: _emailController),
//             _entryFeild('Enter password',
//                 controller: _passwordController, isPassword: true),
//             _emailLoginButton(context),
//             SizedBox(height: 20),
//             _labelButton('Forget password?', onPressed: () {
//               Navigator.of(context).pushNamed('/ForgetPasswordPage');
//             }),
//             Divider(
//               height: 30,
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             GoogleLoginButton(
//               loginCallback:  state.getCurrentUser,
//               loader: loader,
//             ),
//             SizedBox(height: 100),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _entryFeild(String hint,
//       {TextEditingController controller, bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 15),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: TextField(
//         controller: controller,
//         keyboardType: TextInputType.emailAddress,
//         style: TextStyle(
//           fontStyle: FontStyle.normal,
//           fontWeight: FontWeight.normal,
//         ),
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           hintText: hint,
//           border: InputBorder.none,
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(30.0)),
//               borderSide: BorderSide(color: Colors.blue)),
//           contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//         ),
//       ),
//     );
//   }

//   Widget _labelButton(String title, {Function onPressed}) {
//     return FlatButton(
//       onPressed: () {
//         if (onPressed != null) {
//           onPressed();
//         }
//       },
//       splashColor: Colors.grey.shade200,
//       child: Text(
//         title,
//         style: TextStyle(
//             color:Colors.blue, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _emailLoginButton(BuildContext context) {
//     return Container(
//       width: fullWidth(context),
//       margin: EdgeInsets.symmetric(vertical: 35),
//       child: FlatButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         color: Colors.blueAccent,
//         onPressed: _emailLogin,
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         child: TitleText('Submit', color: Colors.white),
//       ),
//     );
//   }

//   void _emailLogin() {
//     var state = Provider.of<AuthState>(context, listen: false);
//     if (state.isbusy) {
//       return;
//     }
//     loader.showLoader(context);
//     var isValid = validateCredentials(
//         _scaffoldKey, _emailController.text, _passwordController.text);
//     if (isValid) {
//       state
//           .signIn(_emailController.text, _passwordController.text,
//               scaffoldKey: _scaffoldKey)
//           .then((status) {
//         if (state.user != null) {
//           loader.hideLoader();
//          state.getCurrentUser();
//           tappedMenuButton(context, "/");
//         } else {
//           cprint('Unable to login', errorIn: '_emailLoginButton');
//           loader.hideLoader();
//         }
//       });
//     } else {
//       loader.hideLoader();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: _body(context),
//     );
//   }
// }




  // Widget _body(BuildContext context) {
  //   return Container(
  //     height: fullHeight(context) - 88,
  //     padding: EdgeInsets.symmetric(horizontal: 30),
  //     child: Form(
  //       key: _formKey,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: <Widget>[
  //           _entryFeild('Name', controller: _nameController),
  //           _entryFeild('Enter email', controller: _emailController),
  //           // _entryFeild('Mobile no',controller: _mobileController),
  //           _entryFeild('Enter password',
  //               controller: _passwordController, isPassword: true),
  //           _entryFeild('Confirm password',
  //               controller: _confirmController, isPassword: true),
  //           _submitButton(context),

  //           Divider(height: 30),
  //           SizedBox(height: 30),
  //           // _googleLoginButton(context),
  //           GoogleLoginButton(
  //            // loginCallback: widget.loginCallback,
  //             loader: loader,
  //           ),
  //           SizedBox(height: 30),
  //         ],
  //       ),
  //     ),
  //   );
  // }


// class Signup extends StatefulWidget {
//   //final VoidCallback loginCallback; this.loginCallback

//   const Signup({Key key,}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   TextEditingController _nameController;
//   TextEditingController _emailController;
//   TextEditingController _passwordController;
//   TextEditingController _confirmController;
//   CustomLoader loader;
//   final _formKey = new GlobalKey<FormState>();
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     loader = CustomLoader();
//     _nameController = TextEditingController();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     _confirmController = TextEditingController();
//     super.initState();
//   }
//   void dispose() { 
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     _confirmController.dispose();
//     super.dispose();
//   }
//   Widget _body(BuildContext context) {
//     return Container(
//       height: fullHeight(context) - 88,
//       padding: EdgeInsets.symmetric(horizontal: 30),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             _entryFeild('Name', controller: _nameController),
//             _entryFeild('Enter email', controller: _emailController),
//             // _entryFeild('Mobile no',controller: _mobileController),
//             _entryFeild('Enter password',
//                 controller: _passwordController, isPassword: true),
//             _entryFeild('Confirm password',
//                 controller: _confirmController, isPassword: true),
//             _submitButton(context),

//             Divider(height: 30),
//             SizedBox(height: 30),
//             // _googleLoginButton(context),
//             GoogleLoginButton(
//              // loginCallback: widget.loginCallback,
//               loader: loader,
//             ),
//             SizedBox(height: 30),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _entryFeild(String hint,
//       {TextEditingController controller, bool isPassword = false}) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 15),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: TextField(
//         controller: controller,
//         keyboardType: TextInputType.emailAddress,
//         style: TextStyle(
//           fontStyle: FontStyle.normal,
//           fontWeight: FontWeight.normal,
//         ),
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           hintText: hint,
//           border: InputBorder.none,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(30.0),
//             ),
//             borderSide: BorderSide(color: Colors.blue),
//           ),
//           contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//         ),
//       ),
//     );
//   }

//   Widget _submitButton(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 15),
//       width: MediaQuery.of(context).size.width,
//       child: FlatButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         color: TwitterColor.dodgetBlue,
//         onPressed: _submitForm,
//         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//         child: Text('Sign up', style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }

//   void _googleLogin() {
//     var state = Provider.of<AuthState>(context, listen: false);
//     if (state.isbusy) {
//       return;
//     }
//     loader.showLoader(context);
//     state.handleGoogleSignIn().then((status) {
//       // print(status)
//       if (state.user != null) {
//         loader.hideLoader();
//         state.getCurrentUser();
//          tappedMenuButton(context, "/");
//       //  Navigator.pop(context);
//       //  widget.loginCallback();
//       } else {
//         loader.hideLoader();
//         cprint('Unable to login', errorIn: '_googleLoginButton');
//       }
//     });
//   }
//   void _submitForm() {
//     if (_emailController.text.isEmpty) {
//       customSnackBar(_scaffoldKey, 'Please enter name');
//       return;
//     }
//     if (_emailController.text.length > 27) {
//       customSnackBar(_scaffoldKey, 'Name length cannot exceed 27 character');
//       return;
//     }
//     if (_emailController.text == null ||
//         _emailController.text.isEmpty ||
//         _passwordController.text == null ||
//         _passwordController.text.isEmpty ||
//         _confirmController.text == null) {
//       customSnackBar(_scaffoldKey, 'Please fill form carefully');
//       return;
//     } else if (_passwordController.text != _confirmController.text) {
//       customSnackBar(
//           _scaffoldKey, 'Password and confirm password did not match');
//       return;
//     }

//     loader.showLoader(context);
//     var state = Provider.of<AuthState>(context, listen: false);
//     Random random = new Random();
//     int randomNumber = random.nextInt(8);

//     User user = User(
//       email: _emailController.text.toLowerCase(),
//       bio: 'Edit profile to update bio',
//       // contact:  _mobileController.text,
//       displayName: _nameController.text,
//       location: 'Somewhere in universe',
//       profilePic: dummyProfilePicList[randomNumber],
//       isVerified: false,
//     );
//     state
//         .signUp(
//       user,
//       password: _passwordController.text,
//       scaffoldKey: _scaffoldKey,
//     )
//         .then((status) {
//       print(status);
//     }).whenComplete(
//       () {
//         loader.hideLoader();
//           print("hello");
//         if (state.authStatus == AuthStatus.LOGGED_IN) {
//           print("hello");
//            state.sendEmailVerification(_scaffoldKey);
//            tappedMenuButton(context, "/");
//          // Navigator.pop(context);
//           //widget.loginCallback();
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: customText(
//           'Sign Up',
//           context: context,
//           style: TextStyle(fontSize: 20),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(child: _body(context)),
//     );
//   }

//   customText(String s, {BuildContext context, TextStyle style}) {}
// }


// import 'package:de_makes_final/pages/profile/profile_page.dart';
// import 'package:de_makes_final/state/app_state.dart';
// import 'package:de_makes_final/state/auth_state.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   final refreshIndicatorKey = new GlobalKey<RefreshIndicatorState>();
//   int pageIndex = 0;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       var state = Provider.of<AppState>(context, listen: false);
//       state.setpageIndex = 0;
//      // initTweets();
//       initProfile();
//       //initSearch();
//      // initNotificaiton();
//       //initChat();
//     });

//     super.initState();
//   }


//   void initProfile() {
//     var state = Provider.of<AuthState>(context, listen: false);
//     state.databaseInit();
//   }



//   Widget _body() {
//   //  _checkNotification();
//     return SafeArea(
//       child: Container(
//         child:ProfilePage()
//         // _getPage(Provider.of<AppState>(context).pageIndex),
//       ),
//     );
//   }

//   //Widget _getPage(int index) {
//   //  switch (index) {

//       // case 0:
//       //   return FeedPage(
//       //     scaffoldKey: _scaffoldKey,
//       //     refreshIndicatorKey: refreshIndicatorKey,
//       //   );
//       //   break;
//       // case 1:
//       //   return SearchPage(scaffoldKey: _scaffoldKey);
//       //   break;
//       // case 2:
//       //   return NotificationPage(scaffoldKey: _scaffoldKey);
//       //   break;
//       // case 3:
//       //   return ChatListPage(scaffoldKey: _scaffoldKey);
//       //   break;
//       // default:
//       //   return FeedPage(scaffoldKey: _scaffoldKey);
//       //   break;
//     //}
//  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//     //  bottomNavigationBar: BottomMenubar(),
//       //drawer: SidebarMenu(),
//       body: _body(),
//     );
//   }
// }
