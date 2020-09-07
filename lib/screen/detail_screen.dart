import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String body;
  const DetailScreen({Key key, this.body, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ0YL8JMFhbNpp76cO92s_I9TRSxgGXVTv4Vg&usqp=CAU",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  body,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
