import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/login.dart';
import 'package:dutatani_commerce_flutter/colors.dart';

/*GRID VIEW:
* padding: symmetric hrz 8 vrt 8
* cross axis count 2
* main axis spacing 16
* cross axis spacing 4
* aspect ratio: width/height 180 / 280
*
* LIST VIEW:
* padding: symmetric hrz 16 vrt 8 */

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = HomeActivity().primary;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.1433);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.245,
        size.width * 0.5, size.height * 0.1833);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.1216,
        size.width * 1.0, size.height * 0.2233);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HomeActivity extends StatefulWidget {
  HomeActivity({Key key}) : super(key: key);

  //constant TextStyle

  //constant BoxDecoration

  //constant ColorARGB
  final Color primary = Color.fromARGB(255, 0, 208, 176);
  final Color primary75 = Color.fromARGB(192, 0, 208, 176);
  final Color primary50 = Color.fromARGB(128, 0, 208, 176);
  final Color primary25 = Color.fromARGB(64, 0, 208, 176);
  final Color primaryDark = Color.fromARGB(255, 0, 144, 112);
  final Color primaryDark75 = Color.fromARGB(192, 0, 144, 112);
  final Color primaryDark50 = Color.fromARGB(128, 0, 144, 112);
  final Color primaryDark25 = Color.fromARGB(64, 0, 144, 112);

  //constant Padding

  //constant BorderSide

  //constant Button (just change text variable)


  //constant Text (adjusted margin padding, just change text variable)



  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  static BuildContext ct;

  static List<AppBar> _mainAppBar = <AppBar>[
    AppBar(
      brightness: Brightness.light,
      title: Text(
        'Duta Tani',
        textAlign: TextAlign.left,
        style: (
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            )
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.info,
            color: Colors.black,
            size: 24,
          ),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 24,
          ),
          onPressed: (){},
        ),
      ],
//      <Widget>[
//        Container(
//            alignment: Alignment.center,
//            margin: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
//            padding: EdgeInsets.only(left: 12.0, right: 8.0),
//            decoration: BoxDecoration(
//              color: Color.fromARGB(15, 0, 0, 0),
//              borderRadius: BorderRadius.all(Radius.circular(50))
//            ),
//            child: Wrap(
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.end,
//                      children: <Widget>[
//                        Text(
//                          'Yoel Tanujaya',
//                          style: (
//                              TextStyle(
//                                fontWeight: FontWeight.bold,
//                                fontSize: 14,
//                                color: Colors.cyan,
//                              )
//                          ),
//                        ),
//                        Text(
//                          'Admin Tani Harjo',
//                          style: (
//                              TextStyle(
//                                  fontSize: 10,
//                                  color: Colors.black
//                              )
//                          ),
//                        ),
//                      ],
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(4.0),
//                    ),
//                    CircleAvatar(
//                      child: Text('Y'),
//                      radius: 16,
//                      backgroundColor: Colors.cyan,
//                      foregroundColor: Colors.white,
//                    )
//                  ],
//                ),
//              ],
//            )
//        ),
//      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    ), //appbar home screen buyer
    AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.light,
      elevation: 0,
      title: Container(
        height: 40,
        child: TextField(
//          controller: _filter,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black
          ),
          decoration: InputDecoration(
              hintText: 'Cari produk pertanian',
              contentPadding: EdgeInsets.only(left: 12),
              hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black45
              ),
              fillColor: Color.fromARGB(100, 0, 208, 176),
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  )
              )
          ),
        ),
      ),
      actions: <Widget>[
        Container(
          height: 40,
          width: 60,
          margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
          decoration: BoxDecoration(
              color: Color.fromARGB(500, 0, 144, 112),
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
        )
      ],
    ), //appbar search buyer
    AppBar(
      brightness: Brightness.light,
      title: Text(
        'Duta Tani',
        textAlign: TextAlign.left,
        style: (
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.black,
            )
        ),
      ),
//      <Widget>[
//        Container(
//            alignment: Alignment.center,
//            margin: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
//            padding: EdgeInsets.only(left: 12.0, right: 8.0),
//            decoration: BoxDecoration(
//              color: Color.fromARGB(15, 0, 0, 0),
//              borderRadius: BorderRadius.all(Radius.circular(50))
//            ),
//            child: Wrap(
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  mainAxisSize: MainAxisSize.max,
//                  children: <Widget>[
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.end,
//                      children: <Widget>[
//                        Text(
//                          'Yoel Tanujaya',
//                          style: (
//                              TextStyle(
//                                fontWeight: FontWeight.bold,
//                                fontSize: 14,
//                                color: Colors.cyan,
//                              )
//                          ),
//                        ),
//                        Text(
//                          'Admin Tani Harjo',
//                          style: (
//                              TextStyle(
//                                  fontSize: 10,
//                                  color: Colors.black
//                              )
//                          ),
//                        ),
//                      ],
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(4.0),
//                    ),
//                    CircleAvatar(
//                      child: Text('Y'),
//                      radius: 16,
//                      backgroundColor: Colors.cyan,
//                      foregroundColor: Colors.white,
//                    )
//                  ],
//                ),
//              ],
//            )
//        ),
//      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    ), //appBar initial launch (tanpa widget nama akun)
    AppBar(
      brightness: Brightness.light,
      title: Text(
        'Duta Tani',
        textAlign: TextAlign.left,
        style: (
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
              color: Colors.white,
            )
        ),
      ),
      backgroundColor: HomeActivity().primary,
      elevation: 0,
      actions: <Widget>[
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
            padding: EdgeInsets.only(left: 12.0, right: 8.0),
            decoration: BoxDecoration(
                color: Colors.white70,
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
                          'Yoel Tanujaya',
                          style: (
                              TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.black,
                              )
                          ),
                        ),
                        Text(
                          'Admin Tani Harjo',
                          style: (
                              TextStyle(
                                  fontSize: 10,
                                  color: Colors.black
                              )
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                    ),
                    CircleAvatar(
                      child: Text('Y'),
                      radius: 16,
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white,
                    )
                  ],
                ),
              ],
            )
        ),
      ],
    ), //appBar Admin final
    AppBar(
      automaticallyImplyLeading: false,
      brightness: Brightness.light,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'HASIL PENCARIAN',
            textAlign: TextAlign.left,
            style: (
                TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    letterSpacing: 1
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1),
          ),
          Text(
            '"jagung manis organik"',
            textAlign: TextAlign.left,
            style: (
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                )
            ),
          ),
        ],
      ),
      backgroundColor: AppColor().primary,
      elevation: 0,
      actions: null,
    ), //appBar hasil pencarian, digunakan di detail activity
    null,
  ];

  static List<Widget> _mainBody = <Widget>[
    ColumnSuper(
      innerDistance: -20,
      children: <Widget>[
        Container(
            height: 200,
            margin: EdgeInsets.only(top: 8.0, bottom: 32.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (BuildContext context, int i) =>
                  Card(
                    shape: null,
                    color: Color.fromARGB(255, 0, 208, 176),
                    child: Container(
                      width: 160.0,
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        ],
                      ),
                    ),
                  ),
            )
        ),
        Container(
          width: MediaQuery.of(ct).size.width,
          height: MediaQuery.of(ct).size.height - 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              color: HomeActivity().primary25
          ),
          child: Scrollbar(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 4),
              children: <Widget>[
                // ignore: sdk_version_ui_as_code
                for (int id=1; id<21; id++) ListTile(
                  leading: ExcludeSemantics(
                    child: CircleAvatar(
                      child: Text('$id'),
                    ),
                  ),
                  title: Text('Items'),
                  subtitle: Text('Sub Items'),
                )
              ],
            ),
          ),
        ),
      ],
    ), //widget homescreen buyer final tanpa data
    Container(
      margin: EdgeInsets.only(top: 8, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'PENCARIAN POPULER',
            style: TextStyle(
                letterSpacing: 2,
                fontSize: 14
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 4),
            height: 1,
            decoration: BoxDecoration(
                color: Colors.black
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Jagung organik',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(1000, 0, 144, 112),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Beras rojolele super',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(1000, 0, 144, 112),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Wortel lokal',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(1000, 0, 144, 112),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Pupuk urea super strong',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(1000, 0, 144, 112),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              'Bibit padi tipe RX400',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromARGB(1000, 0, 144, 112),
              ),
            ),
          ),
        ],
      ),
    ), //widget search buyer non final tanpa data
    ColumnSuper(
      innerDistance: -20,
      children: <Widget>[
        Container(
          height: 240,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(1000, 0, 208, 176),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(
                        'DT',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      radius: 30,
                      backgroundColor: Color.fromARGB(1000, 0, 144, 112),
                      foregroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    Text(
                      'User Duta Tani',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(ct).size.height - 276,
            width: MediaQuery.of(ct).size.width,
            padding: EdgeInsets.all(16),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'TENTANG DUTA TANI',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                ),
                Expanded(
                  child: Text(
                    ' ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(ct).size.width,
                  child: RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      splashColor: HomeActivity().primary,
                      onPressed: (){
                        Navigator.push(
                            ct,
                            MaterialPageRoute(builder: (context) => LoginActivity())
                        );
                      },
                      color: HomeActivity().primaryDark,
                      icon: Icon(
                        Icons.assignment_ind,
                        color: Colors.white,
                        size: 24,
                      ),
                      label: Text(
                        'MASUK SEBAGAI ADMIN KELOMPOK TANI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              ],
            )
        ),
      ],
    ),//widget pengaturan unregistered buyer / user
    ColumnSuper(
      innerDistance: -20,
      children: <Widget>[
        Container(
          height: 240,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(1000, 0, 208, 176),
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      child: Text(
                        'Y',
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      radius: 30,
                      backgroundColor: Color.fromARGB(1000, 0, 144, 112),
                      foregroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Yoel Tanujaya',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'yoeltan77@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(ct).size.height - 276,
            width: MediaQuery.of(ct).size.width,
            padding: EdgeInsets.all(16),
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  'PENGATURAN PROFIL',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24),
                ),
                Text(
                  'Nama',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 2),
                ),
                Expanded(
                  child: Text(
                    'Yoel Tanujaya',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(ct).size.width,
                  child: OutlineButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2
                      ),
                      splashColor: Color.fromARGB(50, 255, 0, 0),
                      highlightedBorderColor: Colors.red,
                      onPressed: (){},
                      color: Colors.white,
                      icon: Icon(
                        Icons.do_not_disturb,
                        color: Colors.red,
                        size: 24,
                      ),
                      label: Text(
                        'LOGOUT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red
                        ),
                      )
                  ),
                ),
              ],
            )
        ),
      ],
    ), //widget pengaturan non final
    ColumnSuper(
      innerDistance: -20,
      children: <Widget>[
        Container(
          height: 240,
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Color.fromARGB(1000, 0, 208, 176),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                ),
                Text(
                  'DUTA TANI',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(ct).size.height - 278,
          width: MediaQuery.of(ct).size.width,
          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 4, bottom: 24),
                child: Text(
                  'Masuk Sebagai Admin Kelompok Tani*',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(25, 0, 208, 176),
                    filled: true,
                    labelText: 'Nama Pengguna',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(1000, 0, 144, 112),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(1000, 0, 208, 176)
                        )
                    )
                ),
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Color.fromARGB(25, 0, 208, 176),
                      filled: true,
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Color.fromARGB(1000, 0, 144, 112),
                      ),
                      labelText: 'Kata Sandi',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(1000, 0, 144, 112),
                      ),
                      helperText: '*Pendaftaran akun baru silahkan menghubungi 08123456789 via Whatsapp / Telepon',
                      helperMaxLines: 2,
                      helperStyle: TextStyle(
                        color: Colors.black87,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(1000, 0, 208, 176)
                          )
                      )
                  ),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(
                height: 40,
                width: MediaQuery.of(ct).size.width,
                child: RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    splashColor: Color.fromARGB(100, 0, 208, 176),
                    onPressed: (){},
                    color: Color.fromARGB(1000, 0, 144, 112),
                    icon: Icon(
                      Icons.input,
                      color: Colors.white,
                      size: 24,
                    ),
                    label: Text(
                      'MASUK',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ],
    ), //widget login
    Container(
        width: MediaQuery.of(ct).size.width,
        height: MediaQuery.of(ct).size.height,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: 150,
                  width: MediaQuery.of(ct).size.width,
                  margin: EdgeInsets.all(16),
                  color: Colors.transparent,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    elevation: 4,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                              color: Colors.blue[800],
                            ),
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'KELOLA PRODUK',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1.2
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                  color: Colors.blue[700],
                                ),
                                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: FlatButton(
                                        splashColor: Colors.black12,
                                        onPressed: (){},
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: FittedBox(
                                                  child: Icon(Icons.view_list, color: Colors.white,),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'DAFTAR PRODUK',
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: FlatButton(
                                        splashColor: Colors.black12,
                                        onPressed: (){},
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
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
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      child: FlatButton(
                                        splashColor: Colors.black12,
                                        onPressed: (){},
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
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
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
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
                Container(
                  height: MediaQuery.of(ct).size.height - 262,
                  width: MediaQuery.of(ct).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                      color: HomeActivity().primary25
                  ),
                  child: Scrollbar(
                    child: ListView(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      children: <Widget>[
                        // ignore: sdk_version_ui_as_code
                        for (int id=1; id<21; id++) ListTile(
                          leading: ExcludeSemantics(
                            child: CircleAvatar(
                              child: Text('$id'),
                            ),
                          ),
                          title: Text('Items'),
                          subtitle: Text('Sub Items'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    ),//widget homescreen admin non final
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Duta Tani',
          textAlign: TextAlign.left,
          style: (
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Colors.white,
              )
          ),
        ),
        backgroundColor: HomeActivity().primary,
        elevation: 0,
        actions: <Widget>[
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
              padding: EdgeInsets.only(left: 12.0, right: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white70,
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
                            'Yoel Tanujaya',
                            style: (
                                TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                )
                            ),
                          ),
                          Text(
                            'Admin Tani Harjo',
                            style: (
                                TextStyle(
                                    fontSize: 10,
                                    color: Colors.black
                                )
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                      ),
                      CircleAvatar(
                        child: Text('Y'),
                        radius: 16,
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white,
                      )
                    ],
                  ),
                ],
              )
          ),
        ],
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: CustomPaint(
                  painter: CurvePainter(),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(16),
                      color: Colors.transparent,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        elevation: 4,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                  color: Colors.blue[800],
                                ),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'KELOLA PRODUK',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                      letterSpacing: 1.2
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                      color: Colors.blue[700],
                                    ),
                                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 12),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          height: 100,
                                          child: FlatButton(
                                            splashColor: Colors.black12,
                                            onPressed: (){},
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    child: FittedBox(
                                                      child: Icon(Icons.view_list, color: Colors.white,),
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'DAFTAR PRODUK',
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 100,
                                          child: FlatButton(
                                            splashColor: Colors.black12,
                                            onPressed: (){},
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
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
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 100,
                                          height: 100,
                                          child: FlatButton(
                                            splashColor: Colors.black12,
                                            onPressed: (){},
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
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
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
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
                  Container(
                    height: MediaQuery.of(context).size.height - 262,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                        color: HomeActivity().primary25
                    ),
                    child: Scrollbar(
                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        children: <Widget>[
                          // ignore: sdk_version_ui_as_code
                          for (int id=1; id<21; id++) ListTile(
                            leading: ExcludeSemantics(
                              child: CircleAvatar(
                                child: Text('$id'),
                              ),
                            ),
                            title: Text('Items'),
                            subtitle: Text('Sub Items'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
      ),
      bottomNavigationBar: null,
//      BottomNavigationBar(
//        showUnselectedLabels: false,
//        selectedLabelStyle: TextStyle(color: Color.fromARGB(1000, 0, 208, 176)),
//        selectedItemColor: Color.fromARGB(1000, 0, 208, 176),
//        unselectedItemColor: Colors.black54,
//        currentIndex: _selectedIndex,
//        onTap: _onTapSelectIndex,
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Beranda'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.search),
//            title: Text('Cari Produk'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.settings),
//            title: Text('Pengaturan'),
//          ),
//        ],
//      ),

//BottomAppBar homescreen utama buyer
//    BottomAppBar(
//    shape: CircularNotchedRectangle(),
//    color: HomeActivity().primary,
//    child: Row(
//    crossAxisAlignment: CrossAxisAlignment.center,
//    mainAxisAlignment: MainAxisAlignment.center,
//    mainAxisSize: MainAxisSize.min,
//    children: <Widget>[
//    FlatButton.icon(
//    icon: Icon(Icons.person_add, color: Colors.white,),
//    label: Text(
//    'LOGIN ADMIN',
//    style: TextStyle(
//    color: Colors.white,
//    fontWeight: FontWeight.bold,
//    fontSize: 14
//    ),
//    ),
//    ),
//    Spacer(),
//    FlatButton.icon(
//    icon: Icon(Icons.settings, color: Colors.white,),
//    label: Text(
//    'PENGATURAN',
//    style: TextStyle(
//    color: Colors.white,
//    fontWeight: FontWeight.bold,
//    fontSize: 14
//    ),
//    ),
//    ),
//    ],
//    ),
//    ),

/*
* Column(
        children: <Widget>[
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: HomeActivity().primary,
            ),
          ),
          Expanded(
            child: Container(
              child: Scrollbar(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          elevation: 4,
                          child: Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width,
                            child: RowSuper(
                              innerDistance: -60,
                              children: <Widget>[
                                SizedBox(
                                  width: 160,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HomeActivity().primary,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 100,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.transparent, Colors.white24, Colors.white60, Colors.white],
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        stops: [0,0.03,0.06,0.1]
                                    ),
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
                                  ),
                                  padding: EdgeInsets.only(left: 32, top: 12, bottom: 12, right: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Toko Tani Hura Haru',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Icon(
                                            Icons.near_me,
                                            size: 12,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 2),
                                          ),
                                          Text(
                                            'NGAGLIK, SLEMAN, DIY',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Alat Tani • Bahan Tani • +3',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
                    ),
                  ],
                )
              ),
            ),
          )
        ],
      ),*/

    );
  }
}
