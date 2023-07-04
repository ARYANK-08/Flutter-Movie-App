import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModifiedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const ModifiedText({
    required this.text,
    required this.color,
    required this.size,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description({
    required Key key,
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
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set the background color to transparent
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                    child: ModifiedText(
                      text: '⭐ Average Rating - $vote',
                      color: Colors.white,
                      size: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 220,
                  width: 150,
                  child: Image.network(
                    posterurl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      ModifiedText(
                        text: name,
                        color: Colors.white,
                        size: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      ModifiedText(
                        text: 'Releasing On - $launch_on',
                        color: Colors.white,
                        size: 14,
                        fontWeight: FontWeight.normal,
                      ),
                        SizedBox(height:2),
            Container(
              padding: EdgeInsets.all(10),
              child: ModifiedText(
                text: description,
                color: Colors.white,
                size: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
                    ],
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
