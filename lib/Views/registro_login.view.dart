
import 'package:app_web_papi/Models/registro.model.dart';
import 'package:app_web_papi/Controllers/registro.controller.dart';
import 'package:app_web_papi/Views/registro_joined.view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistroFormView extends StatefulWidget {

  final Registro registro;

  RegistroFormView({this.registro});

  @override
  _RegistroFormViewState createState() => _RegistroFormViewState();
}

class _RegistroFormViewState extends State<RegistroFormView> {

  final _tId = TextEditingController();
  final _tEmail = TextEditingController();
  final _tSenha = TextEditingController();
  final _tClicks = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool _isEdited = false;
  Registro _registro;

  @override
  void initState() {
    super.initState();

    if (widget.registro == null) {
      _registro = Registro();
      _isEdited = false;
    } else {
      _registro = widget.registro;
      _isEdited = true;
      _tId.text = _registro.id.toString();
      _tEmail.text = _registro.email;
      _tSenha.text = _registro.senha;
      _tClicks.text = _registro.clicks.toString();

    }
  }

  // PROCEDIMENTO PARA VALIDAR OS CAMPOS
  _validate(String text, String field) {
    if (text.isEmpty) {
      return "Digite $field";
    }
    return null;
  }

  // Widget EditText
  _editText(String field, TextEditingController controller, TextInputType type) {
      return TextFormField(
        controller: controller,
        validator: (s) => _validate(s, field),
        keyboardType: type,

        obscureText: controller == _tSenha ? true : false,
        decoration: InputDecoration(
          labelText: field,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {

    final _controller = Provider.of<RegistroController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Registre-se",style: TextStyle(color: Colors.green),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(

          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.network('https://i.pinimg.com/736x/3b/b7/64/3bb764b9096afec26b2e63135ec4790b.jpg',height: 300,fit: BoxFit.cover, ),
                Text("Lembre-se: A equipe ClickGame nunca irá pedir sua senha!"),
                _editText("Email", _tEmail,TextInputType.text),
                _editText("Senha", _tSenha,TextInputType.visiblePassword),

                if(_isEdited)
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5),
                    height: 45,
                    child: RaisedButton(
                      color: Colors.green,
                      child: Text(
                        "Cadastrar!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {

                          _registro.email = _tEmail.text;
                          _registro.senha = _tSenha.text;
                          _registro.clicks = 0;
                          _registro.id = 0;
                          _controller.create(_registro);
                          }
                          Navigator.pop(context);
                        },
                    ),
                  ),
              ],
            ),
          )),
    );
  }

}
