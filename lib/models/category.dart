class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;

  static List<Category> categorySkincare = <Category>[
    Category(
      imagePath: 'assets/neutrogena.jpg',
      title: 'Neutrogena',
      lessonCount: 27,
      money: 25,
      rating: 4.3,
    ),Category(
      imagePath: 'assets/interFace1.png',
      title: 'TESTER1',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/interFace2.png',
      title: 'TESTER2',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/interFace3.png',
      title: 'TESTER3',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
  ];

  static List<Category> categoryMakeup = <Category>[
    Category(
      imagePath: 'assets/cerave.jpg',
      title: 'CeraVe',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/interFace1.png',
      title: 'TESTER1',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/interFace2.png',
      title: 'TESTER2',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/interFace3.png',
      title: 'TESTER3',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
  ];

  static List<Category> categoryHealth = <Category>[
    Category(
      imagePath: 'assets/curology.jpeg',
      title: 'Curology',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/aveeno.png',
      title: 'Aveeno',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/interFace2.png',
      title: 'TESTER 1',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/interFace3.png',
      title: 'TESTER2',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
  ];

  /*static List<Category> categoryList = <Category>[
    Category(
      imagePath: 'assets/neutrogena.jpg',
      title: 'Neutrogena',
      lessonCount: 27,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/cerave.jpg',
      title: 'CeraVe',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/curology.jpeg',
      title: 'Curology',
      lessonCount: 24,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/aveeno.png',
      title: 'Aveeno',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
  ];*/

  static List<Category> popularBrandList = <Category>[
    Category(
      imagePath: 'assets/neutrogena.jpg',
      title: 'Neutrogena',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/cerave.jpg',
      title: 'CeraVe',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/curology.jpeg',
      title: 'Curology',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/aveeno.png',
      title: 'Aveeno',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
  ];
}