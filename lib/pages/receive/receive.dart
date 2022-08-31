import 'package:flutter/material.dart';
import 'package:flutter_app2/models/receive_model.dart';
import 'package:intl/intl.dart';

import '../../services/receive_service.dart';

class Receive extends StatefulWidget {
  const Receive({Key? key}) : super(key: key);

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  ReceiveModel receiveData = ReceiveModel();

  Future getReceive() async {
    final _receiveService = ReceiveService();
    receiveData = await _receiveService.receiveList(dateSearch: "${_dateController.text}");
    setState(() {});
  }

  DateTime selectedDate = DateTime.now();
  TextEditingController _dateController = TextEditingController(text: "");

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      getReceive();

      // setState(() {
      selectedDate = picked;
      String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
      _dateController.text = "$formattedDate";

      // });
    }
    // DateTime now = DateTime.now();
    // String _dateController = DateFormat('dd-MM-yyyy – kk:mm').format(now);
    //print("$formattedDate");
  }

  @override
  void initState() {
    // _dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
    _dateController.text = "$formattedDate";

    getReceive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () => _selectDate(context),
          child: TextFormField(
            enabled: false,
            controller: _dateController,
            decoration: InputDecoration(
              //hintText: "${selectedDate.toLocal()}".split(' ')[0],
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Visibility(
          visible: false,
          child: ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select date'),
          ),
        ),
        Expanded(
          //การกระจายข้อมูลให้เต็มหน้าจอ
          child: Container(
            child: receiveData.data == null || receiveData.data!.length == 0
                ? Center(
                    child: Text("Not Found!"),
                  )
                : ListView.builder(
                    itemCount: receiveData.data!.length,
                    itemBuilder: (_, index) {
                      var _receive = receiveData.data![index];
                      // return ListTile(
                      //   leading: FlutterLogo(),
                      //   title: Text("${_receive.usageCode}"),
                      //   subtitle: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Text("${_receive.itemName}"),
                      //   ),
                      //   trailing: Icon(Icons.arrow_forward_ios_rounded),
                      //   onTap: () {},
                      // );

                      bool _isSelected = _receive.selected == 1;

                      print( _receive.selected );

                      return CheckboxListTile(
                        value: _isSelected,
                        onChanged: (value) {
                          _receive.selected = value! ? 1 : 0;
                          setState(() {

                          });
                        },
                          title: Text("${_receive.usageCode}"),
                          subtitle: Text("${_receive.itemName}"),
                      );
                    },
                  ),
          ),
        )
      ],
    );
  }
}
