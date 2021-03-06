import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/admin.dart';

class Product {

}

class ProductItemList extends StatelessWidget {
  ProductItemList(
      {Key key,
        this.name,
        this.stockStatus,
        this.harvestTime,
        this.stock,
        this.price,})
      : super(key: key);

  //gambar di encode ke base64, lalu di insert ke db. fetch gambar decode base64 dari db ke dalam bentuk image

  final String name;
  final bool stockStatus;
  final String harvestTime;
  final String stock;
  final double price;

  void _showDetailProductModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return DetailProductModalSheet(name: name, desc: 'Deskripsi Produk', stock: stock, location: 'GONDOKUSUMAN, YOGYAKARTA, DIY', price: price,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 88,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 56,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
//                    Stack(
//                      children: <Widget>[
//
//                        Container(
//                          margin: EdgeInsets.only(top: 60, left: 10),
//                          padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
//                          decoration: BoxDecoration(
//                            color: Colors.black26,
//                            borderRadius: BorderRadius.circular(50),
//                          ),
//                          child: Text(
//                            'STOK: 100',
//                            style: TextStyle(
//                              fontSize: 10,
//                              color: Colors.white,
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Theme.of(context).dividerColor)
                    ),
                  ),
                  padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        name,
                        style: StyleText().title16(),
                      ),
                      Expanded(
                          child: Row(
                            children: CustomWidget().locationWidget(harvestTime, Colors.black54),
                          )
                      ),
                      Text(
                        'Rp $price/kg',
                        style: StyleText().title16Color(AppColor().primary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: Material(
                color: Colors.transparent,
                child: Container(
                  child: InkWell(
                    splashColor: Colors.black12,
                    highlightColor: Colors.transparent,
                    onTap: (){
                      _showDetailProductModalSheet(context);
                    },
                  ),
                )
            )
        ),
      ],
    );
  }
}

class ProductItemCard extends StatelessWidget {
  ProductItemCard(
      {Key key,
        this.name,
        this.stockStatus,
        this.harvestTime,
        this.stock,
        this.price,})
      : super(key: key);

  final String name;
  final bool stockStatus;
  final String harvestTime;
  final String stock;
  final double price;
//  final Image image;

  void _showDetailProductModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return DetailProductModalSheet(name: name, desc: 'Deskripsi Produk', stock: stock, location: 'GONDOKUSUMAN, YOGYAKARTA, DIY', price: price,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16, left: 16),
                    padding:
                    EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'STOK: $stock kg',
                      style: StyleText().overlayText(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding:
                  EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: StyleText().title(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                      ),
                      Expanded(
                        child: Text(
                          harvestTime,
                          style: StyleText().subtitle3(),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Rp $price/kg',
                              style: StyleText().title16Color(AppColor().primaryDark),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.all(4),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                splashColor: Colors.black12,
                highlightColor: Colors.transparent,
                onTap: () {
                  _showDetailProductModalSheet(context);
                },
              ),
            )
          )
        ),
      ],
    );
  }
}

class DetailProductModalSheet extends StatelessWidget {
  DetailProductModalSheet({Key key, this.name, this.desc, this.stock, this.location, this.price}) : super(key: key);

  final String name;
  final String desc;
  final String stock;
  final String location;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8))
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CustomWidget().modalSheetIndicator(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
            AspectRatio(
              aspectRatio: 2,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.black54
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                  name,
                  textAlign: TextAlign.left,
                  style: StyleText().superTitle()
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                  desc,
                  textAlign: TextAlign.left,
                  style: StyleText().subtitle2()
              ),
            ),
            Row(
                children: CustomWidget().locationWidget(location, Colors.black)
            ),
            Expanded(
                child: Container(
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                          'Stok Tersedia: $stock',
                          style: StyleText().subtitle2Color(Colors.black)
                      ),
                      Text(
                          'Rp $price/kg',
                          style: StyleText().superTitleColor(AppColor().primary)
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                Container(
                  child: RaisedButton.icon(
                    onPressed: (){},
                    color: Colors.green[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    splashColor: Colors.green[200],
                    elevation: 0,
                    icon: Icon(Icons.call, color: Colors.green[900],),
                    label: Text(
                        'HUBUNGI',
                        style: StyleText().buttonLabel(Colors.green[900])
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

