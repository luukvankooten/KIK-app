import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kik/theme.dart';
import 'history.dart';
import 'scan.dart';
import 'search.dart';

class Home extends StatefulWidget {
    const Home();
    
    @override
    _Home createState() => _Home();
}

class _Home extends State<Home> {
    //ToDo: put back to one.
    int _selectedIndex = 1;

    final List<Widget> _children = <Widget>[
        History(),
        Scan(),
        Search(),
    ];

    void _onItemTapped(int index) {
        setState(() {
            _selectedIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                "KIK",
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
        ),
        body: Container(
            margin: EdgeInsets.all(10.0),
            child: _children.elementAt(_selectedIndex)
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.history),
                  title: Text("History")
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.qrcode),
                  title: Text("Scan")
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.search),
                  title: Text("Search")
              ),
            ],
            unselectedItemColor: ThemeColor.blue.shade200,
            selectedItemColor: ThemeColor.blue.shade500,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped
        )
    );
    }
}