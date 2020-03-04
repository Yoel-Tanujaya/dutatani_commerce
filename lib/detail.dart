import 'package:dutatani_commerce_flutter/home.dart';
import 'package:dutatani_commerce_flutter/product.dart';
import 'package:dutatani_commerce_flutter/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/login.dart';

class DetailActivityList extends StatelessWidget{
  DetailActivityList({Key key, this.isSearch, this.title, this.location}) : super(key: key);

  bool isSearch;
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

  Widget _showAppBarSearch(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'HASIL PENCARIAN',
            textAlign: TextAlign.left,
            style: StyleText().sectionSubtitleColor(Colors.white54)
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: StyleText().superTitleColor(Colors.white),
          ),
        ],
      ),
      backgroundColor: AppColor().primary,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_list, color: Colors.white, size: 24,),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.sort_by_alpha, color: Colors.white, size: 24,),
        ),
      ],
    );
  }

  Widget _showAppBarStorePage(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primary,
      appBar: isSearch ? _showAppBarSearch(context) : _showAppBarStorePage(context),
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
                  for (int id=1; id<12; id++) ProductItemList(name: 'Cabe Rawit Lokal', stockStatus: true, stock: '100', harvestTime: 'Hasil Panen 25 Feb 2020', price: 40000,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailActivityCard extends StatelessWidget{
  DetailActivityCard({Key key, this.isSearch, this.title, this.location}) : super(key: key);

  bool isSearch;
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

  Widget _showAppBarSearch(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
              'HASIL PENCARIAN',
              textAlign: TextAlign.left,
              style: StyleText().sectionSubtitleColor(Colors.white54)
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: StyleText().superTitleColor(Colors.white),
          ),
        ],
      ),
      backgroundColor: AppColor().primary,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_list, color: Colors.white, size: 24,),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Icons.sort_by_alpha, color: Colors.white, size: 24,),
        ),
      ],
    );
  }

  Widget _showAppBarStorePage(BuildContext context) {
    return AppBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primary,
      appBar: isSearch ? _showAppBarSearch(context) : _showAppBarStorePage(context),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                color: Colors.white,
              ),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 4,
                childAspectRatio: 2/3,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                children: <Widget>[
                  // ignore: sdk_version_ui_as_code
                  for (int id=1; id<12; id++) ProductItemCard(name: 'Jagung Manis Organik Lokal', stockStatus: true, stock: '100', harvestTime: 'Panen: 25 Feb 2020', price: 40000,)
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
                  for (int id=1; id<12; id++) ProductItemListWithMenu(name: 'Cabe Rawit Lokal', stockStatus: true, stock: '100', harvestTime: 'Hasil Panen 25 Feb 2020', price: 40000,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class AdminProductPageCard extends StatefulWidget{
  @override
  _AdminProductPageCardState createState() => _AdminProductPageCardState();
}

class _AdminProductPageCardState extends State<AdminProductPageCard>{
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
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 4,
                  childAspectRatio: 2/3,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  children: <Widget>[
                    // ignore: sdk_version_ui_as_code
                    for (int id=1; id<12; id++) ProductItemCardWithMenu(name: 'Cabe Rawit Lokal Organik Super', stockStatus: true, stock: '100 kg', harvestTime: 'Panen: 25 Feb 2020', price: 40000,)
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}