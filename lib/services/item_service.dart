import 'dart:convert';

import 'package:flutter_app2/models/item_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//every page

class ItemService {
  //itemList("item")
  // itemList(textSearch: "item");
  // itemList();

  Future<ItemModel> itemList({required String textSearch}) async {
    ItemModel data = ItemModel();

    try {
      final _prefs = await SharedPreferences.getInstance();

      final _url = Uri.parse('http://poseintelligence.dyndns.biz:8888/cssd_v3_api/api/receive/');
      String token = await _prefs.getString("token") ?? "";
      Map<String, dynamic> _body = {
        "type": "item",
        "token": token,
        "data": {
          "pageKey": 0,
          "textSearch": "$textSearch",
        }
      };


      var response = await http.post(
        _url,
        body: jsonEncode(_body),
      );

      if (response.statusCode == 200) {
        final _jsonResponse = json.decode(response.body);

        data = ItemModel.fromJson(_jsonResponse);
      }

      return data;
    } catch (e) {
      return data;
    }
  }
}
