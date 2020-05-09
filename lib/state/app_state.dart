
import 'package:de_makes_final/apis/googleclient/gmanager/gmanager.dart';
//import 'package:de_makes_final/models/user.dart';
import 'package:de_makes_final/state/auth_state.dart';
import 'package:de_makes_final/state/base_state.dart';
import 'package:de_makes_final/state/data_repo.dart';
import 'package:de_makes_final/utils/secrets.dart' as secrets;
import 'package:de_makes_final/utils/utility.dart';
import 'package:flutter/material.dart';

class AppState extends BaseState {
  Map currentUser;
  bool loggedIn = false;
  Map buffer={};
  DataRepo dataRepo;
  AuthState authState;
  String overlay="";

  AppState();

  
  signIn(String email, String password,{GlobalKey<ScaffoldState> scaffoldKey}) async{
    String userID = await authState.signIn(email, password, scaffoldKey: scaffoldKey);
    loggedIn=true;
    currentUser = dataRepo.getModelData("users", userID);
    print(currentUser);
  }
  initSignUp(){
    buffer={};
    buffer["id"]=generateNewID();

  }
  signUp({GlobalKey<ScaffoldState> scaffoldKey}){
    Map newUser={

    };
  }
  logout(){}

  initialize() async {
    final gmanager = GManager(secrets.credentials);
    dataRepo = DataRepo(gmanager);
    authState=AuthState();
    dataRepo.initializeDummy();
  }

  initRequest(){
    buffer={};
    buffer["id"]=generateNewID();

  }
  submitRequest(){

  }

  initUpdate(){
    buffer={};
    buffer["id"]=generateNewID();
   // buffer["userID"]=currentUser.id;
  }
  submitUpdate(){
    
        
//submit 
   // updateClaim()
  }


  initClaim({@required Map orgData,@required Map requestData}){
    buffer={};
    buffer["id"]=generateNewID();
    //buffer["userID"]=currentUser.id;
    buffer["orgData"]=orgData;
    buffer["requestData"]=requestData;

  }
  submitClaim(){
    
  }

  
}