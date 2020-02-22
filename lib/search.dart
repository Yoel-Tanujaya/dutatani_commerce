import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/login.dart';

class SearchActivity extends StatefulWidget{
  @override
  _SearchActivityState createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity> {

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
            decoration: InputDecoration(
                hintText: 'Cari produk pertanian',
                contentPadding: EdgeInsets.only(left: 12),
                hintStyle: StyleText().subtitle1Color(Colors.black45),
                fillColor: AppColor().primary25,
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
            child: Center(
              child: Text(
                'CARI',
                style: StyleText().buttonLabel(AppColor().primaryDark)
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 8, left: 16, right: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'PENCARIAN POPULER',
              style: StyleText().sectionTitle()
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
            ),
            PopularChip(string: 'jagung organik'),
          ],
        ),
      ),
    );
  }
}

class PopularChip extends StatelessWidget {
  PopularChip({Key key, this.string}) : super(key: key);
  final String string;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ActionChip(
          onPressed: (){
            Navigator.pushNamed(context, '/detailSearchPageList');
          },
          label: Text(
            this.string,
            style: StyleText().subtitle1()
          ),
        )
    );
  }

}

