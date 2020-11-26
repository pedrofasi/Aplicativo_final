import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controllers/registro.controller.dart';
import 'Views/registro_geral.view.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers:[
          Provider<RegistroController>.value(
            value: RegistroController(),)
        ],
        child: MaterialApp(
          title: 'CLICK APP',
          debugShowCheckedModeBanner: false,
          home: RegistroListView(),
        )
    );
  }
}
