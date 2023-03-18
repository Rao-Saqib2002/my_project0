import 'package:flutter/material.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: _buildList()),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = [];
    list.add(SearchBarCustom());

    for (int i = 0; i < 10; i++) {
      list.add(ListItem(subtitle: 'subtitle $i', title: 'title $i'));
    }
    return list;
  }
}


class ListItem extends StatelessWidget {
  ListItem({
    super.key,
    required this.subtitle,
    required this.title,
  });

  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.lightGreen,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      isThreeLine: true,
      trailing: FittedBox(
        child: Column(children: [
          Text('date'),
          IconButton(onPressed: () {}, icon: Icon(Icons.star))
        ]),
      ),
    );
  }
}


class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.lightGreen,
                ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Icon(Icons.circle_notifications),
            Container(width: MediaQuery.of(context).size.width * 0.05),
            
            Expanded(
              
              child: TextField(
                
                controller: TextEditingController(),
                expands: false,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: 'enter a serach item'
                ),

                
                maxLines: 1,
                
                autofocus: true,
              ),
            ),
            Container(width: MediaQuery.of(context).size.width * 0.6),


            CircleAvatar(),
            Container(width: MediaQuery.of(context).size.width * 0.05,)

          ],
        ),
      ),
    );
  }
}
