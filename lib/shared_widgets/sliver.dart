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

   