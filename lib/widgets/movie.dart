import 'package:hive/hive.dart';

part 'movie.g.dart'; // Must match your file name: movie.dart

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String posterUrl;

  Movie({required this.title, required this.posterUrl});
}
