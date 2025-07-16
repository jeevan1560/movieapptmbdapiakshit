import 'package:akshitmovieapptmdbapi/services/hive.dart';
import 'package:akshitmovieapptmdbapi/utils/text.dart';
import 'package:akshitmovieapptmdbapi/widgets/toprated.dart';
import 'package:akshitmovieapptmdbapi/widgets/tv.dart'; // <-- Add this import

import 'package:akshitmovieapptmdbapi/widgets/trending.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:hive/hive.dart';


void main()async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      title: 'Flutter Movie App',
      home: Home(),
      theme: ThemeData(brightness: Brightness.dark,
      primaryColor: Colors.green
      ),

    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies =[];
  List topratedmovies=[];
  List tvMovies =[];

  final String apikey ='92b7f31ef833ee982f58cb2f76b9b984';
  final readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MmI3ZjMxZWY4MzNlZTk4MmY1OGNiMmY3NmI5Yjk4NCIsIm5iZiI6MTc1MjIzNjA3Mi4xNjksInN1YiI6IjY4NzEwMDI4ZWU0OThmMjEwNTZlOWVmZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eX69JiWBeudcJIBQtJvkwUyKNd72FvHX3UFAU6fK6dk';
  
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  void loadmovies() async {
  try {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, readaccesstoken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    // Optional: delay between calls to avoid rate limit
    final trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    await Future.delayed(const Duration(milliseconds: 200)); // add delay

    final topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    await Future.delayed(const Duration(milliseconds: 200));

    final tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    if (!mounted) return; // if widget disposed, avoid setState

    setState(() {
      trendingmovies = trendingResult['results'] ?? [];
      topratedmovies = topRatedResult['results'] ?? [];
      tvMovies = tvResult['results'] ?? [];
    });

    print(trendingmovies);

  } catch (e) {
    print("❌ Error loading movies: $e");
    // Optionally show UI feedback
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load movies. Try again later.")),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: modified_text(
          text: 'Flutter Movie App',
          color: Colors.white,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        size: 20,
          ),),
          body: ListView(
            children: [
            TopRated(topRated:topratedmovies),
            TrendingMovies(trending:trendingmovies),
            TvShows(tv:tvMovies),
            ],
            ),
    );
  }
}
