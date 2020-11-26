// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registro.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistroController on _RegistroController, Store {
  final _$statusAtom = Atom(name: '_RegistroController.status');

  @override
  AppStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AppStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$listAtom = Atom(name: '_RegistroController.list');

  @override
  ObservableList<Registro> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<Registro> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getAllAsyncAction = AsyncAction('_RegistroController.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$createAsyncAction = AsyncAction('_RegistroController.create');

  @override
  Future<void> create(Registro registro) {
    return _$createAsyncAction.run(() => super.create(registro));
  }

  final _$editAsyncAction = AsyncAction('_RegistroController.edit');

  @override
  Future<void> edit(Registro registro) {
    return _$editAsyncAction.run(() => super.edit(registro));
  }

  final _$deleteAsyncAction = AsyncAction('_RegistroController.delete');

  @override
  Future<void> delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
status: ${status},
list: ${list}
    ''';
  }
}
