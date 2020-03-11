import 'package:dutatani_commerce_flutter/home.dart';
import 'package:dutatani_commerce_flutter/product.dart';
import 'package:dutatani_commerce_flutter/store.dart';
import 'package:dutatani_commerce_flutter/product_admin.dart';
import 'package:flutter/material.dart';
import 'package:dutatani_commerce_flutter/decoration.dart';
import 'package:flutter/services.dart';
import 'package:dutatani_commerce_flutter/colors.dart';
import 'package:dutatani_commerce_flutter/login.dart';

/*SEARCH PRODUCT
* default search user: search Product like query & search store like query (product ready & preorder di tempatkan diatas, lalu yg kosong ditempatkan setelahnya)
* default search admin: only search Product like query (product ready & preorder & kosong digabung satu urutan)
* Filters:
*   - search kelompok tani (store) name
*   - search product available / ready*/



class SearchResultActivity extends StatefulWidget{
  SearchResultActivity({Key key, this.title}) : super(key: key);

  String view;
  String title; //nama toko tani untuk halaman toko, query pencarian untuk search

  _SearchResultActivity createState() => new _SearchResultActivity(title: title);
}

class _SearchResultActivity extends State<SearchResultActivity>
    with SingleTickerProviderStateMixin{
  _SearchResultActivity({this.title});

//  String view;
  String title; //nama toko tani untuk halaman toko, query pencarian untuk search

  final List<String> searchType = <String>[
    'Produk','Kelompok Tani',
  ];
  final List<String> productState = <String>[
    'Produk Tersedia','Produk Pre-Order',
  ];
  List<String> _filtersType = <String>['Produk','Kelompok Tani'];
  List<String> _filtersProductState = <String>['Produk Tersedia','Produk Pre-Order'];

  Iterable<Widget> get filterSearchType sync* {
    for (String filter in searchType){
      yield Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FilterChip(
          checkmarkColor: Colors.black,
          selectedColor: Colors.white,
          label: Text(filter, style: TextStyle(fontSize: 14),),
          selected: _filtersType.contains(filter),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filtersType.add(filter);
              } else {
                _filtersType.removeWhere((String name) {
                  return name == filter;
                });
              }
            });
          },
        ),
      );
    }
  }

  Iterable<Widget> get filterProductState sync* {
    for (String filter in productState){
      yield Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FilterChip(
          checkmarkColor: Colors.black,
          selectedColor: Colors.white,
          label: Text(filter, style: TextStyle(fontSize: 14),),
          selected: _filtersProductState.contains(filter),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filtersProductState.add(filter);
              } else {
                _filtersProductState.removeWhere((String name) {
                  return name == filter;
                });
              }
            });
          },
        ),
      );
    }
  }

  AnimationController _controller;

  bool get _isPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(milliseconds: 100), value: 1.0, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Animation<RelativeRect> _getPanelAnimation(BoxConstraints constraints) {
    final double height = constraints.biggest.height;
    final double top = 180;
    final double bottom = -180;
    return new RelativeRectTween(
      begin: new RelativeRect.fromLTRB(0.0, top, 0.0, bottom),
      end: new RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(new CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    final Animation<RelativeRect> animation = _getPanelAnimation(constraints);
    return new Container(
      color: AppColor().primary,
      child: new Stack(
        children: <Widget>[
          new Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Text(
                  'FILTER PENCARIAN',
                  style: StyleText().sectionTitleColor(Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: filterSearchType.toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                child: Text(
                  'KETERSEDIAAN PRODUK',
                  style: StyleText().sectionTitleColor(Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: filterProductState.toList(),
                ),
              ),
            ],
          ),
          new PositionedTransition(
            rect: animation,
            child: new Material(
              borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0)),
              elevation: 12.0,
              child: Column(
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
                          for (int id=1; id<12; id++) ProductItemCard(name: 'Jagung Manis Organik Lokal', stockStatus: true, stock: '100', harvestTime: 'GONDOKUSUMAN, YOGYAKARTA', price: 40000,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor().primary,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
                'HASIL PENCARIAN',
                textAlign: TextAlign.left,
                style: StyleText().sectionSubtitleColor(Colors.white70)
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          new FlatButton.icon(
            onPressed: () {
              _controller.fling(velocity: _isPanelVisible ? -1.0 : 1.0);
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.close_menu,
              color: Colors.white,
              size: 16,
              progress: _controller.view,
            ),
            label: Text(
              'FILTER',
              style: StyleText().buttonLabel(Colors.white),
            ),
          ),
        ],
      ),
      body: new LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}

