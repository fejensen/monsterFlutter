import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(0.0, -0.0), // near the top right
            radius: 1.0,
            colors: [
              Color(0xFFEEA66D),
              Color(0xFFB37D52),
              Color(0xFF1E150E),
            ],
            stops: [0.2, 0.52, 0.96],
          ),
        ),
        child: new Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 260.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/img/rath.gif',
                ),
                Shimmer.fromColors(
                  baseColor: Color(0xFF251913),
                  highlightColor: Color(0xFFF37333),
                  child: Text(
                    'Monster Hunter',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MonHun2',
                        fontSize: 50.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Color(0xFF251913),
                  highlightColor: Color(0xFFF37333),
                  child: Text(
                    'BESTIARY',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'MonHun2',
                        fontSize: 50.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
