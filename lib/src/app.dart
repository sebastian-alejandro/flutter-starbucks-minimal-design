import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var selectedCategory = 'All products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, right: 15),
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF116D51),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 30,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(
                            '16',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              'Starbucks Coffee',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 22,
                fontWeight: FontWeight.bold
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
            child: Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildItem('All products', 59),
                  _buildItem('Espresso', 17),
                  _buildItem('Ice Tea', 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
            child: Container(
              height: MediaQuery.of(context).size.height - 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCardItem('assets/coffee.jpg', 'Latte with Turmeric', 'Iced, Coffe', '2.99'),
                  _buildCardItem('assets/coffee2.jpg', 'Latte with Turmeric', 'Iced, Coffe', '3.99'),
                  _buildCardItem('assets/coffee3.jpg', 'Latte with Turmeric', 'Iced, Coffe', '1.99'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCardItem(String imgPath, String productName, String categoryName, String price) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        width: 225,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 4,
            )
          ]
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 225,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    productName,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 14,
                      color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 0.4,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$' + price,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildItem(String categoryName, int count) {
    return Padding(
      padding: EdgeInsets.only(right: 15, top: 10, bottom: 10, left: 4),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: switchBoxColor(categoryName),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 2,
              color: switchBoxShadow(categoryName)
            )
          ]
        ),
        height: 40,
        width: 125,
        child: InkWell(
          onTap: () {
            selectCategory(categoryName);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: switchTextColor(categoryName)
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  categoryName,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    color: switchTextColor(categoryName)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectCategory(catName) {
    setState(() {
      selectedCategory = catName;
    });
  }

  switchBoxColor(catName) {
    if (catName == selectedCategory) {
      return Color(0xFF116D51);
    }
    else {
      return Colors.grey.withOpacity(0.3);
    }
  }

  switchTextColor(catName) {
    if (catName == selectedCategory) {
      return Colors.white;
    }
    else {
      return Colors.black;
    }
  }

  switchBoxShadow(catName) {
    if (catName == selectedCategory) {
      return Color(0xFF116D51).withOpacity(0.4);
    }
    else {
      return Colors.transparent;
    }
  }
}
