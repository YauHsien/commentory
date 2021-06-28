import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'home_page.dart';
import 'page_journey.dart';
import 'page_map.dart';
import 'page_my.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _showNotch = true;
  bool _showFab = true;
  final FloatingActionButtonLocation _fabLocation = FloatingActionButtonLocation.centerDocked;
  int? _buttons_state = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  static final List<Widget> pages = <Widget>[
    const HomePage(),
    const PageJourney(),
    const PageMap(),
    const PageMy(),
  ];

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  Widget get _current_page => pages[_buttons_state!];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _current_page,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar: TheAppBar(
        children: _TheAppBarButtons,
        fabLocation: _fabLocation,
        shape: _showNotch ? const CircularNotchedRectangle() : null,
      ),
    );
  }

  List<Widget> get _TheAppBarButtons
  => <Widget>[
    const Spacer(),
    TheAppBarButton(
      label: '首頁',
      icon: _buttons_state == 0 ? const Icon(Icons.menu, color:Colors.deepOrange) : const Icon(Icons.menu),
      onTap: (){ setState((){ _buttons_state = 0; }); },
      tooltip: '首頁',
    ),
    const Spacer(),
    TheAppBarButton(
      label: '食記',
      icon: _buttons_state == 1 ? const Icon(Icons.auto_stories_rounded, color:Colors.deepOrange) :  const Icon(Icons.auto_stories_rounded),
      onTap: () { setState((){ _buttons_state = 1; }); },
      tooltip: '網紅推薦內容',
    ),
    const Spacer(),
    TheAppBarButton(
      label: '美食地圖',
      icon: _buttons_state == 2 ? const Icon(Icons.map_rounded, color:Colors.deepOrange) :  const Icon(Icons.map_rounded),
      onTap: () { setState((){ _buttons_state = 2; }); },
      tooltip: '美食地圖',
    ),
    const Spacer(),
    TheAppBarButton(
      label: '我的',
      icon: _buttons_state == 3 ? const Icon(Icons.account_circle, color:Colors.deepOrange) :  const Icon(Icons.account_circle),
      onTap: () { setState((){ _buttons_state = 3; }); },
      tooltip: '我的',
    ),
    const Spacer(),
  ];
}
