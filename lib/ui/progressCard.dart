import 'package:flutter/material.dart';
import 'package:isle_x_flutter/circle_progress_bar.dart';
import 'dart:core';

int levelMaximumXP = 200;
int totalExperience = 0;

class ProgressCard extends StatefulWidget {
  final int experience; //TODO: bring async user stats and replace
  final int level;

  ProgressCard({Key key, this.experience, this.level})
      : super(
            key:
                key); //I create a key so that i can access my stateful widget's state anytime anywhere
  @override
  ProgressCardState createState() =>
      new ProgressCardState(); //i keep everything public (not with _hidden) so that i can access them and edit them
}

class ProgressCardState extends State<ProgressCard> {
//  int userTotalExperience = 0;

  //currently only persona specific Statistics:
  double personaPercent = 0;
  int personaLevel = 1;
  int personaExperience = 0;

  @override
  void initState() {
    personaExperience = widget.experience;
    personaLevel = widget.level;
    totalExperience = personaExperience;

    levelMaximumXP = calculateMaximumXP(personaExperience, personaLevel);
    personaPercent = calculatePercent(personaExperience);
    print(
        'Level: $personaLevel, XP: $personaExperience/$levelMaximumXP, ${personaPercent * 100.round()}% progressed');
    super.initState();
  }

  addExperiencePoints(int experiencePoints) {
    totalExperience += experiencePoints;
    var updatedExperience = personaExperience + experiencePoints;
    var updatedLevel = personaLevel;

    if (updatedExperience >= levelMaximumXP) {
      //TODO: do stuff and effects and hoorey for level up!
      print('Level Up!');

      int remainingExperience = updatedExperience - levelMaximumXP;
      personaExperience = remainingExperience;
      updatedLevel = personaLevel + 1;
      levelMaximumXP = calculateMaximumXP(personaExperience, updatedLevel);
    } else {
      personaExperience = updatedExperience;
      //level doesn't change
    }
    //update percent
    var updatedPercent = calculatePercent(personaExperience);

    setState(() {
      this.personaLevel = updatedLevel;
      this.personaPercent = updatedPercent;
    });
    print(
        'Level: $personaLevel, XP: $personaExperience/$levelMaximumXP, ${personaPercent * 100.round()}% progressed');
  }

  @override
  Widget build(BuildContext context) {
    Color foreground = Theme.of(context).primaryColor;

    //add dynamic color changing:
    if (personaPercent >= 0.8) {
      foreground = Theme.of(context).primaryColor;
    } else if (personaPercent >= 0.4) {
      foreground = Theme.of(context).primaryColor;
    }

    Color background = const Color(0xFFE1DAE1).withOpacity(0.3);
    return new Stack(
    overflow: Overflow.visible,
      alignment: new Alignment(0.0, 0.0),
      children: <Widget>[
        new Container(         
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: new GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: new CircleProgressBar(
//                key: circleProgressBarKey,
                backgroundColor: background,
                foregroundColor: foreground,
                value: personaPercent,
              ),
              onTap: () {},
              onDoubleTap: () {},
            ),
          ),
        ),
        new Positioned(
            bottom: -3,
            left: -3,
            child:
                Material(
              color: Theme.of(context).primaryColor,
//              type: MaterialType.circle, //its crashing it
              shape: CircleBorder(side: BorderSide(style: BorderStyle.solid,width: 2.0,color:Theme.of(context).accentColor)),elevation: 0.0,
              clipBehavior: Clip.antiAlias,
              child: new Center(
                child: new Padding(
                    padding: new EdgeInsets.fromLTRB(6.0,6.0,6.0,6.0),
                    child: new Text(
                      personaLevel.toString(),
                      style: Theme.of(context).textTheme.caption,
                    )),
              ),
            ))
      ],
    );
  }
}

int calculateMaximumXP(int personaExperience, int personaLevel) {
  int maxXP = personaLevel * 2 * 100;
  return maxXP;
}

double calculatePercent(int xpPoints) {
  double percent = ((xpPoints / levelMaximumXP).clamp(0.0, 1.0) * 100).round() /
      100; //formula used as given by progress bar developer
  return percent;
}
