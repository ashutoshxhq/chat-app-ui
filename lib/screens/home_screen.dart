import 'package:flutter/material.dart';
import '../widgets/recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  ScrollController _categoryController;
  int selectedIndex = 0;
  final List<String> categories = ['Chats', 'Status', 'Groups', 'Requests'];

  @override
  void initState() {
    super.initState();
    _categoryController = ScrollController();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(87.5),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 3.0),
                        image: DecorationImage(
                            image: AssetImage('assets/ashu.png'))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Ashutosh Dubey',
                          style: TextStyle(
                              fontFamily: 'poppins-regular',
                              fontSize: 25.0,
                              //fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Chats'),
              leading: Icon(Icons.chat_bubble_outline),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Business'),
              leading: Icon(Icons.business),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Wallet'),
              leading: Icon(Icons.account_balance_wallet),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Profile'),
              leading: Icon(Icons.message),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Support'),
              leading: Icon(Icons.contact_mail),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.lock_open),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(size: 30, color: Colors.white),
        title: Text(
          'Magix',
          style: TextStyle(
            fontSize: 28.0,
            fontFamily: 'poppins-regular',
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            color: Theme.of(context).primaryColor,
            child: ListView.builder(
              controller: _categoryController,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    
                    if (_pageController.hasClients) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    }

                    if(index == 2 && selectedIndex == 1){
                      _categoryController.animateTo(_categoryController.offset + 80,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 200));
                    }

                   if(index == 1 && selectedIndex == 2){
                      _categoryController.animateTo(_categoryController.offset - 80,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 200));
                    }
                   
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.white
                            : Colors.white60,
                        fontSize: 17.0,
                        fontFamily: 'poppins-regular',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (index) {
                if(index == 2 && selectedIndex == 1){
                      _categoryController.animateTo(_categoryController.offset + 80,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 200));
                    }

                   if(index == 1 && selectedIndex == 2){
                      _categoryController.animateTo(_categoryController.offset - 80,
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 200));
                    }
                setState(() {
                  selectedIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      RecentChats(),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      RecentChats(),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      RecentChats(),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      RecentChats(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
