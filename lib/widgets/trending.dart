import 'package:akshitmovieapptmdbapi/description.dart';
import 'package:akshitmovieapptmdbapi/utils/text.dart';
import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key,required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding :EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Trending Movies',color: const Color.fromARGB(255, 240, 91, 91),size: 20,maxLines: 1,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 10),
          Container(height: 270,
          child: ListView.builder(
            itemCount: trending.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Description(
                        name: trending[index]['overview'] ?? 'No overview available',
                        description: trending[index]['poster_path'] ?? '',
                        bannerurl: trending[index]['backdrop_path'] != null
                            ? 'https://image.tmdb.org/t/p/w500${trending[index]['backdrop_path']}'
                            : 'https://via.placeholder.com/500x281',
                        posterurl: trending[index]['poster_path'] != null
                            ? 'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}'
                            : 'https://via.placeholder.com/140x210',
                        vote: trending[index]['vote_average']?.toString() ?? 'N/A',
                        launch_on: trending[index]['release_date'] ?? 'Unknown',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Container(
                        height: 210,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                              trending[index]['poster_path'] != null
                                  ? 'https://image.tmdb.org/t/p/w500${trending[index]['poster_path']}'
                                  : 'https://via.placeholder.com/140x210',
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Container(child: modified_text(
                        text: trending[index]['title'] != null? trending[index]['title'] : 'Loading',
                        color: Colors.redAccent,
                        size: 13,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                ),
                

              );
              
            }

            ),
          )


        ])



    );
  }
}
