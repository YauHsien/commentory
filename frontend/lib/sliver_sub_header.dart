import 'dart:math';
import 'package:flutter/material.dart';

class SliverSubHeader extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final Color backgroundColor;
  final Widget child;

  const SliverSubHeader({
      Key? key,
      this.minHeight = 200,
      this.maxHeight = 400,
      required this.backgroundColor,
      required this.child,
  }): assert(backgroundColor != null),
    assert(child != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverBarDelegate(
        minHeight: minHeight,
        maxHeight: maxHeight,
        child: Container(
          color: backgroundColor,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}

class _SliverBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverBarDelegate({
      required this.minHeight,
      required this.maxHeight,
      required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent)
  => SizedBox.expand(child: child);

  @override
  bool shouldRebuild(_SliverBarDelegate oldDelegate)
  => (maxHeight != oldDelegate.maxHeight
      || minHeight != oldDelegate.minHeight
      || child != oldDelegate.child);
}
