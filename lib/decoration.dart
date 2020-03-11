import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:dutatani_commerce_flutter/colors.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = AppColor().primary;
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

class StyleText {
  TextStyle appBarTitleColor(Color _color) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 28,
      color: _color
    );
  }

  TextStyle appBarTitle() {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: Colors.black
    );
  }

  TextStyle superTitle() {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );
  }

  TextStyle superTitleColor(Color _color) {
    return TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: _color
    );
  }

  TextStyle title16() {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );
  }

  TextStyle title16Color(Color _color) {
    return TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _color
    );
  }

  TextStyle title() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black
    );
  }

  TextStyle titleColor(Color _color) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: _color
    );
  }

  TextStyle subtitle1() {
    return TextStyle(
        fontSize: 14,
        color: Colors.black
    );
  }

  TextStyle subtitle1Color(Color _color) {
    return TextStyle(
        fontSize: 14,
        color: _color
    );
  }

  TextStyle subtitle2() {
    return TextStyle(
        fontSize: 12,
        color: Colors.black54
    );
  }

  TextStyle subtitle2Color(Color _color) {
    return TextStyle(
        fontSize: 12,
        color: _color
    );
  }

  TextStyle subtitle3() {
    return TextStyle(
        fontSize: 10,
        color: Colors.black54
    );
  }

  TextStyle subtitle3Color(Color _color) {
    return TextStyle(
        fontSize: 10,
        color: _color
    );
  }

  TextStyle overlayText() {
    return TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.bold
    );
  }

  TextStyle sectionTitle16() {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  TextStyle sectionTitle16Color(Color _color) {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: _color,
    );
  }

  TextStyle sectionTitle() {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  TextStyle sectionTitleColor(Color _color) {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: _color,
    );
  }

  TextStyle sectionSubtitle() {
    return TextStyle(
        fontSize: 12,
        letterSpacing: 1.5,
        color: Colors.black54
    );
  }

  TextStyle sectionSubtitleColor(Color _color) {
    return TextStyle(
        fontSize: 12,
        letterSpacing: 1.5,
        color: _color
    );
  }

  TextStyle buttonLabel(Color _color) {
    return TextStyle(
      letterSpacing: 1.5,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: _color,
    );
  }

  TextStyle normalTextBlack() {
    return TextStyle(
      fontSize: 14,
      color: Colors.black,
    );
  }

}

class CustomWidget {


  List<Widget> locationWidget(String _loc, Color _color) {
    return [
      Icon(
        Icons.near_me,
        size: 12,
        color: _color,
      ),
      Padding(
        padding: EdgeInsets.only(right: 2),
      ),
      Text(
        _loc,
        style: TextStyle(
          fontSize: 11,
          color: _color,
        ),
      ),
    ];
  }

  Widget stockIndicatorWidget(String _stock, double _marginTop, double _marginLeft){
    return Container(
      margin: EdgeInsets.only(top: _marginTop, left: _marginLeft),
      padding:
      EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        _stock,
        style: TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget modalSheetIndicator() {
    return Container(
      height: 6,
      width: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: Colors.black12
      ),
    );
  }
}