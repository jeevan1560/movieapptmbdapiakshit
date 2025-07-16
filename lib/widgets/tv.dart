import 'package:akshitmovieapptmdbapi/utils/text.dart';
import 'package:flutter/material.dart';

class TvShows extends StatelessWidget {
  final List tv;
  const TvShows({super.key,required this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding :EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          modified_text(text:'Tv Movies',color: const Color.fromARGB(255, 240, 91, 91),size: 20,maxLines: 1,overflow: TextOverflow.ellipsis,),
          SizedBox(height: 10),
          Container(height: 270,
          child: ListView.builder(
            itemCount: tv.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return InkWell(
                onTap: () {
                  
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
                              tv[index]['poster_path'] != null
                                  ? 'https://image.tmdb.org/t/p/w500${tv[index]['poster_path']}'
                                  : 'https://via.placeholder.com/140x210',
                            ),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      Container(child: modified_text(
                        text: tv[index]['name'] != null? tv[index]['name'] : 'Loading',
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
