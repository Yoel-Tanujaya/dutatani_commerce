import 'package:dutatani_commerce_flutter/admin.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/material.dart';

//DIUBAH KE STATEFUL WIDGET KETIKA SUDAH BISA TERIMA USERNAME PASSWORD UNTUK LOGIN, TAMBAH STATE DAN FUNGSI UNTUK AUTHENTICATION

class LoginActivity extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: AppColor().primary,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor().primary,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Masuk Sebagai Admin Kelompok Tani*',
                      style: StyleText().title(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: AppColor().primary25,
                          filled: true,
                          labelText: 'Nama Pengguna',
                          labelStyle: TextStyle(
                            color: AppColor().primaryDark,
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
                                  color: AppColor().primary
                              )
                          )
                      ),
                      style: StyleText().title(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: AppColor().primary25,
                          filled: true,
                          suffixIcon: Icon(
                            Icons.visibility,
                            color: AppColor().primaryDark,
                          ),
                          labelText: 'Kata Sandi',
                          labelStyle: TextStyle(
                            color: AppColor().primaryDark,
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
                                  color: AppColor().primary
                              )
                          )
                      ),
                      style: StyleText().title(),
                      obscureText: true,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          splashColor: AppColor().primary50,
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeAdminActivity()), ModalRoute.withName('/login'));
                          },
                          color: AppColor().primaryDark,
                          child: Text(
                            'MASUK',
                            style: StyleText().buttonLabel(Colors.white),
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}