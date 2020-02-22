import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dutatani_commerce_flutter/main.dart';

class Store {

}

class StoreItemList extends StatelessWidget{
  StoreItemList({Key key, this.name, this.location, this.category}) : super(key: key);

  final String name;
  final String location;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 4),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Container(
                        color: Colors.black54,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 80,
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
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
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.black26,
              ),
            ],
          )
        ),
        Positioned.fill(
            child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 16),
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

  final String name;
  final String location;
  final String category;

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
                    color: HomeActivity().primary,
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