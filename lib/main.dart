import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersonWidget(),
    );
  }
}

class FavoriteWidgets extends StatefulWidget {
  @override
  State<FavoriteWidgets> createState() => _FovoritWidgetsState();
}

class _FovoritWidgetsState extends State<FavoriteWidgets> {
  bool _isFavorites = false;
  int _faoriteCount = 777;

  @override
  Widget build(BuildContext context) {
    return Row( children: [
      IconButton(
          onPressed: _toggleFavorite, 
          icon: (_isFavorites? Icon(Icons.favorite): Icon(Icons.favorite_border)),
          color: Colors.red,
          ),
          SizedBox(
            width: 40,
            child: 
        Container(
          child: Text('$_faoriteCount'),
        ),
        ), 
       ],
     );
  }
void _toggleFavorite(){
  setState(() {
    if (_isFavorites){
      _isFavorites = false;
      _faoriteCount -= 1;
    }else{
      _isFavorites = true;
      _faoriteCount += 1;      
    }
  });
}

}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Америка'),
      ),
      body: Container(child: _buildMainColumn()),
    );
  }

  Widget _buildMainColumn() => ListView(
        children: [
          _buildToImg(),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildReit(),
                  ),
                  Card(
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: _buildAction(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: _buildDesc(),
                  )
                ],
              ),
            ),
          )
        ],
      );

    Widget _buildDesc()=> const Text(
    'Некоторые говорят, что у меня есть удары, как у Надаля, '
    'Джоковича и Федерера, но это нормально, потому что за ними '
    'я наблюдал последние 20 лет. Но мне хочется верить, '
    'что я на 100% Алькарас, а не чья-то копия», – верит в свою '
    'уникальность первая ракетка мира.',
    softWrap: true,
    style: TextStyle(
      fontSize: 16
    ),);

  Widget _buildToImg() => Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Card(
        shape: Border.all(),
        margin: const EdgeInsets.all(8),
        elevation: 5,
        child: Image.asset(
          'assets/images/1.jpg',
          fit: BoxFit.contain,
          width: 300,
          //height: 200,
        ),
      ),
    ],
  );

Widget _buildReit() => ListTile(
  title: const Text('Tecuro',
  style: TextStyle(
    fontWeight: FontWeight.w500
  ),
  ),
  subtitle: const Text('Japon'),
  trailing: Row(
   mainAxisSize: MainAxisSize.min,
   children: 
    <Widget>[
  FavoriteWidgets()
    ],
  ),
);

Widget _buildAction() => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    _buildButton('Bloc1',Icons.stars,Colors.cyan) ,
    _buildButton('Bloc2',Icons.radio_button_checked,Colors.brown) ,
    _buildButton('Bloc3',Icons.school,Colors.redAccent) ,
  ],
);

Widget _buildButton(String label, IconData icon, Color color) => 
Column(
  children: [
    Icon(icon,color: Colors.black,),
    Text(
      label,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        color: color,
      ),
    )
  ],
);
}
