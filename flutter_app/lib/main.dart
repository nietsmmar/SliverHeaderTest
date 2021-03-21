import 'package:flutter/material.dart';
import 'package:flutter_app/TopBar.dart';
import 'package:flutter_app/MyTabBar.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  ScrollController _scrollController = ScrollController();
  List<int> items = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar("Title"),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.whatshot),
                label: "First",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.hail),
                label: "Second",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "Third",
              ),
            ],
            onTap: (e) {},
            currentIndex: 0),
        body: Scaffold(
          key: _scaffoldKey,
          body: new NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    elevation: 0,
                    snap: true,
                    pinned: false,
                    floating: true,
                    forceElevated: false,
                    primary: false,
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white,
                    expandedHeight: 65.0 + 75,
                    flexibleSpace: Container(
                      child: Column(children: <Widget>[
                        MyTabBar(true, 65, () {}, () {}),
                        Container(height: 75, color: Colors.orange)
                      ]),
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          spreadRadius: .0,
                        ),
                      ], color: Colors.white),
                    ))
              ];
            },
            controller: _scrollController,
            body: Column(children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      width: MediaQuery.of(context).size.width,
                      constraints: const BoxConstraints.expand(),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return new Container(color: Colors.green[100 * (index + 1)], height: 250);
                            },
                          ))))
            ]),
          ),
        ));
  }
}
