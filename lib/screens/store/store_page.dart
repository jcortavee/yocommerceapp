import 'package:ecommerce_int2/app_properties.dart';
import 'package:ecommerce_int2/models/product.dart';
import 'package:ecommerce_int2/models/store.dart';
import 'package:ecommerce_int2/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../product/components/product_display.dart';
import '../product/components/product_item_list.dart';
import 'components/store_display.dart';
import 'components/store_item_list.dart';

class StorePage extends StatefulWidget {
  final Store store;

  StorePage({required this.store});

  @override
  _StorePageState createState() => _StorePageState(store);
}

class _StorePageState extends State<StorePage> {
  final Store store;

  List<Product> products = [
    Product('assets/capuchino.jpg',
        'Capuchino Standar', 'description', 15),
    Product('assets/chocolate.jpg',
        'Chocolate con leche', 'description', 12),
    Product('assets/mocachino.jpg',
        'Mocachino', 'El Café Mocaccino o café moca es una variante del café con leche. Como este, suele llevar un tercio de expreso y dos tercios de leche vaporizada, pero se añade una parte de chocolate, normalmente en forma de jarabe de chocolate, algunas máquinas usan chocolate en polvo instantáneo.', 18)
  ];

  _StorePageState(this.store);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: purple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        actions: <Widget>[
          IconButton(
            icon: new SvgPicture.asset(
              'assets/icons/search_icon.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
          )
        ],
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
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      StoreDisplay(
                        store: store,
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                        child: Text(
                          store.name,
                          style: const TextStyle(
                              color: const Color(0xFF3C4048),
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0),
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 90,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(108, 74, 182, 1),
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: Color(0xFFFFFFFF), width: 0.5),
                              ),
                              child: Center(
                                child: new Text("Info",
                                    style: const TextStyle(
                                        color: const Color(0xeefefefe),
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0, right: 40.0, bottom: 10),
                          child: new Text(store.description,
                              style: const TextStyle(
                                  color: const Color(0xfe3C4048),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "NunitoSans",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.0)))
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: Scrollbar(
                    child: ListView.builder(
                      itemBuilder: (_, index) => ProductItemList(
                        products[index],
                        onRemove: () {
                          setState(() {
                            products.remove(products[index]);
                          });
                        },
                      ),
                      itemCount: products.length,
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
