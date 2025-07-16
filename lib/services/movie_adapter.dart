// import 'package:hive/hive.dart';
// import 'movie.dart';

// class MovieAdapter extends TypeAdapter<Movie> {
//   @override
//   final int typeId = 0;

//   @override
//   Movie read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Movie(
//       title: fields[0] as String,
//       posterUrl: fields[1] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, Movie obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.posterUrl);
//   }
// }
