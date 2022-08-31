import 'package:flutter/material.dart';
import 'package:flutter_app2/models/item_model.dart';
import 'package:flutter_app2/pages/receive/receive.dart';
import 'package:flutter_app2/pages/stock/stock.dart';
import 'package:flutter_app2/services/item_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/home/home_bloc.dart';
import '../../services/auth_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String start = "";

  @override
  void initState() {
    getItem();
    super.initState();
  }

  String token = "";

  Future getUser() async {
    final _prefs = await SharedPreferences.getInstance();
    token = await _prefs.getString("token") ?? "";

    setState(() {});
  }

  TextEditingController _searchController = TextEditingController(text: "");

  ItemModel itemData = ItemModel();

  Future getItem() async {
    context.read<HomeBloc>().add(HomeEventGetItem(textSearch: _searchController.text));
    return;

    final _itemService = ItemService();
    itemData = await _itemService.itemList(textSearch: _searchController.text);
    setState(() {});
    print(itemData.toJson());
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
            ],
          ),
          title: const Text('Tabs Demo'),
        ),
        body: const TabBarView(
          children: [
            Stock(),
            Receive(),
          ],
        ),
      ),
    );
  }
}
