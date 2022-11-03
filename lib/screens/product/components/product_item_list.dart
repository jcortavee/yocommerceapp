import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/screens/product/components/color_list.dart';
import 'package:ecommerce_int2/screens/product/components/shop_product.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../view_product_page.dart';

class ProductItemList extends StatefulWidget {
  final Product product;
  final VoidCallback onRemove;

  ProductItemList(this.product, {required this.onRemove});

  @override
  _ProductItemListState createState() => _ProductItemListState(product);
}

class _ProductItemListState extends State<ProductItemList> {
  int quantity = 1;
  final Product product;

  _ProductItemListState(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 130,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0.8),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ViewProductPage(product: product))),
              child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: shadow,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 12.0, right: 12.0),
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                widget.product.name,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: darkGrey,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 160,
                                  padding: const EdgeInsets.only(
                                      left: 32.0, top: 8.0, bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Q${widget.product.price}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: darkGrey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.0),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ])),
            ),
          ),
          Positioned(
              top: 5,
              child: ShopProductDisplay(
                widget.product,
                onPressed: widget.onRemove,
              )),
        ],
      ),
    );
  }
}
