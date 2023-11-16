import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'side_bar_controller.dart';

class SideBarPage extends StatefulWidget {
  const SideBarPage({super.key});

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  // Popup popup = Popup();

  @override
  Widget build(BuildContext context) {
    final sideBarController = context.watch<SideBarController>();
    sideBarController.initNavigationRail();
    return Scaffold(
        // appBar: AppBar(
        //     leading: Row(
        //   mainAxisSize: MainAxisSize.m
        body: Row(children: [
      sideBarController.navigationRail,
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                    onPressed: () {
                      sideBarController.toggleNavigation();
                    },
                    icon: const Icon(Icons.menu)),
                const Text(
                  'Bienvenu sur votre application MonGRH',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4E5394),
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/logo.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: sideBarController.page),
        ],
      ))
    ]));
  }
}
