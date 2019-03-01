import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:isle_x_flutter/activity.dart';


enum CostItem { zero, little, average, much }

enum MobilityMethod { walk, bicycle, car, boat, plane, unknown }

enum MomentInDay {
  early_morning,
  morning,
  noon,
  afternoon,
  evening,
  night,
  late_night
}
enum UnitOfTime { min, h, d }

class activityCardItem extends StatelessWidget {
//  String activityID; //Not needed while making the layout though.
  String title;
  CostItem cost;
  String heroImagePath;
  MobilityMethod mobilityMethod;
  int timeInMinutes;
  int experiencePoints;
  MomentInDay momentInDay;
  UnitOfTime unitOfTime;

  activityCardItem(Activity activity) {
    this.title = activity.title;
//    this.momentInDay = activity.
    this.cost = CostItem.little;
    this.heroImagePath = activity.heroImage;
//    this.mobilityMethod = act
    this.timeInMinutes = 3;
    this.unitOfTime = UnitOfTime.min;
    this.experiencePoints = 120;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                  color: const Color(0xFFE8E8E8),
                  offset: new Offset(0.0, 0.0),
                  blurRadius: 15.0,
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0, 20, 5),
                child: Column(children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Container(
                        constraints: BoxConstraints.expand(),
//              color: Colors.pink,
                        child: Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Center(
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        )),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                        constraints: BoxConstraints.expand(),
//                color: Colors.pinkAccent,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Container(
                                    constraints: BoxConstraints.expand(),
//                            color: Colors.purpleAccent,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        RichText(
                                          text: new TextSpan(
                                            children: <TextSpan>[
                                              new TextSpan(
                                                  text: '€',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .display1),
                                              new TextSpan(
                                                  text: '€',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .display1),
                                              new TextSpan(
                                                  text: '€',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .display4),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.directions_walk,
                                                size: 20,
                                                color: Theme.of(context)
                                                    .primaryColorDark),
                                            RichText(
                                              text: new TextSpan(
                                                children: <TextSpan>[
                                                  new TextSpan(
                                                      text: timeInMinutes
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .display3),
                                                  new TextSpan(
                                                      text: describeEnum(
                                                          unitOfTime),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .display3),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        new Row(
                                          children: <Widget>[
                                            new Icon(Icons.add,
                                                size: 20,
                                                color: Theme.of(context)
                                                    .primaryColorDark),
                                            new RichText(
                                              text: new TextSpan(
                                                  children: <TextSpan>[
                                                    new TextSpan(
                                                        text: experiencePoints
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .display3),
                                                    new TextSpan(
                                                        text: 'xp',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .display3),
                                                  ]),
                                            )
                                          ],
                                        )
                                      ],
                                    )

//                                Center(
//                                  child: Text(
//                                    '2',
//                                    style: TextStyle(
//                                        fontSize: 32.0, color: Colors.black87),
//                                  ),
//                                )
                                    )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  constraints: BoxConstraints.expand(),
                                  //TODO: instead of here put the picture on a container on stack
                                )),
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                        constraints: BoxConstraints.expand(),
//                color: Colors.pinkAccent,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 2,
                                child: Container(
//                                  constraints: BoxConstraints.expand(),
//                                  color: Colors.purpleAccent,
                                    child: Padding(
                                  padding: EdgeInsets.fromLTRB(4, 0, 10, 0),
                                  child: new RaisedButton(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 12, 10, 12),
//                                        textTheme: ,
                                      child: new Text(
                                        "SEE MORE",
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                      onPressed: () {
                                        print(
                                            'See more! Time in minutes left: $timeInMinutes');
                                      },
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0))),
                                ))),
                            new Expanded(
                                flex: 1,
                                child: new Container(
//                                color: Colors.purpleAccent,
                                    constraints: new BoxConstraints.expand(),
                                    child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        new SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: new RaisedButton(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              child: Icon(Icons.refresh,
                                                  color: Theme.of(context)
                                                      .hintColor,
                                                  size: 25),
                                              onPressed: () {
                                                print('Refresh Card');
                                              },
                                              shape: new RoundedRectangleBorder(
                                                  borderRadius:
                                                      new BorderRadius.circular(
                                                          30.0))),
                                        )
                                      ],
                                    )
//
                                    )),
                          ],
                        )),
                  ),
                ])),
          ),
        ),
        Positioned(right: 0, bottom: 100, child: activityCardImage(heroImagePath))
      ],
    );
  }

  Widget activityCardImage(String heroImageName) {
    return Container(
//      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black87,blurRadius: 10)], ),
//      color: Colors.purpleAccent,
      padding: new EdgeInsets.only(bottom: 15, top: 5),
      width: 180,
      height: 180,
//      constraints: BoxConstraints.expand(),
      alignment: FractionalOffset.centerRight,
      child: new Image(
        filterQuality: FilterQuality.high,
        image: AssetImage('assets/images/activities/$heroImageName'),
      ),
    );
  }
}
