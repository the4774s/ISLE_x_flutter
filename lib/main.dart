import 'package:flutter/material.dart';
import 'package:isle_x_flutter/ui/progressCard.dart';
import 'package:flutter/services.dart';
import 'package:isle_x_flutter/ui/activities/activityCardItem.dart';
import 'package:isle_x_flutter/activity.dart';

Color isleFeatherlight = const Color(0xFFFAFAFA);
Color isleYell = const Color(0xFFFFB93B);
Color isleBlossom = const Color(0xFFFF616E);
Color isleWaters = const Color(0xFF009684);
Color isleNightsky = const Color(0xFF161623);
Color textSecondaryText =
    const Color(0xFF6B6B6B); //skip now button, bottom notices, xp points etc.
Color textGray = const Color(0xFF8B8B8B);
Color isleGrayIcons = const Color(0xFFC4C4C4);
Color textGrayLight = const Color(0xFFE1DAE1);
Color isleInactiveIslands =
    const Color(0xFFE8E8E8); //yes we need them all the grays.
Color facebookButton = const Color(0xFF4D63A4);
Color googleButton = const Color(0xFFFD3B4A);

final key = new GlobalKey<
    ProgressCardState>(); //i make a key and i assign it to the object i create later.//thus, if i need to access that objects state in my main code, i can call it by key.currentState.variables

String persona = 'MITSOS';
Activity activity1 = new Activity('213', currentStatus.public, 'Swim at Vaporia under the famous St. Nicolas church', 'no description yet', Personas.Mitsos, Cost.zero, DateTime(2019, 2, 2), Duration.up_to_an_hour, Category.sea, false, [weatherConditions.cold, weatherConditions.rain,weatherConditions.warm,weatherConditions.extremely_hot], [seasons.summer, seasons.spring], '', '', '', 'peacock.png', null, null);
Activity activity2 = new Activity('414', currentStatus.public, 'Drink traditional greek coffee at Paradosiako Kafeneio', 'no description yet', Personas.Mitsos, Cost.zero, DateTime(2019, 2, 2), Duration.up_to_an_hour, Category.sea, false, [weatherConditions.cold, weatherConditions.rain,weatherConditions.warm,weatherConditions.extremely_hot], [seasons.summer, seasons.spring], '', '', '', 'coffee.png', null, null);
Activity activity3 = new Activity('2331', currentStatus.draft, 'Visit the folk music CD collection at Ellinadiko of Mitsos', 'no description yet', Personas.Mitsos, Cost.zero, DateTime(2019, 2, 2), Duration.up_to_an_hour, Category.sea, false, [weatherConditions.cold, weatherConditions.rain,weatherConditions.warm,weatherConditions.extremely_hot], [seasons.summer, seasons.spring], '', '', '', 'cd.jpg', null, null);
Activity activity4 = new Activity('2331', currentStatus.draft, 'Eat meze with tsipouro at Nissiotissa in Ermoupoli', 'no description yet', Personas.Mitsos, Cost.zero, DateTime(2019, 2, 2), Duration.up_to_an_hour, Category.sea, false, [weatherConditions.cold, weatherConditions.rain,weatherConditions.warm,weatherConditions.extremely_hot], [seasons.summer, seasons.spring], '', '', '', 'food.png', null, null);

//'Swim at Vaporia under the famous St. Nicolas church',MomentInDay.early_morning,Cost.zero,'peacock.png',MobilityMethod.walk,15,UnitOfTime.min,250
//List<> s = activityCardItem(activityA);
//List<Widget> activities = [];

void main() => runApp(MyApp(activities: <Activity>[activity1,activity2,activity3,activity4]));

class MyApp extends StatelessWidget {
  final List<Activity> activities;
  MyApp({Key key, @required this.activities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: isleFeatherlight, //or set color with: Color(0xFF0000FF)
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'ISLE',
      theme: getIsleThemeData(),
      home: MyHomePage(title: persona, activities: activities),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.activities}) : super(key: key);
  final String title;
  final List<Activity> activities;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  _MyHomePageState({Key key, this.activities}):super(key: key);
  final List<Activity> activities = [activity1,activity2,activity3,activity4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Stack(alignment: Alignment(-0.1, -0.05), children: [
              Material(
                elevation: 0.0,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                color: Colors.transparent,
                child: Ink.image(
                  image: AssetImage('assets/images/mitsos_icon.png'),
                  fit: BoxFit.cover,
                  width: 35.0,
                  height: 35.0,
                  child: InkWell(
                    onTap: () {},
                    child: null,
                  ),
                ),
              ),
              ProgressCard(
                  key: key,
                  experience: 0,
                  level:
                      1), //TODO: pass user experience points. this widget has progress bar + number (experience, level, percent) and calculates user progress/percent/level and updates them real time
            ]),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.title, style: Theme.of(context).textTheme.headline),
              Visibility(
                visible: true,
                child: Text("In the morning would",
                    style: Theme.of(context).textTheme.subtitle),
              )
            ],
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).hintColor,
                  ),
                  tooltip: 'Increase progress by 10%',
                  onPressed: () {
                    setState(() {
                      key.currentState.addExperiencePoints(123);
                    });
                  },
                ))
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
//          margin: EdgeInsets.only(top: 30.0),
          child: _buildCarousel(context, 1, activities),
        ));
  }

  String getUserLevel() {
    //TODO:fixthat
    String level = (key.currentState.personaPercent * 10).toInt().toString();
//        String level = (0.1 * 10).toInt().toString();
    return level;
  }
}

Widget _buildCarousel(BuildContext context, int carouselIndex, List<Activity> activities) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
//      Text('Carousel $carouselIndex'),
      SizedBox(
        // you may want to use an aspect ratio here for tablet support
        height: MediaQuery.of(context).size.height / 1.7,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          onPageChanged: updateDot(carouselIndex),
//          itemCount: 6,
          // store this controller in a State to save the carousel scroll position
          controller: PageController(initialPage: 0, viewportFraction: 0.8),
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => new activityCardItem(activities[index]),
          itemCount: activities.length,
          //          itemBuilder: (BuildContext context, int itemIndex) {
//            return _buildCarouselItem(context, carouselIndex, itemIndex);
//          },
        ),
      )
    ],
  );
}

updateDot(int carouselIndex) {
  //TODO:do stuff to measure impression
}

//Widget _buildCarouselItem(
//    BuildContext context, int carouselIndex, int itemIndex) {
//  return s;
//
//}

ThemeData getIsleThemeData() {
  return ThemeData(
      primaryColor: isleYell,
      accentColor: isleFeatherlight,
      primaryColorDark: isleNightsky,
      buttonColor: isleYell,
      splashColor: isleNightsky.withOpacity(0.1),
      hintColor: isleGrayIcons,
      fontFamily: 'FiraSans',
      textTheme: TextTheme(
          headline: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
              color: const Color(0xFF161623)),
          // appbar title
          subtitle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w300,
              color: const Color(0xFF161623)),
          // appbar title
          title: TextStyle(
              fontFamily: 'FiraSansCondensed',
              fontSize: 27.0,
              height: 1.10,
              fontWeight: FontWeight.w100,
              color: const Color(0xFF161623)),
          // card body title
          display1: TextStyle(
              fontFamily: 'FiraSansCondensed',
              fontSize: 30.0,
              fontWeight: FontWeight.w100,
              color: const Color(0xFF161623)),
          //€ enabled
          display4: TextStyle(
              fontFamily: 'FiraSansCondensed',
              fontSize: 30.0,
              fontWeight: FontWeight.w100,
              color: const Color(0xFFC4C4C4)),
          //€ disabled
          display2: TextStyle(
              fontFamily: 'FiraSansCondensed',
              fontSize: 30.0,
              fontWeight: FontWeight.w100,
              color: const Color(0xFFC4C4C4),
              decoration: TextDecoration.lineThrough),
          //dashed€€€
          display3: TextStyle(
              fontFamily: 'FiraSansCondensed',
              fontSize: 22.0,
              fontWeight: FontWeight.w100,
              color: const Color(0xFF161623)),
          //15mins, 200xp
          caption: TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFAFAFA)),
          button: TextStyle(
              fontFamily: 'FiraSansCondensed',
              fontSize: 16,
              color: isleFeatherlight,
              fontWeight: FontWeight.w800) //button
          ));
}
