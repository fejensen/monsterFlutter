import 'package:NAC_FLUTTER/ui/store/monster_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'home_page_body.dart';
import 'load_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _MonsterScreenState createState() => _MonsterScreenState();
}

class _MonsterScreenState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final MonsterScreenStore monsterScreenStore = MonsterScreenStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Monster List"),
          Observer(builder: (ctx) {
            if (monsterScreenStore.isLoading) {
              return LoadScreen();
            } else {
              return HomePageBody();
            }
          }),
        ],
      ),
    );
  }
}

class GradientAppBar extends StatelessWidget {
  final String title;
  final double barHeight = 66.0;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: new Center(
        child: new Text(
          title,
          style: const TextStyle(
              color: Color(0xFFDAB48F),
              fontFamily: 'MonsterHunter',
              fontSize: 40.0),
        ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [const Color(0xFF593D29), const Color(0xFF996947)],
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, 2.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
