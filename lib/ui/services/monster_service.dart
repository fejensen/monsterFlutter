import 'package:NAC_FLUTTER/model/monster.dart';
import 'package:dio/dio.dart';
import 'package:NAC_FLUTTER/ui/services/service_config.dart';
import 'dart:developer';

class MonsterService {
  static final String _endpoint =
      "https://5f70f7b864a3720016e600da.mockapi.io/";

  static final String _resource = 'MonsterHunter';

  final ServiceConfig service = new ServiceConfig(_endpoint);

  Future<List<Monster>> findAll() async {
    await Future.delayed(Duration(milliseconds: 3700));

    log('foi');

    try {
      Response response = await service.create().get(_resource);
      monsters.clear();
      if (response.statusCode == 200) {
        response.data.forEach(
          (value) {
            print(value);
            monsters.add(
              Monster.fromMap(value),
            );
          },
        );
      }
      log('foi2');
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }

    return monsters;
  }

  Future<int> create(Monster monster) async {
    try {
      monster.id == 0;
      Response response = await service.create().post(
            _resource,
            data: monster.toMap(),
          );

      if (response.statusCode == 201) {
        var retorno = (response.data["id"] is String)
            ? int.parse(response.data["id"])
            : response.data["id"];
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<Monster> getById(int id) async {
    try {
      String endpoint = _resource + "/" + id.toString();
      Response response = await service.create().get(endpoint);

      if (response.statusCode == 200) {
        var retorno = Monster.fromMap(response.data);
        return retorno;
      }
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<int> update(Monster monster) async {
    try {
      String endpoint = _resource + "/" + monster.id.toString();

      Response response = await service.create().put(
            endpoint,
            data: monster.toMap(),
          );

      var retorno = (response.data["id"] is String)
          ? int.parse(response.data["id"])
          : response.data["id"];
      return retorno;
    } catch (error) {
      print("Service Error: $error ");
      throw error;
    }
  }

  Future<void> delete(Monster monster) async {
    try {
      String endpoint = _resource + "/" + monster.id.toString();

      Response response = await service.create().delete(
            endpoint,
          );

      if (response.statusCode != 200) {
        throw Exception("Não foi possível excluir o reNAC_FLUTTER!");
      }
    } catch (error) {
      throw error;
    }
  }
}
