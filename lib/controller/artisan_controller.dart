
// import 'package:art_eshop/desktop/pages/detail_artisan.dart';
// import 'package:art_eshop/desktop/pages/list_artisan.dart';
// import 'package:art_eshop/desktop/pages/produit.dart';
// import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:flutter/material.dart';
import 'package:mongrh/admin.dart';

class ArtisanController extends ChangeNotifier {
  List<StatefulWidget> pages = [];
  int indicePage = 0;

  // Future<List<Artisan>> mesArtisans = ArtisanProvider().getData();

  // late Artisan currentArtisan;

  StatefulWidget get page {
    return pages[indicePage];
  }

  ArtisanController() {
    pages = [
      const ContratAdmin(),
      const DashboardFirst(),
    ];
  }

  gotoDetails() {
    indicePage = 1;
    notifyListeners();
  }

  gotoListArtisan() {
    indicePage = 0;
    notifyListeners();
  }
}
