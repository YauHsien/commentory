import 'package:flutter/material.dart';

class TheAppBar extends StatelessWidget {
  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;
  final List<Widget> children;

  const TheAppBar({
      required this.children,
      this.fabLocation = FloatingActionButtonLocation.endDocked,
      this.shape = const CircularNotchedRectangle(),
  }): assert(children != null);

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.orange,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: children
        ),
      ),
    );
  }
}

class TheAppBarButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final GestureTapCallback? onTap;
  final String tooltip;

  const TheAppBarButton({
      this.label = 'Button',
      required this.icon,
      required this.onTap,
      this.tooltip = '',
  }) : assert(icon != null),
    assert(onTap != null)
  ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: icon,
          onPressed: onTap,
          tooltip: tooltip,
        ),
        Text(label),
      ],
    );
  }
}
