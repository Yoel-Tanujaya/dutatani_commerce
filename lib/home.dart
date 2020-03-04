import 'package:dutatani_commerce_flutter/admin.dart';
import 'package:dutatani_commerce_flutter/detail.dart';
import 'package:dutatani_commerce_flutter/search.dart';
import 'package:dutatani_commerce_flutter/product.dart';
import 'package:dutatani_commerce_flutter/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/login.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Duta Tani Flutter',
        theme: ThemeData(
            primarySwatch: Colors.teal,
            canvasColor: Colors.transparent,
            fontFamily: 'Montserrat',
            colorScheme: ColorScheme.light()
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeActivity(),
          '/search': (context) => SearchActivity(),
          '/login': (context) => LoginActivity(),
          '/adminHome': (context) => HomeAdminActivity(),
          '/adminSettings': (context) => SettingsAdminActivity(adminName: 'Yoel Tanujaya', adminEmail: 'yoeltan@dutatani.id', adminPhone: '08123123123', groupName: 'Tani Rahayu Kulonprogo Yogyakarta', groupAddress: 'JL. Wahidin Sudirohusodo 5 - 25, Gondokusuman, Yogyakarta, Indonesia',),
          '/detailSearchPageList': (context) => DetailActivityList(isSearch: true, title: 'cabe rawit', location: null,),
          '/detailStorePageList': (context) => DetailActivityList(isSearch: false, title: 'Toko Tani Rahayu', location: 'GONDOKUSUMAN, YOGYAKARTA, DIY',),
          '/detailSearchPageCard': (context) => DetailActivityCard(isSearch: true, title: 'cabe rawit', location: null,),
          '/detailStorePageCard': (context) => DetailActivityCard(isSearch: false, title: 'Toko Tani Rahayu', location: 'GONDOKUSUMAN, YOGYAKARTA, DIY'),
          '/detailAdminProductPageCard': (context) => AdminProductPageCard(),
          '/detailAdminProductPageList': (context) => AdminProductPageList(),
          '/transaction': (context) => TransactionActivity()
        },
    );
  }
}

class HomeActivity extends StatelessWidget{

  void _showAdminLoginModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return AdminLoginModalSheet();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Duta Tani',
          textAlign: TextAlign.left,
          style: StyleText().appBarTitle(),
        ),
        backgroundColor: AppColor().primary25,
        actions: <Widget>[
          Tooltip(
            message: 'Login Admin',
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.teal[300],
                size: 24,
              ),
              onPressed: (){
                _showAdminLoginModalSheet(context);
              },
            ),
          ),
          Tooltip(
            message: 'Store Page List',
            child: IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.teal[300],
                size: 24,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/detailStorePageList');
              },
            ),
          ),
          Tooltip(
            message: 'Search Result Card',
            child: IconButton(
              icon: Icon(
                Icons.apps,
                color: Colors.teal[300],
                size: 24,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/detailSearchPageCard');
              },
            ),
          ),
          Tooltip(
            message: 'Admin Product Page Card',
            child: IconButton(
              icon: Icon(
                Icons.account_box,
                color: Colors.teal[300],
                size: 24,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/detailAdminProductPageCard');
              },
            ),
          ),
          Tooltip(
            message: 'Admin Product Page List',
            child: IconButton(
              icon: Icon(
                Icons.assignment,
                color: Colors.teal[300],
                size: 24,
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/detailAdminProductPageList');
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        color: AppColor().primary25,
        child: Column(
          children: <Widget>[
            Container(
                height: 180,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (BuildContext context, int i) =>
                    CategoryCard(name: 'Nama Kategori', desc: "Kategori berisi produk pada kategori yang dipilih",),
                )
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                ),
                child: Scrollbar(
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    children: <Widget>[
                      // ignore: sdk_version_ui_as_code
                      for (int id=1; id<5; id++) StoreItemList(name: 'Toko Kelompok Tani', location: 'GONDOKUSUMAN, YOGYAKARTA', category: 'Alat Tani - Bahan Tani - +2',),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Cari Produk',
        child: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, '/search');
          },
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.search),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard ({Key key, this.name, this.desc}) : super(key: key);
  final String name;
  final String desc;
//  final String urlImage //non final, untuk menampilkan gambar, bissewat url atau local storage

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor().primary,
      child: Container(
        width: 140.0,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: CircleAvatar(
                child: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                radius: 50,
                backgroundColor: Colors.black38,
                foregroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            Text(
              this.name,
              textAlign: TextAlign.center,
              style: StyleText().title()
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            Text(
              this.desc,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: StyleText().subtitle2()
            ),
          ],
        ),
      ),
    );
  }
}

class AdminLoginModalSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8))
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomWidget().modalSheetIndicator(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      splashColor: Colors.teal[100],
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginActivity())
                        );
                      },
                      color: Colors.teal[50],
                      elevation: 0,
                      child: Text(
                        'MASUK ADMIN KELOMPOK TANI',
                        style: StyleText().buttonLabel(AppColor().primaryDark)
                      )
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