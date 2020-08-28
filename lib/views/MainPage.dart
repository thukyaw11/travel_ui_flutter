import 'package:flutter/material.dart';
import 'package:travel_app/widgets/content_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi There!",
                  style: TextStyle(color: Colors.grey),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      'images/avatar.jpg',
                      width: 40.0,
                      height: 40.0,
                    )),
              ],
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Caring You Is",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'NotoSansKR',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Our Business",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'NotoSansKR',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Categories(),
            SizedBox(height: 10.0),
            ContentCard(),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> countries = [
    "Myanmar",
    "Indonesia",
    "Japan",
    "Thailand",
    "Bagan",
    "Bago"
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        scrollDirection: Axis.horizontal,
        itemCount: countries.length,
        itemBuilder: (context, index) => buildCategories(index),
      ),
    );
  }

  Widget buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 35.0),
        child: Column(
          children: [
            Text(
              countries[index],
              style: TextStyle(
                color:
                    _selectedIndex == index ? Color(0xff82D0F9) : Colors.grey,
              ),
            ),
            SizedBox(height: 7.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 5.0,
                height: 5.0,
                color: _selectedIndex == index ? Color(0xff82D0F9) : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
