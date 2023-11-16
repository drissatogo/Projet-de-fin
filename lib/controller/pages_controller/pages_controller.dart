// import 'package:art_eshop/desktop/controller/artisan_controller.dart';
// import 'package:art_eshop/desktop/controller/culture_controller.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/controller/artisan_controller.dart';
import 'package:mongrh/controller/culture_controller.dart';
import 'package:provider/provider.dart';

class ArtisanPage extends StatelessWidget {
  const ArtisanPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("ici artisan");
    return context.watch<ArtisanController>().page;
  }
}

// ::::::::::::::::::::::::::::::::cultures::::::::::::::::::;
class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("ici culture");
    return context.watch<CultureController>().page;
  }
}
