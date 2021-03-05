import 'dart:ui';

import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final String code;
  final String pPrice;
  final String pPromotionPrice;

  ProductDetailScreen(
      {this.id,
      this.name,
      this.img,
      this.code,
      this.pPrice,
      this.pPromotionPrice});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          print("clicked");
                          Navigator.pop(context);
                        },
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.arrow_back_ios)),
                      ),
                      Hero(
                        tag: widget.id,
                        child: Container(
                            width: 350,
                            height: 350,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(widget.img)))),
                      ),
                      Row(
                        children: [
                          Text("Name:",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800)),
                          SizedBox(width: 10),
                          Text(widget.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w800))
                        ],
                      )
                    ],
                  )))),
    );
  }
}
