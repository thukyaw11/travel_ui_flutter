import 'package:flutter/material.dart';
import 'package:travel_app/workers/data_worker.dart';

class PageDetail extends StatelessWidget {
  final DataWorker data;
  PageDetail({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: buildLeadingIcon(context),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0)),
            child: Image.asset(
              'images/${data.image}',
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30.0)),
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.placeName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: 'NotoSansKR'),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildIconText(Icons.star, data.ranking, Colors.orange),
                    buildIconText(Icons.cloud, data.temperature, Colors.grey),
                    buildIconText(Icons.local_airport, data.kilo, Colors.grey),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
            child: Text(
              data.placeDescription,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                height: 90.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Color(0xff264083),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            data.agency,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            '${data.price} mmk',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Color(0xffDEF1FF)),
                        child: FlatButton(
                            onPressed: () {},
                            child: Text(
                              "Let's Go",
                              style: TextStyle(
                                color: Color(0xff65b8f7),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container buildIconText(dynamic icon, dynamic value, dynamic color) {
    return Container(
      child: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 5.0),
          Text(
            value.toString(),
            style: TextStyle(color: color),
          )
        ],
      ),
    );
  }

  GestureDetector buildLeadingIcon(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: 20.0,
          height: 20.0,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white60,
          ),
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          )),
      onTap: () => Navigator.of(context).pushNamed('/'),
    );
  }
}
