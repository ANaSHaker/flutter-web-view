import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_splash/flutter_splash.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR7EBO',
      debugShowCheckedModeBanner: false,
      home:  Splash(
        seconds: 3,
        image: Image.asset("assets/logo.png"),
    photoSize: 100,
    loaderColor: Colors.black,
    loadingText: Text("ar7ebo",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    navigateAfterSeconds:Home(),
      ));
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MyPlaceholderWidget('https://ar7bo.com/'),
    MyPlaceholderWidget('https://ar7bo.com/shop/'),
    MyPlaceholderWidget('https://ar7bo.com/product-category/%d8%ac%d9%88%d8%a7%d9%84%d8%a7%d8%aa/'),
    MyPlaceholderWidget('https://ar7bo.com/product-category/%d8%a5%d9%83%d8%b3%d8%b3%d9%88%d8%a7%d8%b1%d8%a7%d8%aa/'),
    MyPlaceholderWidget('https://ar7bo.com/contact-us/'),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('AR7EBO'),
        backgroundColor: Colors.grey,
        elevation: 10,


      ),
      body : _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped  ,
        type: BottomNavigationBarType.fixed , // to Fix add more than 3 bottom without change background to white
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon:   Icon(Icons.home),
            title:   Text('الرئيسيه'),
          ),
          BottomNavigationBarItem(
            icon:   Icon(Icons.store),
            title:   Text('المتحر'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_android),
              title: Text('الجوالات')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('الاكسسوارات')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              title: Text('اتصل بنا')
          ),
        ],


      ),


    );
  }
  //This method handles Tap on BottomNavigationItems & set the current index to our variable
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
class MyPlaceholderWidget extends StatelessWidget {

  var url = 'https://www.google.com'  ;
  final key = UniqueKey();

  MyPlaceholderWidget(String url){
    this.url = url ;
  }

  @override
  Widget build(BuildContext context) {

    return WebView(
        key: key,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
        onWebViewCreated: (WebViewController webViewController){
        });



  }



}