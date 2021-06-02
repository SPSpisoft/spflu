import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

/// Section 0

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkModeEnabled = false;
  String UserName = "Guest";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xff253341)),
        scaffoldBackgroundColor: Color(0xff15202b),
      ),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                    UserName,
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text(
                    "+98912345789",
                    style: TextStyle(fontSize: 16),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      UserName[0],
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      // child: Image.asset("images/store_logo.png", fit: BoxFit.cover,),
                    )
                  ],
                  onDetailsPressed: () {},
                  decoration: BoxDecoration(
                      gradient:
                      LinearGradient(colors: [Colors.red, Colors.indigo])),
                ),
                ListTile(
                  title: Text("کاربر"),
                  leading: Icon(FontAwesomeIcons.user, color: Colors.amber,),
                ),
                ListTile(
                  title: Text("تنظیمات"),
                  leading: FaIcon(FontAwesomeIcons.box, color: Colors.amber,),
                ),
                ListTile(
                  title: Text("خروج"),
                  leading: Icon(FontAwesomeIcons.windowClose, color: Colors.amber,),
                ),
                ListTile(
                  leading: DayNightSwitcher(isDarkModeEnabled: isDarkModeEnabled, onStateChanged: (bool setMode){
                    setState(() {
                      this.isDarkModeEnabled = setMode;
                    });
                  }),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Olamayee Gallery"),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.verified_user),
              ),
              SizedBox( width: 50, height: 5,
                child: DayNightSwitcher(isDarkModeEnabled: isDarkModeEnabled, onStateChanged: (bool setMode){
                  setState(() {
                    this.isDarkModeEnabled = setMode;
                  });
                }),
              ),
            ],
          ),
          body: MyHomeDetail()),
    );
  }
}

class MyHomeDetail extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomeDetail> {
  var SelectedValue;

  List MyItems = [
    SpItem(
        "گزینه1",
        Image.asset(
          'assets/icon1.png',
          height: 24,
        )),
    SpItem(
        "گزینه2",
        Image.asset(
          'assets/icon2.png',
          height: 24,
        )),
    SpItem(
        "گزینه3",
        Image.asset(
          'assets/icon3.png',
          height: 24,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 400,
      height: 300,
      child: Column(
        children: [
          Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.text,
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Colors.indigoAccent,),
                  ),
                ),
              )),
          Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  maxLength: 10,
                  textDirection: TextDirection.ltr,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.vpn_key_rounded, color: Colors.blue),
                  ),
                ),
              )),
          Center(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                    ),
                    value: SelectedValue,
                    isExpanded: true,
                    hint: Text(
                      "Please select your item",
                    ),
                    items: MyItems.map((mItem) {
                      return DropdownMenuItem(
                          value: mItem,
                          child: Row(
                            children: [
                              mItem.icon,
                              SizedBox(width: 20),
                              Text(mItem.name)
                            ],
                          ));
                    }).toList(),
                    onChanged: (RetValue) {
                      setState(() {
                        SelectedValue = RetValue;
                      });
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Section 2+ (Dr

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {
  List MyItems = [
    SpItem(
        "aa",
        Image.asset(
          'assets/icon1.png',
          height: 24,
        )),
    SpItem(
        "تست",
        Image.asset(
          'assets/icon2.png',
          height: 24,
        )),
    SpItem(
        "cc",
        Image.asset(
          'assets/icon3.png',
          height: 24,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    var SelectedValue;
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                    ),
                  ),
                  value: SelectedValue,
                  isExpanded: true,
                  hint: Text(
                    "Please select your item",
                  ),
                  items: MyItems.map((mItem) {
                    return DropdownMenuItem(
                        value: mItem,
                        child: Row(
                          children: [
                            mItem.icon,
                            SizedBox(width: 20),
                            Text(mItem.name)
                          ],
                        ));
                  }).toList(),
                  onChanged: (RetValue) {
                    setState(() {
                      SelectedValue = RetValue;
                    });
                  }),
            ),
          )),
    );
  }
}

class SpItem {
  String name;
  Image icon;

  SpItem(this.name, this.icon);
}
