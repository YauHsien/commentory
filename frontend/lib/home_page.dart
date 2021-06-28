import 'package:flutter/material.dart';
import 'sliver_sub_header.dart';

class HomePage extends StatelessWidget {
  final int _counter = 1024;

  const HomePage();
  
  @override
  Widget build(BuildContext context) {
    double _top = MediaQuery.of(context).padding.top;
    return CustomScrollView(
      slivers: <Widget>[
        SliverSubHeader(
          minHeight: _top + 30,
          maxHeight: _top + 40,
          backgroundColor: Colors.yellow[900]!,
          child: Text(
            'P5 區域',
            style: TextStyle(
              color: Colors.lime[700]!,
              fontSize: 23,
              fontWeight: FontWeight.bold),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 110,
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text('$_counter', style: Theme.of(context).textTheme.headline4),
            ),
            childCount: 200
          ),
        ),
      ],
    );
  }
}
