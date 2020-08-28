import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:travel_app/workers/data_worker.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class ContentCard extends StatefulWidget {
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  Widget futureWidget() {
    return FutureBuilder(
      future: rootBundle.loadString('json/content-data.json'),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          var mydata = jsonDecode(snapshot.data.toString());
          return Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                                '/place_view',
                                arguments: DataWorker(
                                    placeName: mydata[index]['placeName'],
                                    placeDescription: mydata[index]
                                        ['placeDescription'],
                                    ranking: mydata[index]['rank'],
                                    temperature: mydata[index]['temp'],
                                    kilo: mydata[index]['kilo'],
                                    image: mydata[index]['image'],
                                    agency: mydata[index]['agency'],
                                    price: mydata[index]['price'])),
                            child: buildPlaceItem(mydata, index))
                      ],
                    ),
                  );
                },
                itemCount: mydata.length,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Container buildPlaceItem(mydata, int index) {
    return Container(
        margin: EdgeInsets.only(top: 13.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey[100],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset('images/${mydata[index]['image']}'),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        mydata[index]['placeName'],
                        style: TextStyle(
                            fontFamily: 'NotoSansKR',
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      buildRankStar(mydata[index]['rank']),
                      Text(
                        mydata[index]['placeDescription'],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }

  Row buildRankStar(int rank) {
    int _maxRank = 5;
    final children = <Widget>[];
    for (var index = 0; index < _maxRank; index++) {
      index < rank
          ? children.add(
              Icon(
                Icons.star,
                color: Colors.orange,
                size: 10.0,
              ),
            )
          : children.add(
              Icon(
                Icons.star,
                color: Colors.grey,
                size: 10.0,
              ),
            );
    }
    return Row(children: children);
  }

  @override
  Widget build(BuildContext context) {
    return futureWidget();
  }
}
