import 'package:dutatani_commerce_flutter/admin.dart';
import 'package:dutatani_commerce_flutter/search.dart';
import 'package:dutatani_commerce_flutter/product.dart';
import 'package:dutatani_commerce_flutter/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/home.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';

/*Widget Content
*   - Item Kelompok Tani List
*   - Item Kelompok Tani Card
*   - Page Kelompok Tani (ketika pembeli memilih toko dari hasil pencarian, maka akan masuk ke halaman ini untuk menampilkan daftar produk yang dijual oleh kelompok tani yang dipilih
*   - Modal Sheet Detail Kelompok Tani (informasi detail tentang kelompok tani spt alamat, nama admin, nomor telepon, tombol call dan tombol open maps
*
* Object Kelompok Tani (Store)
*   - nama
*   - nama admin (bisa diganti ke object User jika perlu)
*   - alamat
*   - nomor telepon
*   - object lokasi (kel, kec, kab, prov yg dijadikan 1 object)
*
* Object Lokasi (Store)
*   - kelurahan_desa
*   - kecamatan
*   - kabupaten
*   - provinsi
* */

class DetailLocation {
  String kelurahan_desa;
  String kecamatan;
  String kabupaten;
  String provinsi;

  DetailLocation({this.kelurahan_desa, this.kecamatan, this.kabupaten, this.provinsi});
}

class Store {
  String name;
  String adminName;
  String address;
  DetailLocation detailLocation;
  String phone;
}

class StoreItemList extends StatelessWidget{
  StoreItemList({Key key, this.name, this.location, this.category}) : super(key: key);

  String name;
  String location;
  String category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 88,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: 100,
                  height: 56,
                  child: Container(
                    color: Colors.tealAccent[100],
                  ),
                ),
              ),
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
                        style: StyleText().title(),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: CustomWidget().locationWidget(location, Colors.black54)
                      ),
                      Text(
                        category,
                        style: StyleText().subtitle2(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
        Positioned.fill(
            child: Material(
                color: Colors.transparent,
                child: Container(
                  child: InkWell(
                    splashColor: Colors.black12,
                    highlightColor: Colors.transparent,
                    onTap: (){},
                  ),
                )
            )
        ),
      ],
    );
  }
}

class StoreItemCard extends StatelessWidget{
  StoreItemCard({Key key, this.name, this.location, this.category}) : super(key: key);

  String name;
  String location;
  String category;

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    color: AppColor().primary,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        name,
                        style: StyleText().title(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: CustomWidget().locationWidget(location, Colors.black54),
                        ),
                      ),
                      Text(
                        category,
                        style: StyleText().subtitle2(),
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
                    onTap: (){},
                  ),
                )
            )
        ),
      ],
    );
  }
}

class StorePage extends StatelessWidget{
  StorePage({Key key, this.view, this.title, this.location}) : super(key: key);

  String view;
  String title; //nama toko tani untuk halaman toko, query pencarian untuk search
  String location;

  void _showStoreInfoModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return DetailStoreModalSheet(name: 'Toko Tani Rahayu', address: 'Jl. Wahidin Sudirohusodo 5 - 25 Gondokusuman, Yogyakarta, Indonesia', phone: '08123123123', adminName: 'Yoel Tanujaya',);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.left,
              style: StyleText().superTitleColor(Colors.white),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1),
            ),
            Row(
              children: CustomWidget().locationWidget(location, Colors.white),
            )
          ],
        ),
        backgroundColor: AppColor().primary,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _showStoreInfoModalSheet(context);
            },
            icon: Icon(Icons.info, color: Colors.white, size: 24,),
          ),
        ],
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
                  for (int id=1; id<12; id++) ProductItemList(name: 'Cabe Rawit Lokal', stockStatus: true, stock: '100', harvestTime: 'GONDOKUSUMAN, YOGYAKARTA', price: 40000,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailStoreModalSheet extends StatelessWidget {
  DetailStoreModalSheet({Key key, this.name, this.address, this.adminName, this.phone}) : super(key: key);

  String name;
  String address;
  String adminName;
  String phone;
  //String locationURL; //location URL triggers maps app to open and show specific location (usually Longitude & Latitude) OPTIONAL FEATURES..

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
        child: Wrap(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomWidget().modalSheetIndicator(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    name,
                    textAlign: TextAlign.left,
                    style: StyleText().superTitle(),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black26,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.location_on, size: 18,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                        ),
                        Expanded(
                          child: Text(
                            address,
                            textAlign: TextAlign.left,
                            style: StyleText().subtitle1(),
                          ),
                        )
                      ],
                    )
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.phone_in_talk, size: 20,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                        ),
                        Expanded(
                          child: Text(
                            phone,
                            textAlign: TextAlign.left,
                            style: StyleText().subtitle1(),
                          ),
                        )
                      ],
                    )
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.perm_contact_calendar, size: 18,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                        ),
                        Expanded(
                          child: Text(
                            'Admin: $adminName',
                            textAlign: TextAlign.left,
                            style: StyleText().subtitle1(),
                          ),
                        )
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 4),
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
                            style: StyleText().buttonLabel(Colors.green[900]),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 4),
                        child: RaisedButton.icon(
                          onPressed: (){},
                          color: Colors.blue[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          splashColor: Colors.blue[200],
                          elevation: 0,
                          icon: Icon(Icons.near_me, color: Colors.blue[900],),
                          label: Text(
                            'BUKA PETA',
                            style: StyleText().buttonLabel(Colors.blue[900]),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}