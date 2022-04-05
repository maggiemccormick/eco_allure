import 'package:eco_allure/screens/home/brand_info_screen.dart';
import 'package:eco_allure/screens/home/home_eco_allure.dart';
import 'package:flutter/material.dart';
import 'package:eco_allure/models/product.dart';

import '../../eco_allure_app_theme.dart';
import '../../main.dart';
import '../../models/category.dart';

List<Category> thisList = <Category>[];

class CategoryView extends StatefulWidget {
  CategoryView(
      {
        //required this.product,
        //this.category,
        this.animationController,
        this.animation,
        this.callback,
        required this.category,});
      //: super(key: key);

  //final Product product;
  final VoidCallback? callback;
  final Category category;
  final AnimationController? animationController;
  final Animation<double>? animation;

  Category? getCat(){
    return category;
  }

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  //get category => this.category;

  // //Category get category => category;
  // Category? catRet = category;
  //
  // static Category? get category => category;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - widget.animation!.value), 0.0, 0.0),
            child: SizedBox(
              width: 280,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 48,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor('#F8FAFB'),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0)),
                            ),
                            child: Row(
                              children: <Widget>[
                                const SizedBox(
                                  width: 48 + 24.0,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(top: 16),
                                          child: Text(
                                            widget.category.title,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              letterSpacing: 0.27,
                                              color: EcoAllureAppTheme
                                                  .darkerText,
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          child: SizedBox(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 16, bottom: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                widget.category.cat,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w200,
                                                  fontSize: 12,
                                                  letterSpacing: 0.27,
                                                  color: EcoAllureAppTheme
                                                      .grey,
                                                ),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      widget.category.rating,
                                                      textAlign:
                                                      TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w200,
                                                        fontSize: 18,
                                                        letterSpacing: 0.27,
                                                        color:
                                                        EcoAllureAppTheme
                                                            .grey,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.emoji_nature,
                                                      color:
                                                      EcoAllureAppTheme
                                                          .nearlyGreen,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16, right: 16),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Read more',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 18,
                                                  letterSpacing: 0.27,
                                                  color: EcoAllureAppTheme
                                                      .nearlyGreen,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: EcoAllureAppTheme
                                                      .nearlyGreen,
                                                  borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(
                                                          8.0)),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      4.0),
                                                  child: SizedBox(
                                                    height: 22.0,
                                                    width: 22.0,
                                                    child: IconButton(
                                                      padding: EdgeInsets.zero,
                                                      icon: const Icon(Icons.arrow_forward_outlined),
                                                      color:
                                                      EcoAllureAppTheme
                                                          .nearlyWhite,
                                                      onPressed: () {
                                                        //updateList(widget.category!);
                                                        print("THIS IS NUM ");
                                                        print(widget.category.num);
                                                        indexList = widget.category.num;
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => BrandInfoScreen(),
                                                        ));
                                                        //EcoAllureHomeScreen.cat = catRet!;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 24, left: 16),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(16.0)),
                            child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Image.asset(widget.category.imagePath)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}