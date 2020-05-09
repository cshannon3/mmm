import 'package:de_makes_final/overlays/overlays.dart';
import 'package:flutter/material.dart';
//, this.profileId


class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var state =  locator<AuthState>();
    return Container(
      height: double.infinity,
      width: double.infinity,
      color:Colors.green,
      child: Column(
        children: [
          Text("state.userModel.displayName"),
          Expanded(child: UpdateForm(),)
        ],
      ));
  }
}