import 'package:countries_app/data/db/app_database.dart';
import 'package:countries_app/ui/tabs/all/all_countries.dart';
import 'package:countries_app/ui/tabs/favorites/favorite_countries.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider<AppDatabase>(
    create: (context) => AppDatabase(),
    child: MyApp(),
    dispose: (context, db) => db.close(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Countries'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Image.asset('assets/images/world.png', width: 24, height: 24),
              ),
              Tab(
                child: Image.asset('assets/images/favourite.png', width: 24, height: 24),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: containers,
        ),
      ),
    );
  }

  final List<Widget> containers = [
    AllCountries(),
    FavoriteCountries()
  ];
}