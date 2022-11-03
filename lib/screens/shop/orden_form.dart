import 'package:ecommerce_int2/app_properties.dart';
import 'package:flutter/material.dart';

class OrdenForm extends StatefulWidget {
  @override
  State<OrdenForm> createState() => _OrdenFormState();
}

class _OrdenFormState extends State<OrdenForm> {
  String selectedValue = "Casa";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Casa"), value: "Casa"),
      DropdownMenuItem(child: Text("Trabajo"), value: "Trabajo"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(.0),
            child: Text(
              'Selecciona la dirección',
              style: TextStyle(fontSize: 18, color: darkGrey, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: DropdownButton(
              value: selectedValue,
              dropdownColor: purple,
              items: dropdownItems,
              onChanged: (Object? value) {},
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0,),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Instrucciones'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.white,
                    elevation: 0,
                    child: SizedBox(
                        height: 30,
                        width: 80,
                        child: Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 18,
                            color: darkGrey,
                          ),
                          textAlign: TextAlign.center,
                        ))),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    color: purple,
                    elevation: 3,
                    child: SizedBox(
                        height: 30,
                        width: 100,
                        child: Text(
                          'Q45.0',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                          ),
                          textAlign: TextAlign.center,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
