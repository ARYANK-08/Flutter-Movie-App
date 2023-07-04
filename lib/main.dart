import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/widgets/toprated.dart';
import 'package:movie/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:movie/widgets/trending.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromARGB(255, 235, 115, 10),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'aae08ea3addc73b33fe8a5e8c2c3baa8';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYWUwOGVhM2FkZGM3M2IzM2ZlOGE1ZThjMmMzYmFhOCIsInN1YiI6IjY0YTQzM2QxZTlkYTY5MDEwMTQ3YTc1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Ptr_zCHTp54WnfQITIqr468N8OJ5OSuOZOwyK8W_M3I';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbwithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(showErrorLogs: true, showLogs: true),
    );

    Map trendingResult = await tmdbwithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbwithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbwithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingResult['results'];
      topratedmovies = topRatedResult['results'];
      tv = tvresult['results'];
    });
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Flutter Movie App🎬',
          style: GoogleFonts.nunito(
            textStyle: TextStyle(
              color: Color.fromARGB(255, 252, 250, 250),
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TopRated(toprated: topratedmovies,),
          TrendingMovies(trending: trendingmovies),
        ],
      ),
    );
  }
}
