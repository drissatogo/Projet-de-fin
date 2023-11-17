import 'package:flutter/material.dart';
import 'package:mongrh/tiroir/drawer.dart';
class About extends StatefulWidget {
 @override
 State<About> createState() => _AboutState();
}
class _AboutState extends State<About> {
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 drawer: NavDrawer(),
 appBar: AppBar(
 title: Text("About"),
 ),
 body: Center(child: Text("About")),
 );
 }
}