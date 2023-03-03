import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  WhatsAppHome(),
      );
  }
}
class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}
class _WhatsAppHomeState extends State<WhatsAppHome> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 3);
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xff128c7e),
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
      child: SafeArea(
        top: true,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff128c7e),
            title: Text("WhatsApp"),
            elevation: 0.7,
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(text: "Chats"),
                Tab(text: "Status"),
                Tab(text: "Calls"),
              ],
            ),
            actions: <Widget>[
              Icon(Icons.search),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
              Icon(Icons.more_vert),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
            ],
          ),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ChatList(),
              StatusScreen(),
              CallList(),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff128c7e),
            child: Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Contact()),);
            }
          ),
        ),
      ),
    );
  }
}
class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Color(0xff128c7e),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
      ),
      child: Scaffold(
        appBar: AppBar(
          title:Text('Select Contacts'),
          backgroundColor: Color(0xff128c7e),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(padding: EdgeInsets.all(15)),
              Text('No contacts to show please add contacts',style: (
              TextStyle(
                fontFamily: 'ProductSans',
                fontWeight: FontWeight.w100,
                letterSpacing: 1,
                fontSize: 16,
              )
              ),),
            ],),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff128c7e),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {}
        ),
      )
    );
  }
}
class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Chat"),
      ),
    );
  }
}
class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Status"),
      ),
    );
  }
}
class CallList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Call List"),
      ),
    );
  }
}