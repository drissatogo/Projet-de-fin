// import 'package:myapp/drawer.dart';
// import 'package:essaidrawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/tiroir/drawer.dart';


class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key, required this.title});
 final String title;
 @override
 State<HomeScreen> createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen> {
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 drawer: NavDrawer(),
 appBar: AppBar(
 title: Text(widget.title),
 ),
 body: Center(child: Text("Home")),
 );
 }
}