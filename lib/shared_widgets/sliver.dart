import 'dart:math' as math;

import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

  SliverPersistentHeader makeHeader(Widget child,
      {double width, bool pinned = false, double maxH, double minH}) {
    return SliverPersistentHeader(
        pinned: pinned,
        delegate: SliverAppBarDelegate(
            minHeight: minH, maxHeight: maxH, child: child));
  }

  SliverPersistentHeader makeSliverHeader(Widget child, {double width, bool pinned=false, double maxH, double minH}) {
     return SliverPersistentHeader(
      pinned: pinned,
      delegate: SliverAppBarDelegate(
        minHeight: minH,
        maxHeight: maxH,
        child:child
      ));
  }

    Widget mainMyTabs({String selected, double width, Map<String, Function()> items}){
      List<Widget> tabWidgets = [];
      items.forEach((key, value) {
        tabWidgets.add(makeTabButton(text:key,active:key==selected, onPressed:value));
      });
     return Row( // include on pressed
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tabWidgets
            
            ) ;
    }
  Widget makeTabButton({String text,bool active, Function() onPressed})=>Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40.0,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: active?Colors.grey[200]:Colors.grey[100],
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0),bottomRight: Radius.circular(15.0) ),
                        border: Border.all(
                            color: active?Colors.black:Colors.white,
                            width:active?2.0 : 0.0)),
                    child: InkWell(
                        onTap: onPressed,
                        child: Center(child: Text(text, style: TextStyle(color:active?Colors.black:Colors.grey),))),
                  ),
                ),
              );