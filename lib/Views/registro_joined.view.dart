
import 'package:app_web_papi/Models/registro.model.dart';
import 'package:app_web_papi/Controllers/registro.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistroFormView1 extends StatefulWidget {

  final Registro registro;

  RegistroFormView1({this.registro});

  @override
  _RegistroFormViewState1 createState() => _RegistroFormViewState1();
}

class _RegistroFormViewState1 extends State<RegistroFormView1> {
  var _tcounter = 0;
  String _tEmail, _tSenha;
  Registro _registro;

  @override
  void initState() {
    super.initState();

    _registro = widget.registro;
    _tEmail = _registro.email;
    _tSenha = _registro.senha;
    _tcounter = _registro.clicks;

  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<RegistroController>(context);

    void saveData(){
      _registro.clicks = _tcounter;
      _registro.senha = _tSenha;
      _registro.email = _tEmail;
      _controller.edit(_registro);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("CLIQUE!" ,style: TextStyle(color: Colors.red),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('https://assets.stickpng.com/images/59060c930cbeef0acff9a65c.png',height: 200,width: 500, ),
            Text(
              'Olá! Você já clicou:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            Text(
              '$_tcounter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 150,
              ),
            ),
            Text(
              'vezes. Clique Mais!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0),
              height: 45,
              child: RaisedButton(
                color: Colors.green,
                child: Text(
                  "Clique!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                onPressed: () {
                  _incrementCounter();
                },
              ),
            ),
            Text(
              'Clique aqui -->',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                height: 6,

              ),
            ),
            Text(
            'Para salvar seu progresso!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            )],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
              saveData();
        },
        child: Icon(Icons.save),
      ),
    );



  }

  void _incrementCounter() {
    setState(() {
      _tcounter++;
    });
  }
}