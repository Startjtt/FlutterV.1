import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import '../../models/item_model.dart';

class Stock extends StatefulWidget {
  const Stock({Key? key}) : super(key: key);

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  TextEditingController _searchController = TextEditingController(text: "");

  ItemModel itemData = ItemModel();

  void initState() {
    getItem();
    super.initState();
  }

  Future getItem() async {
    context.read<HomeBloc>().add(HomeEventGetItem(textSearch: _searchController.text));
    return;
  }

  Widget _buildItem() => Container(
    child: ListView.separated(
      separatorBuilder: (_, index) {
        return Divider();
      },
      itemCount: itemData.data!.length,
      itemBuilder: (_, index) {
        var _item = itemData.data![index];

        String? _itemName = _item.itemName;
        String _itemCode = "${_item.itemCode}";
        String _totalQty = "${_item.totalQty}";

        return ListTile(
          leading: FlutterLogo(),
          title: Text("$_itemName"),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$_itemCode $_totalQty"),
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        );
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => getItem(),
        child: Icon(Icons.refresh),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeStateGetItem) {
              itemData = state.item;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _searchController,
                      onChanged: (value) {
                        //_searchController.text = value;
                        getItem();
                      },
                      decoration: InputDecoration(
                        suffixIcon: _searchController.text == ""
                            ? SizedBox()
                            : IconButton(
                          splashRadius: 18,
                          icon: Icon(Icons.close),
                          onPressed: () {
                            _searchController.text = "";
                            getItem();
                          },
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      child: itemData.data == null || itemData.data?.length == 0
                          ? Center(
                        child: Text("not found"),
                      )
                          : _buildItem(),
                    ),
                  ),
                ],
              );
            }

            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),);
  }
}
