class Registro {
  int id;
  String email;
  String senha;
  int clicks;

  Registro({this.id, this.email, this.senha, this.clicks});

  Registro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    senha = json['senha'];
    clicks = json['clicks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['clicks'] = this.clicks;
    return data;
  }
}
