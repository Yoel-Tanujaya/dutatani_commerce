import 'package:dutatani_commerce_flutter/admin.dart';
import 'package:dutatani_commerce_flutter/search.dart';
import 'package:dutatani_commerce_flutter/product.dart';
import 'package:dutatani_commerce_flutter/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/login.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';

class ProductItemListAdmin extends StatelessWidget {
  ProductItemListAdmin(
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

  void _showEditMenuModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return ProductEditMenuModalSheet(name: name,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _showDetailProductModalSheet(context);
      },
      child: Container(
        height: 88,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: SizedBox(
                width: 100,
                height: 56,
                child: Container(
                  color: Colors.cyan,
                ),
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
            Material(
              color: Colors.transparent,
              child: Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.only(right: 16, top: 16),
                child: InkWell(
                  onTap: () {
                    _showEditMenuModalSheet(context);
                  },
                  child: Icon(Icons.more_vert),
                  splashColor: Colors.black12,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductItemCardAdmin extends StatelessWidget {
  ProductItemCardAdmin(
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

  void _showEditMenuModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return ProductEditMenuModalSheet(name: name,);
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
                    padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      'STOK: $stock',
                      style: StyleText().overlayText(),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
                              style: StyleText().subtitle3()
                          )
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
                          Material(
                            color: Colors.transparent,
                            child: Container(
                                width: 20,
                                child: InkWell(
                                  onTap: () {
                                    _showEditMenuModalSheet(context);
                                  },
                                  child: Icon(Icons.more_vert),
                                  splashColor: Colors.black12,
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AdminProductPageList extends StatefulWidget{
  @override
  _AdminProductPageListState createState() => _AdminProductPageListState();
}

class _AdminProductPageListState extends State<AdminProductPageList>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primary,
      appBar: AppBar(
        title: Text(
          'DAFTAR PRODUK',
          textAlign: TextAlign.left,
          style: StyleText().title16Color(Colors.white),
        ),
        backgroundColor: AppColor().primary,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                color: Colors.white,
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: <Widget>[
                  for (int id=1; id<12; id++) ProductItemListAdmin(name: 'Cabe Rawit Lokal', stockStatus: true, stock: '100', harvestTime: 'GONDOKUSUMAN, YOGYAKARTA', price: 40000,)
                ],
              ),
            ),
          ),
        ],
      ),
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

class ProductEditMenuModalSheet extends StatelessWidget {
  //menerima object produk yang akan diedit, yg ditampilkan hanya judul saja,
  //tiap item info akan ditampilkan di dalam dialog box ketika proses editing
  ProductEditMenuModalSheet({Key key, this.name}) : super (key: key);

  String name;

  void _showEditDataDialog(BuildContext context, String title) {
    showDialog(
        context: context,
        builder: (context) {
          return EditDataDialog(title: title, oldData: name,);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8), topLeft: Radius.circular(8))),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CustomWidget().modalSheetIndicator(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: StyleText().title16(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Divider(
                    thickness: 1,
                    color: Colors.black26,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.add_shopping_cart),
                      label: Text('Tambah Laporan Pemesanan')
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.edit),
                      label: Text('Edit Produk')
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.delete, color: Colors.red[500],),
                    label: Text('Hapus Produk', style: TextStyle(color: Colors.red[500]),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}