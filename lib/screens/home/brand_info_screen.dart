import 'package:flutter/material.dart';
import '../../eco_allure_app_theme.dart';
import 'package:eco_allure/models/category.dart';

import 'brand_info_screen.dart';

List<Category> aList = <Category>[];
var indexList = 0;

class BrandInfoScreen extends StatefulWidget {
  // BrandInfoScreen({
  //   required this.category,
  // });
  // Category category;
  @override
  _BrandInfoScreenState createState() => _BrandInfoScreenState();
}

// Category getCat(){return category!;}

// updateList(Category cat){
//   if(aList.isNotEmpty){
//     aList.removeLast();
//   }
//   aList.add(cat);
// }

List<Category> getList(){
  return aList;
}

class _BrandInfoScreenState extends State<BrandInfoScreen>
    with TickerProviderStateMixin {
  Category? category = getList()[indexList];
  final double infoHeight = 364.0;
  AnimationController? animationController;
  Animation<double>? animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController?.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tempHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).size.width / 1.2) +
        24.0;
    return Container(
      //category: aList[0],
      color: EcoAllureAppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.asset(category!.imagePath),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 1.2) - 24.0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: EcoAllureAppTheme.nearlyWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: EcoAllureAppTheme.grey.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                          minHeight: infoHeight,
                          maxHeight: tempHeight > infoHeight
                              ? tempHeight
                              : infoHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //       top: 32.0, left: 18, right: 16),
                          //   child: Text(
                          //     'Neutrogena',
                          //     textAlign: TextAlign.left,
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 22,
                          //       letterSpacing: 0.27,
                          //       color: EcoAllureAppTheme.darkerText,
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  category!.title,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    letterSpacing: 0.27,
                                    color: EcoAllureAppTheme.darkerText,
                                  ),
                                ),
                                // Text(
                                //   '\$28.99',
                                //   textAlign: TextAlign.left,
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.w200,
                                //     fontSize: 22,
                                //     letterSpacing: 0.27,
                                //     color: EcoAllureAppTheme.nearlyGreen,
                                //   ),
                                // ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        category!.rating,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w200,
                                          fontSize: 22,
                                          letterSpacing: 0.27,
                                          color: EcoAllureAppTheme.nearlyGreen,
                                        ),
                                      ),
                                      Icon(
                                        Icons.emoji_nature,
                                        color: EcoAllureAppTheme.nearlyGreen,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: opacity1,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: <Widget>[
                                  getTimeBoxUI(category!.ingredients, 'Ingredients'),
                                  getTimeBoxUI(category!.sustainability, 'Sustainability'),
                                  getTimeBoxUI(category!.animalRights, 'Animal Rights'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: opacity2,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 8, bottom: 8),
                                child: Text(
                                  // need to figure out how to make this textbox endless scrolling
                                  "Ingredient info:\n\nSustainability info:\n\nAnimal Rights info:",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    letterSpacing: 0.27,
                                    color: EcoAllureAppTheme.grey,
                                  ),
                                  maxLines: 20,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: SizedBox(
                width: AppBar().preferredSize.height,
                height: AppBar().preferredSize.height,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius:
                    BorderRadius.circular(AppBar().preferredSize.height),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: EcoAllureAppTheme.nearlyBlack,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTimeBoxUI(String? text1, String? txt2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: EcoAllureAppTheme.nearlyWhite,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: EcoAllureAppTheme.grey.withOpacity(0.2),
                offset: const Offset(1.1, 1.1),
                blurRadius: 8.0),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 14.0, right: 14.0, top: 11.0, bottom: 11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                text1!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.27,
                  color: EcoAllureAppTheme.nearlyGreen,
                ),
              ),
              Text(
                txt2!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 8,
                  letterSpacing: 0.27,
                  color: EcoAllureAppTheme.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}