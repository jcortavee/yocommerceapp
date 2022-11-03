import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/models/store.dart';
import 'package:ecommerce_int2/screens/address/add_address_page.dart';
import 'package:ecommerce_int2/screens/payment/unpaid_page.dart';
import 'package:flutter/material.dart';

import '../product/components/product_item_list.dart';
import '../shop/components/credit_card.dart';
import '../shop/components/shop_item_list.dart';
import 'components/store_item_list.dart';


class StoreListPage extends StatefulWidget {
  @override
  _StoreListPageState createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  SwiperController swiperController = SwiperController();

  List<Store> stores = [
    Store('assets/abarroteria.jpg',
        'Abarrotería La Esquina', 'description', 'Abarrotería'),
    Store('assets/cafeteria.jpeg',
        'Le Caffee', 'Cafetería que brinda productos de calidad', 'Cafetería'),
    Store('assets/floreria.jpg',
        'Florería San Luis', 'description', 'Florería')
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        title: Text(
          'Establecimientos',
          style: TextStyle(
              color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 800,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (_, index) => StoreItemList(
                        store: stores[index],
                        onRemove: () {
                          setState(() {
                            stores.remove(stores[index]);
                          });
                        },
                      ),
                      itemCount: stores.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Scroll extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    LinearGradient grT = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
    LinearGradient grB = LinearGradient(
        colors: [Colors.transparent, Colors.black26],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter);

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width, 30),
        Paint()
          ..shader = grT.createShader(Rect.fromLTRB(0, 0, size.width, 30)));

    canvas.drawRect(Rect.fromLTRB(0, 30, size.width, size.height - 40),
        Paint()..color = Color.fromRGBO(50, 50, 50, 0.4));

    canvas.drawRect(
        Rect.fromLTRB(0, size.height - 40, size.width, size.height),
        Paint()
          ..shader = grB.createShader(
              Rect.fromLTRB(0, size.height - 40, size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
