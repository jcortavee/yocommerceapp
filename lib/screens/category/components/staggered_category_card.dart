import 'package:flutter/material.dart';

import '../../product/product_list_page.dart';
import '../../store/store_list_page.dart';


class CategoryCard extends StatelessWidget {
  final Color begin;
  final Color end;
  final String categoryName;
  final String assetPath;

  CategoryCard({
    required this.begin,
    required this.end,
    required this.categoryName,
    required this.assetPath,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [begin, end],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
              alignment: Alignment(-1, 0),
              child: Text(
                categoryName,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
//        mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Ver',
                  style: TextStyle(color: end, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StaggeredCardCard extends StatefulWidget {
  final Color begin;
  final Color end;
  final String categoryName;
  final String assetPath;

  const StaggeredCardCard({
    required this.begin,
    required this.end,
    required this.categoryName,
    required this.assetPath,
  });

  @override
  _StaggeredCardCardState createState() => _StaggeredCardCardState();
}

class _StaggeredCardCardState extends State<StaggeredCardCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool isActive = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var timeDilation = 10.0; // 1.0 is normal animation speed.
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => StoreListPage()));
      },
      child: CategoryCard(
        categoryName: widget.categoryName,
        begin: widget.begin,
        end: widget.end,
        assetPath: widget.assetPath,
      ),
    );
  }
}
