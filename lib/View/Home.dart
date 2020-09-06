import 'package:flutter/material.dart';
import 'package:proyecto/View/Historial.dart';
import 'package:proyecto/View/HomeList.dart';
import 'package:proyecto/View/Tiempo.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
   TabController controller;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length:3,vsync: this);
  }
 
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Software 1"),
        backgroundColor: Colors.lightBlue
      ),
      drawer: _listadeDrawer(),
      bottomNavigationBar: _bootomNavigators(),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          HomeList(),Historial(),Tiempo()
        ],
      ),
    );
  }
  Widget _listadeDrawer(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Gestionar ........"),
          ),
          ListTile(
            title: Text("Gestionar ........"),
          ),
          ListTile(
            title: Text("Gestionar ........"),
          ),
          ListTile(
            title: Text("Gestionar ........"),
          ),
          ListTile(
            title: Text("Gestionar ........"),
          ),
        ],
      ),
    );
  }
  
  Widget _bootomNavigators(){
    return Material(
      color: Colors.blueAccent,
      child: TabBar(
        tabs: <Tab>[
          Tab(icon:Icon(Icons.home)),
          Tab(icon:Icon(Icons.history)),
          Tab(icon:Icon(Icons.hourglass_empty)),
        ],
        controller: controller,
      ),        
    );
  }



}