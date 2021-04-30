import 'package:flutter/material.dart';
import 'package:NAC_FLUTTER/model/monster.dart';
import 'package:NAC_FLUTTER/ui/common/separator.dart';
import 'package:NAC_FLUTTER/ui/detail/detail_page.dart';
import 'package:NAC_FLUTTER/ui/text_style.dart';

class MonsterSummary extends StatelessWidget {
  final Monster monster;
  final bool horizontal;

  MonsterSummary(this.monster, {this.horizontal = true});

  MonsterSummary.vertical(this.monster) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final monsterThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: new Hero(
        tag: "monster-hero-${monster.id.toString()}",
        child: new Image(
          image: new AssetImage(monster.img_asset),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _monsterValueElement({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image.asset(image, height: 20.0),
          new Container(width: 8.0),
          new Text(monster.element,
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Poppins', color: Colors.white)),
        ]),
      );
    }

    Widget _monsterValueAilment({String value, String image}) {
      return new Container(
        child: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image.asset(image, height: 20.0),
          new Container(width: 8.0),
          new Text(monster.ailment,
              style: TextStyle(
                  fontSize: 12, fontFamily: 'Poppins', color: Colors.white)),
        ]),
      );
    }

    final monsterCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 3.0),
          new Text(monster.name, style: Style.titleTextStyle),
          new Container(height: 1.0),
          new Text(monster.weakness, style: TextStyle(
                  fontSize: 11, fontFamily: 'Poppins', color: Colors.white)),
          new SeparatorXL(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _monsterValueElement(
                      value: monster.element, image: 'assets/img/element.png')),
              new Container(
                width: 20.0,
              ),
              new Expanded(
                  flex: horizontal ? 3 : 0,
                  child: _monsterValueAilment(
                      value: monster.ailment , image: 'assets/img/ailment.png'))
            ],
          ),
        ],
      ),
    );

    final monsterCard = new Container(
      child: monsterCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF71513A),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black54,
            blurRadius: 2.0,
            offset: new Offset(0.0, 5.0),
          ),
        ],
      ),
    );

    return new GestureDetector(
        onTap: horizontal
            ? () => Navigator.of(context).push(
                  new PageRouteBuilder(
                    pageBuilder: (_, __, ___) => new DetailPage(monster),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                            child) =>
                        new FadeTransition(opacity: animation, child: child),
                  ),
                )
            : null,
        child: new Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: new Stack(
            children: <Widget>[
              monsterCard,
              monsterThumbnail,
            ],
          ),
        ));
  }
}
