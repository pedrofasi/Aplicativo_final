
import 'package:app_web_papi/Models/registro.model.dart';
import 'package:app_web_papi/Repositories/registro.repository.dart';
import 'package:mobx/mobx.dart';
import '../app_status.dart';

part 'registro.controller.g.dart';

class RegistroController = _RegistroController with _$RegistroController;

abstract class _RegistroController with Store{

  RegistroRepository repository;

  _RegistroController(){
    repository = new RegistroRepository();
    _init();
  }

  _init() async {
    getAll();
  }

  @observable
  AppStatus status = AppStatus.none;

  @observable
  ObservableList<Registro> list = ObservableList<Registro>();

  @action
  Future<void> getAll() async {
    status = AppStatus.loading;
    try {
      final allList = await repository.getAll();
      list.clear();
      list.addAll(allList);
      status = AppStatus.success;
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> create(Registro registro) async {
    status = AppStatus.loading;
    try {
      bool isCreated = await repository.create(registro);
      if(isCreated) {
        getAll();
        status = AppStatus.success;
      }
      else
        status = AppStatus.error..value = "Erro ao tentar adicionar registro!";
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> edit(Registro registro) async {
    status = AppStatus.loading;
    try {
      bool isEdited = await repository.edit(registro);
      if(isEdited) {
        getAll();
        status = AppStatus.success;
      }
      else
        status = AppStatus.error..value = "Erro ao tentar alterar registro!";
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }

  @action
  Future<void> delete(int id) async {
    status = AppStatus.loading;
    try {
      bool isDeleted = await repository.delete(id);
      if(isDeleted) {
        getAll();
        status = AppStatus.success;
      }
      else
        status = AppStatus.error..value = "Erro ao tentar remover o registro!";
    }catch(e){
      status = AppStatus.error..value = e;
    }
  }

}