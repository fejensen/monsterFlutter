import 'package:NAC_FLUTTER/ui/services/monster_service.dart';
import 'package:NAC_FLUTTER/ui/store/monster_screen_store.dart';
import 'package:flutter/material.dart';
import 'package:NAC_FLUTTER/model/monster.dart';
import 'package:NAC_FLUTTER/ui/common/monster_summary.dart';
import 'package:NAC_FLUTTER/ui/common/separator.dart';
import 'package:NAC_FLUTTER/ui/text_style.dart';

import '../../main.dart';

class DetailPage extends StatelessWidget {
  final Monster monster;

  DetailPage(this.monster);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: new Color(0xFF563828),
        child: new Stack(
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(context),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.network(
        monster.background_img,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[new Color(0x00563828), new Color(0xFF563828)],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent(BuildContext context) {
    final _overviewTitle = "overview".toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new MonsterSummary(
            monster,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  _overviewTitle,
                  style: Style.headerTextStyle,
                ),
                new Separator(),
                new Text('Description', style: Style.titleTextStyle),
                new Text('"' + monster.description + '"',
                    style: Style.commonTextStyle),
                new Separator(),
                new Text('Location', style: Style.titleTextStyle),
                new Text(
                  monster.location,
                  style: Style.commonTextStyle,
                ),
                new Separator(),
                new Text('Quests', style: Style.titleTextStyle),
                new Text(monster.quest, style: Style.commonTextStyle),
                new Separator(),
                new Text('Weaknesses Overview', style: Style.titleTextStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 30, right: 30),
            child: Image.network(
              monster.weakness_img,
              fit: BoxFit.cover,
              height: 270.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                new FloatingActionButton(
                  backgroundColor: Color(0xFF302119),
                  child: Icon(Icons.delete),
                  onPressed: () async {
                    print('floating');
                    MonsterService().delete(monster);
                    MonsterScreenStore().findAllMonsters();
                    RestartWidget.restartApp(context);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: new BackButton(color: Colors.white),
    );
  }
}
