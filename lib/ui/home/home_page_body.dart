import 'package:flutter/material.dart';
import 'package:NAC_FLUTTER/model/monster.dart';
import 'package:NAC_FLUTTER/ui/common/monster_summary.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3B9DD1),
              Color(0xFF2D88B8),
              Color(0xFF0f77ae),
              Color(0xFFEEA66D),
              Color(0xFFB37D52),
              Color(0xFF593D29),
            ],
            stops: [0.0, 0.1, 0.12, 0.7, 0.8, 1.0],
          ),
        ),
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new MonsterSummary(monsters[index]),
                  childCount: monsters.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
