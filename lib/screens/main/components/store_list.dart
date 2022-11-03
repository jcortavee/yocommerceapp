import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/models/store.dart';
import 'package:ecommerce_int2/screens/product/components/color_list.dart';
import 'package:ecommerce_int2/screens/product/components/shop_product.dart';
import 'package:ecommerce_int2/screens/store/components/store_list_item_display.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ShopList extends StatefulWidget {
  final Store store;
  final VoidCallback onRemove;

  ShopList(this.store, {required this.onRemove});

  @override
  _ShopListState createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 130,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment(0, 0.8),
            child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    color: Color(0xffD2DAFF),
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
                              widget.store.name,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      '${widget.store.storeType}',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: mediumPurple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
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
          Positioned(
              top: 5,
              child: StoreListItemDisplay(
                widget.store,
                onPressed: widget.onRemove,
              )),
        ],
      ),
    );
  }
}
