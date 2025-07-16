import 'package:akshitmovieapptmdbapi/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;
  const Description({
    Key? key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_on,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: modified_text(
                      text: 'Average Rating -' + vote,
                      color: const Color.fromARGB(255, 9, 37, 59),
                      size: 20,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name != null ? name : 'Loading',
                color: const Color.fromARGB(255, 9, 37, 59),
                size: 16,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                text: 'Releasing on ' + (launch_on != null ? launch_on : 'Loading'),
                color: const Color.fromARGB(255, 9, 37, 59),
                size: 16,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${posterurl}',
                      fit: BoxFit.cover,
                      width: 100, // You can adjust this width as needed
                      height: 150,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: modified_text(
                      text: 'description' + (description != null ? description : 'Loading'),
                      color: Colors.white,
                      size: 12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
