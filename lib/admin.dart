import 'package:dutatani_commerce_flutter/home.dart';
import 'package:dutatani_commerce_flutter/product.dart';
import 'package:dutatani_commerce_flutter/store.dart';
import 'package:dutatani_commerce_flutter/product_admin.dart';
import 'package:flutter/material.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/login.dart';

/*HOME ADMIN
  Widget Content:
    - Profile widget -> Profile Activity
    - Search own product -> Search Activity Admin (search bar, will automatically load list of products onchanged(non final) or onsubmitted)
    - Reporting -> reporting activity
    - Add new product -> Fullscreen dialog
    - List / Grid view of products (research object) -> each product item has menu button to edit / delete product

* */

class HomeAdminActivity extends StatelessWidget {
  void _showAddOrderModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return AddOrderModalSheet();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: CustomSliverDelegate(
                    expandedHeight: 130,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  sliver: SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 4,
                    childAspectRatio: 2/3,
                    children: <Widget>[
                      for (int id=1; id<12; id++) ProductItemCardAdmin(name: 'Cabe Rawit Lokal', stockStatus: true, stock: '100 kg', harvestTime: 'Stok Tersedia:', price: 40000,) //untuk admin, text status dibedakan menjadi info produk, bukan lokasi
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
    BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2.2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                          color: Colors.teal[600],
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'KELOLA PRODUK & PESANAN',
                          style: StyleText().titleColor(Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                              color: Colors.teal[700],
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: FlatButton(
                                      splashColor: Colors.black12,
                                      onPressed: (){},
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 8),
                                              child: FittedBox(
                                                child: Icon(Icons.search, color: Colors.white,),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'CARI PRODUK',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: StyleText().subtitle2Color(Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: FlatButton(
                                      splashColor: Colors.black12,
                                      onPressed: (){
                                        Navigator.pushNamed(context, '/transaction');
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 8),
                                              child: FittedBox(
                                                child: Icon(Icons.book, color: Colors.white,),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'LAPORAN PEMESANAN',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: StyleText().subtitle2Color(Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: FlatButton(
                                      splashColor: Colors.black12,
                                      onPressed: (){},
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 8),
                                              child: FittedBox(
                                                child: Icon(Icons.add_circle, color: Colors.white,),
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'TAMBAH PRODUK',
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: StyleText().subtitle2Color(Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                'Duta Tani',
                textAlign: TextAlign.left,
                style: StyleText().appBarTitleColor(Colors.white),
              ),
              actions: <Widget>[
                ProfileName(username: 'Yoel Tanujaya', role: 'Admin Tani Rahayu',)
              ],
            ),
          ),
          SizedBox(
            height: kToolbarHeight,
            child: Opacity(
              opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
              child: AppBar(
                backgroundColor: AppColor().primary,
                elevation: 0.0,
                title: Text(
                  'Duta Tani',
                  textAlign: TextAlign.left,
                  style: StyleText().appBarTitleColor(Colors.white),
                ),
                actions: <Widget>[
                  Opacity(
                    opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                    child: IconButton(
                      onPressed: (){

                      },
                      icon: Icon(Icons.search, color: Colors.white,),
                    ),
                  ),
                  Opacity(
                    opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.book, color: Colors.white,),
                    ),
                  ),
                  Opacity(
                    opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.add_circle, color: Colors.white,),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, '/adminSettings');
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 24, left: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: CircleAvatar(
                        child: Text('Y'),
                        radius: 16,
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class SearchActivityAdmin extends StatefulWidget{
  @override
  _SearchActivityAdminState createState() => _SearchActivityAdminState();
}

class _SearchActivityAdminState extends State<SearchActivityAdmin> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: TextField(
//          controller: _filter,
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
      ),
    );
  }
}

//SETTING ADMIN DIUBAH KE STATEFUL WIDGET KARENA HARUS MENGATUR PERGANTIAN DATA PROFIL
class SettingsAdminActivity extends StatelessWidget{
  SettingsAdminActivity({Key key, this.adminName, this.adminEmail, this.adminPhone, this.groupName, this.groupAddress}) : super(key: key);

  String groupName;
  String adminName;
  String adminPhone;
  String adminEmail;
  String groupAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      backgroundColor: AppColor().primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
                [
                  Container(
                      height: 150,
                      padding: EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 24),
                      child: Center(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                child: Text(
                                  'T',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: AppColor().primary,
                                  ),
                                ),
                                radius: 30,
                                backgroundColor: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      groupName,
                                      style: StyleText().superTitleColor(Colors.white),
                                      maxLines: 2,
                                    ),
                                    Text(
                                      'Admin: $adminName',
                                      style: StyleText().subtitle1Color(Colors.white70),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                              ),
                              Tooltip(
                                message: 'Edit Profil',
                                child: SizedBox(
                                    height: 36,
                                    width: 36,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: Colors.black
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.edit, color: Colors.white, size: 18,),
                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height-150,
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'PROFIL ADMIN',
                          style: StyleText().sectionTitle(),
                        ),
                        Divider(
                          color: Colors.black38,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'NAMA',
                                    style: StyleText().sectionSubtitle(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                  ),
                                  Text(
                                    adminName,
                                    style: StyleText().title16(),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.border_color, color: Colors.white, size: 20,),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'ALAMAT EMAIL',
                                    style: StyleText().sectionSubtitle(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                  ),
                                  Text(
                                    adminEmail,
                                    style: StyleText().title16(),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.border_color, color: Colors.white, size: 20,),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'NOMOR TELEPON ADMIN',
                                    style: StyleText().sectionSubtitle(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                  ),
                                  Text(
                                    adminPhone,
                                    style: StyleText().title16(),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.border_color, color: Colors.white, size: 20,),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 32),
                        ),
                        Text(
                          'PROFIL KELOMPOK TANI',
                          style: StyleText().sectionTitle(),
                        ),
                        Divider(
                          color: Colors.black38,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'NAMA KELOMPOK TANI',
                                    style: StyleText().sectionSubtitle(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                  ),
                                  Text(
                                    groupName,
                                    style: StyleText().title16(),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.border_color, color: Colors.white, size: 20,),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 12),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'ALAMAT KELOMPOK TANI',
                                    style: StyleText().sectionSubtitle(),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                  ),
                                  Text(
                                    groupAddress,
                                    maxLines: 2,
                                    style: StyleText().title16(),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.border_color, color: Colors.white, size: 20,),
                            )
                          ],
                        ),
                        Expanded(
                          child: Container(

                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              splashColor: Colors.red[100],
                              onPressed: (){
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeActivity()), ModalRoute.withName('/adminHome'));
                              },
                              color: Colors.red[50],
                              elevation: 0,
                              child: Text(
                                'KELUAR AKUN',
                                style: StyleText().buttonLabel(Colors.red),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              addRepaintBoundaries: true,
            ),
          )
        ],
      )
    );
  }
}

class ProfileName extends StatelessWidget {
  ProfileName({Key key, this.username, this.role}) : super(key: key);

  final String username;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
          padding: EdgeInsets.only(left: 12.0, right: 8.0),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          child: Wrap(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        username,
                        style: StyleText().title16Color(Colors.white),
                      ),
                      Text(
                        role,
                        style: StyleText().subtitle3Color(Colors.white),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                  ),
                  CircleAvatar(
                    child: Text('Y'),
                    radius: 16,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.teal,
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                splashColor: Colors.black12,
                highlightColor: Colors.transparent,
                onTap: (){
                  Navigator.pushNamed(context, '/adminSettings');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//Dialog widget diubah ke stateful untuk menampilkan data baru yang berhasil diedit tanpa perlu fetch data baru dari database (temporary view)
//TextField berisi initial value yaitu data lama
class EditDataDialog extends StatelessWidget{
  EditDataDialog({Key key, this.title, this.oldData}) : super(key: key);

  String title;
  String oldData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Edit $title',
        style: StyleText().title16(),
      ),
      content: TextField(
        decoration: InputDecoration(
            hintText: 'Nama Produk'
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'BATAL',
            style: StyleText().sectionTitleColor(Colors.red),
          ),
        ),
        FlatButton(
          child: Text(
            'UBAH',
            style: StyleText().sectionTitleColor(Colors.black),
          ),
        ),
      ],
    );
  }
}

//Transaction berisi laporan pemesanan yang diinput oleh admin, berbentuk list dan urut berdasarkan waktu, dan dikelompokkan berdasarkan bulan
class TransactionActivity extends StatelessWidget{
  void _showAddOrderModalSheet(BuildContext context) {
    showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return AddOrderModalSheet();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        backgroundColor: AppColor().primary,
        brightness: Brightness.light,
        title: Text(
          'LAPORAN PEMESANAN',
          style: StyleText().title16Color(Colors.white),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColor().primary,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            Tooltip(
              message: 'Pilih Bulan Transaksi',
              child: FlatButton.icon(
                label: Text(
                  'PILIH BULAN', //dinamis berdasarkan bulan yang dipilih, kalo tidak di filter akan muncul 'BULAN'
                  style: StyleText().sectionSubtitleColor(Colors.black),
                ),
                icon: Icon(Icons.today, color: Colors.black,),
              ),
            ),
            Tooltip(
              message: 'Urutkan Transaksi',
              child: FlatButton.icon(
                label: Text(
                  'URUTKAN',
                  style: StyleText().sectionSubtitleColor(Colors.black),
                ),
                icon: Icon(Icons.sort, color: Colors.black,),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Tooltip(
        message: 'Tambah Pesanan Baru',
        child: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: (){
            _showAddOrderModalSheet(context);
          },
          backgroundColor: Colors.deepOrange,
        ),
      )
    );
  }
}

//pilih produk yang di order menggunakan full screen dialog berisi list produk dari toko tersebut, kemudian ketika produk telah dipilih maka textfield pada modal add order
//akan berisi nama produk yang telah dipilih
class AddOrderModalSheet extends StatelessWidget{
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
                Container(
                  child: Text('Coming Soon...'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}

class TransactionList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return null;
  }

}
