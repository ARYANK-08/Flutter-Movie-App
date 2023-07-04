import 'package:flutter/material.dart';
import 'package:movie/description.dart';

class TrendingMovies extends StatelessWidget {
  final List<dynamic> trending;

  const TrendingMovies({required this.trending, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModifiedText(
            text: "Trending Movies",
            color: Colors.white,
            size: 26,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          key: UniqueKey(),
                          name: trending[index]['title'] ?? '',
                          description: trending[index]['overview'], // Provide the description here
                          bannerurl: 'https://image.tmdb.org/t/p/w500' + trending[index]['backdrop_path'],
                          posterurl:  'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'], // Provide the poster URL here
                          vote: trending[index]['vote_average'].toString(), // Provide the average rating here
                          launch_on: trending[index]['release_date'], // Provide the launch date here
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' + trending[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: ModifiedText(
                            text: trending[index]['title'] != null ? trending[index]['title'] : 'Loading',
                            color: Colors.white,
                            size: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
