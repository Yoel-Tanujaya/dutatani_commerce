import 'package:dutatani_commerce_flutter/admin.dart';
import 'package:dutatani_commerce_flutter/search.dart';
import 'package:dutatani_commerce_flutter/product_admin.dart';
import 'package:dutatani_commerce_flutter/store.dart';
import 'package:flutter/cupertino.dart';
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
          '/login': (context) => LoginActivity(),
          '/adminHome': (context) => HomeAdminActivity(),
          '/adminSettings': (context) => SettingsAdminActivity(adminName: 'Yoel Tanujaya', adminEmail: 'yoeltan@dutatani.id', adminPhone: '08123123123', groupName: 'Tani Rahayu Kulonprogo Yogyakarta', groupAddress: 'JL. Wahidin Sudirohusodo 5 - 25, Gondokusuman, Yogyakarta, Indonesia',),
          '/detailAdminProductPageList': (context) => AdminProductPageList(),
          '/transaction': (context) => TransactionActivity(),
        },
    );
  }
}

/*HOME (USER)
  Widget Content:
    - Card View of Product Category
    - List / Grid of 'Recommended' Products (research object)
    - Admin Login Actions (top right) -> Modal Login
    - Search Product (floating action button) -> Modal Search
    - Double tap on DUTA TANI title will change view (Card <-> List) application wide

  Default Search Parameters: search Product like query & search store like query (product ready & preorder di tempatkan diatas, lalu yg kosong ditempatkan setelahnya)

  Search Bar:
    - TextField -> onChanged & onSubmitted (when clicking enter on keyboard) will save query, if query empty then modal will pop / disappear
    - Button search -> Same ^^^
* */

class HomeActivity extends StatelessWidget{
  String view; //ganti ke card view atau list view via double tap DUTA TANI

  void _showAdminLoginModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return AdminLoginModalSheet();
        }
    );
  }

  void _searchModal(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return SearchActivityModal();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        title: GestureDetector(
          onDoubleTap: (){},
          child: Text(
            'Duta Tani',
            textAlign: TextAlign.left,
            style: StyleText().appBarTitle(),
          ),
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
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: <Widget>[
                    // ignore: sdk_version_ui_as_code
                    for (int id=1; id<8; id++) ProductItemListAdmin(name: 'Toko Kelompok Tani', harvestTime: "GONDOKUSUMAN, YOGYAKARTA", price: 40000, stock: '100', stockStatus: true,),
                  ],
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
            _searchModal(context);
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
//  final Image productImg

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

class SearchActivityModal extends StatefulWidget{
  SearchActivityModal({Key key, this.adminSearch, this.searchType, this.productState});

  bool adminSearch; // true: search admin, false: search user
  int searchType; // 0: default (by all), 1: by product only, 2: by kelompok tani, ADMIN TIDAK PERLU PAKAI PARAM INI
  int productState; // 0: default (ready & preorder), 1: ready only, 2: preorder only, ADMIN TIDAK PERLU PAKAI PARAM INI

  @override
  _SearchActivityModalState createState() => _SearchActivityModalState();
}

class _SearchActivityModalState extends State<SearchActivityModal> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8))
        ),
        padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: MediaQuery.of(context).viewInsets.bottom + 16),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: StyleText().subtitle1(),
                            autofocus: true,
                            textInputAction: TextInputAction.search,
                            onChanged: (String str) {
                              setState(() {
                                query = str;
                              });
                            },
                            onSubmitted: (String str){
                              setState(() {
                                query = str;
                                query.isNotEmpty ? Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultActivity(title: query,))) : Navigator.pop(context);
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Cari Produk di Duta Tani',
                              contentPadding: EdgeInsets.only(left: 12),
                              hintStyle: StyleText().subtitle1Color(Colors.black45),
                              fillColor: AppColor().primary25,
                              filled: true,
                              prefixIcon: Icon(Icons.search, color: Colors.black45),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50)),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  )
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            query.isNotEmpty ? Navigator.push(context, MaterialPageRoute(builder: (context) => SearchResultActivity(title: query,))) : Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 16),
                            child: Center(
                              child: Text(
                                  'CARI',
                                  style: StyleText().buttonLabel(AppColor().primaryDark)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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