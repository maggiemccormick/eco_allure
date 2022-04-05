import 'package:eco_allure/models/category_data.dart';

class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.cat = '',
    this.rating = '',
    this.ingredients = '',
    this.sustainability = '',
    this.animalRights = '',
  });

  String title;
  String cat;
  String rating;
  String imagePath;
  String ingredients;
  String sustainability;
  String animalRights;

  static List<Category> categorySkincare = <Category>[
    neutrogena, ceraVe, clinique, beautyCounter];

  static List<Category> categoryMakeup = <Category>[
    bareMinerals, kosas, burtsBees, tarte];

  static List<Category> categoryHair = <Category>[
    ogx, garnier, herbalEssences, loveBeautyPlanet];

  static List<Category> popularBrandList = <Category>[
    neutrogena, ceraVe, kosas, garnier];

  static List<Category> allBrands = <Category>[
    neutrogena, ceraVe, clinique, beautyCounter,
    bareMinerals, kosas, burtsBees, tarte,
    ogx, garnier, herbalEssences, loveBeautyPlanet];

}













  // static List<Category> categorySkincare = <Category>[
  //   //neutrogena,
  //   Category(
  //       imagePath: 'assets/neutrogena.jpg',
  //       title: 'Neutrogena',
  //       cat: 'skincare',
  //       rating: 'bad',
  //       ingredients: 'bad',
  //       sustainability: 'iffy',
  //       animalRights: 'bad',
  //   ),
  //   Category(
  //     imagePath: 'assets/cerave.jpg',
  //     title: 'CeraVe',
  //     cat: 'skincare',
  //     rating: 'bad',
  //     ingredients: 'bad',
  //     sustainability: 'bad',
  //     animalRights: 'iffy',
  //   ),
  //   Category(
  //     imagePath: 'assets/clinique.png',
  //     title: 'Clinique',
  //     cat: 'skincare',
  //     rating: 'iffy',
  //     ingredients: 'iffy',
  //     sustainability: 'good',
  //     animalRights: 'bad',
  //   ),
  //   Category(
  //     imagePath: 'assets/beautyCounter.png',
  //     title: 'Beauty Counter',
  //     cat: 'skincare',
  //     rating: 'good',
  //     ingredients: 'good',
  //     sustainability: 'iffy',
  //     animalRights: 'good',
  //   ),
  // ];

  // static List<Category> categoryMakeup = <Category>[
  //   Category(
  //     imagePath: 'assets/bareMinerals.png',
  //     title: 'bareMinerals',
  //     cat: 'makeup',
  //     rating: 'iffy',
  //     ingredients: 'bad',
  //     sustainability: 'iffy',
  //     animalRights: 'iffy',
  //   ),
  //   Category(
  //     imagePath: 'assets/kosas.jpg',
  //     title: 'Kosas',
  //     cat: 'makeup',
  //     rating: 'good',
  //     ingredients: 'best',
  //     sustainability: 'iffy',
  //     animalRights: 'good',
  //   ),
  //   Category(
  //     imagePath: 'assets/burtsBees.png',
  //     title: "Burt's Bees",
  //     cat: 'makeup',
  //     rating: 'good',
  //     ingredients: 'good',
  //     sustainability: 'good',
  //     animalRights: 'good',
  //   ),
  //   Category(
  //     imagePath: 'assets/tarte.png',
  //     title: 'Tarte',
  //     cat: 'makeup',
  //     rating: 'bad',
  //     ingredients: 'bad',
  //     sustainability: 'bad',
  //     animalRights: 'good',
  //   ),
  // ];
  //
  // static List<Category> categoryHair = <Category>[
  //   Category(
  //     imagePath: 'assets/ogx.jpg',
  //     title: 'OGX',
  //     cat: 'hair',
  //     rating: 'bad',
  //     ingredients: 'bad',
  //     sustainability: 'bad',
  //     animalRights: 'bad',
  //   ),
  //   Category(
  //     imagePath: 'assets/garnier.jpg',
  //     title: 'Garnier',
  //     cat: 'hair',
  //     rating: 'iffy',
  //     ingredients: 'bad',
  //     sustainability: 'iffy',
  //     animalRights: 'good',
  //   ),
  //   Category(
  //     imagePath: 'assets/herbalEssences.jpg',
  //     title: 'Herbal Essences',
  //     cat: 'hair',
  //     rating: 'bad',
  //     ingredients: 'bad',
  //     sustainability: 'bad',
  //     animalRights: 'iffy',
  //   ),
  //   Category(
  //     imagePath: 'assets/loveBeautyPlanet.jpg',
  //     title: 'Love, Beauty, Planet',
  //     cat: 'hair',
  //     rating: 'bad',
  //     ingredients: 'bad',
  //     sustainability: 'bad',
  //     animalRights: 'bad',
  //   ),
  // ];



  // static List<Category> popularBrandList = <Category>[
  //   Category(
  //     imagePath: 'assets/neutrogena.jpg',
  //     title: 'Neutrogena',
  //     cat: 'skincare',
  //     rating: 'bad',
  //     ingredients: 'bad',
  //     sustainability: 'iffy',
  //     animalRights: 'bad',
  //   ),
  //   Category(
  //     imagePath: 'assets/cerave.jpg',
  //     title: 'CeraVe',
  //     cat: 'skincare',
  //     rating: 'bad',
  //     ingredients: 'bad',
  //     sustainability: 'bad',
  //     animalRights: 'iffy',
  //   ),
  //   Category(
  //     imagePath: 'assets/kosas.jpg',
  //     title: 'Kosas',
  //     cat: 'makeup',
  //     rating: 'good',
  //     ingredients: 'best',
  //     sustainability: 'iffy',
  //     animalRights: 'good',
  //   ),
  //   Category(
  //     imagePath: 'assets/garnier.jpg',
  //     title: 'Garnier',
  //     cat: 'hair',
  //     rating: 'iffy',
  //     ingredients: 'bad',
  //     sustainability: 'iffy',
  //     animalRights: 'good',
  //   ),
  // ];
