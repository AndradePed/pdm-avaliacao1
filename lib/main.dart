import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/discovery/paginaMenu.dart';
import 'package:flutter_application_1/src/pages/home/paginahome.dart';
import 'package:flutter_application_1/src/pages/bookmark/bookmark.dart';
import 'package:flutter_application_1/src/pages/topfood/topfood.dart';
import 'package:flutter_application_1/src/pages/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myIndex = 0;

  List<Widget> widgetList = const [
    Home(),
    Menu(),
    Bookmark(),
    Topfood(),
    Profile(),
  ];

  List<String> tituloPaginas = const [
    'Home',
    'Discovery',
    'Bookmarks',
    'Top Food',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(tituloPaginas[myIndex], style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
          fontSize: 27
          ),
          ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: widgetList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        fixedColor: Colors.amber,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Top Food',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
