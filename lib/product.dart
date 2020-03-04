import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/material.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/detail.dart';
import 'package:dutatani_commerce_flutter/admin.dart';

class Product {}

class ProductItemListWithMenu extends StatelessWidget {
  ProductItemListWithMenu(
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
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 4),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
//                Stack(
//                  children: <Widget>[
//
//                    Container(
//                      margin: EdgeInsets.only(top: 60, left: 10),
//                      padding: EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
//                      decoration: BoxDecoration(
//                        color: Colors.black26,
//                        borderRadius: BorderRadius.circular(50),
//                      ),
//                      child: Text(
//                        'STOK: 100',
//                        style: TextStyle(
//                          fontSize: 10,
//                          color: Colors.white,
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          name,
                          style: StyleText().title16(),
                        ),
                        Expanded(
                          child: Text(
                            harvestTime,
                            style: StyleText().subtitle2(),
                          ),
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
                      width: 30,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: InkWell(
//                        onTap: (BuildContext context, String _nama) {
//
//                        },
                        onTap: () {
                          _showEditMenuModalSheet(context);
                        },
                        child: Icon(Icons.more_vert),
                        splashColor: Colors.black12,
                      )),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}

class ProductItemCardWithMenu extends StatelessWidget {
  ProductItemCardWithMenu(
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
                  padding: EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: StyleText().title(),
                      ),
                      Expanded(
                        child: Text(
                          harvestTime,
                          style: StyleText().subtitle2(),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '$price/kg',
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
                                  child: Icon(Icons.more_horiz),
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

class ProductItemList extends StatelessWidget {
  ProductItemList(
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
          height: 100,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 4),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      height: 80,
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
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              name,
                              style: StyleText().title16(),
                            ),
                            Expanded(
                              child: Text(
                                harvestTime,
                                style: StyleText().subtitle2(),
                              ),
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
              Divider(
                thickness: 1,
                color: Colors.black26,
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(bottom: 16, top: 4),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    splashColor: Colors.black12,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      _showDetailProductModalSheet(context);
                    },
                  ),
                ))),
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
                  EdgeInsets.only(left: 12, right: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: StyleText().title(),
                      ),
                      Expanded(
                        child: Text(
                          harvestTime,
                          style: StyleText().subtitle2(),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              '$price/kg',
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
                ))),
      ],
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
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                      onPressed: (){
                        _showEditDataDialog(context, 'Nama Produk');
                      },
                      icon: Icon(Icons.spa),
                      label: Text('Edit Nama')
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                      onPressed: (){
                        _showEditDataDialog(context, 'Deskripsi');
                      },
                      icon: Icon(Icons.receipt),
                      label: Text('Edit Deskripsi')
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.attach_money),
                      label: Text('Edit Harga')
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.store),
                      label: Text('Edit Stok')
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 40,
                  child: FlatButton.icon(
                      onPressed: (){},
                      icon: Icon(Icons.access_time),
                      label: Text('Edit Waktu Panen')
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