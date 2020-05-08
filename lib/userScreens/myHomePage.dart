import 'package:ecommercefruits/tools/store.dart';
import 'package:ecommercefruits/userScreens/aboutus.dart';
import 'package:ecommercefruits/userScreens/cart.dart';
import 'package:ecommercefruits/userScreens/delivery.dart';
import 'package:ecommercefruits/userScreens/favorites.dart';
import 'package:ecommercefruits/userScreens/history.dart';
import 'package:ecommercefruits/userScreens/login.dart';
import 'package:ecommercefruits/userScreens/messages.dart';
import 'package:ecommercefruits/userScreens/notification.dart';
import 'package:ecommercefruits/userScreens/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("eCommerce"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new EcommerceFavorites();
                }));
              }),
          new Stack(
            children: <Widget>[
              new IconButton(
                  icon: new Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        new CupertinoPageRoute(builder: (BuildContext context) {
                      return new EcommerceMessages();
                    }));
                  }),
              new CircleAvatar(
                radius: 10.0,
                backgroundColor: Colors.red,
                child: new Text(
                  "0",
                  style: new TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
            ],
          ),
        ],
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: storeItems.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                  child: Stack(
                    alignment: FractionalOffset.topLeft,
                    children: <Widget>[
                      new Stack(
                        alignment: FractionalOffset.bottomCenter,
                        children: <Widget>[
                          new Container(
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: new NetworkImage(
                                    storeItems[index].itemImage),
                              ),
                            ),
                          ),
                          new Container(
                            height: 35.0,
                            color: Colors.orangeAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Text(
                                    storeItems[index].itemName,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  new Text(
                                    "SAR ${storeItems[index].itemPrice}",
                                    style: new TextStyle(
                                        color: Colors.red[900],
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Container(
                            height: 30.0,
                            width: 60.0,
                            decoration: new BoxDecoration(
                              color: Colors.black,
                              borderRadius: new BorderRadius.only(
                                topRight: new Radius.circular(5.0),
                                bottomRight: new Radius.circular(5.0),
                              ),
                            ),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 20.0,
                                ),
                                new Text(
                                  "${storeItems[index].itemRating}",
                                  style: new TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          new IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.blue,
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {
              Navigator.of(context)
                  .push(new CupertinoPageRoute(builder: (BuildContext context) {
                return new EcommerceCart();
              }));
            },
            child: new Icon(Icons.shopping_cart),
          ),
          new CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.red,
              child: new Text(
                "0",
                style: new TextStyle(color: Colors.white, fontSize: 12.0),
              ))
        ],
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Hossam Metwalli"),
              accountEmail: new Text("hossam@mail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: new Icon(Icons.add_a_photo),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Order Notification"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new EcommerceNotification();
                }));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.history,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Order History"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new EcommerceHistory();
                }));
              },
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Profile Setting"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new EcommerceProfile();
                }));
              },
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Delivery Address"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new EcommerceDelivery();
                }));
              },
            ),
            new Divider(),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("About Us"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new EcommerceAboutUs();
                }));
              },
            ),
            new ListTile(
              trailing: new CircleAvatar(
                child: new Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              title: new Text("Login"),
              onTap: () {
                Navigator.of(context).push(
                    new CupertinoPageRoute(builder: (BuildContext context) {
                  return new EcommerceLogin();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
