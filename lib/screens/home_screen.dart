import 'package:flutter/material.dart';
import 'package:furniture_online_app/constant/data.dart';
import 'package:furniture_online_app/screens/product_detail_screen.dart';
import 'package:furniture_online_app/themes/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Furniture",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Icon(LineIcons.heart, size: 28),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(LineIcons.search, size: 28),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    menus.length,
                    (index) => InkWell(
                          onTap: () {
                            setState(() {
                              activeIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Container(
                                height: 40,
                                decoration: activeIndex == index
                                    ? solidButton
                                    : outlinedButton,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(menus[index],
                                      style: TextStyle(
                                          color: activeIndex == index
                                              ? white
                                              : primary,
                                          fontSize: 16)),
                                )),
                          ),
                        )),
              ),
            ),
            SizedBox(height: 20),
            Column(
                children: List.generate(
                    items.length,
                    (index) => InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ProductDetailScreen(
                                          id: items[index]['id'],
                                          name: items[index]['name'],
                                          img: items[index]['img'],
                                          code: items[index]['code'],
                                          pPrice: items[index]['p_price']
                                              .toString(),
                                          pPromotionPrice: items[index]
                                                  ['p_promotion_price']
                                              .toString(),
                                        )));
                          },
                          child: Card(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: items[index]['id'],
                                child: Container(
                                    width: 120,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage(items[index]['img']),
                                            fit: BoxFit.cover))),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(items[index]['name'],
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Text('${items[index]['p_price']} USD',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                          SizedBox(width: 10),
                                          Text(
                                              '${items[index]['p_promotion_price']} USD',
                                              style: TextStyle(
                                                  color: warning,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration
                                                      .lineThrough)),
                                        ],
                                      )
                                    ],
                                  ))
                            ],
                          )),
                        )))
          ],
        ),
      ))),
    );
  }
}
