import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:learning/AddComplain.dart';
import 'package:learning/AppConstant.dart';
import 'package:learning/ComplainDataModal.dart';
import 'package:learning/MyComplainDetail.dart';
import 'package:learning/TicketListFromStatus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllComplainList extends StatefulWidget {
  @override
  _AllComplainListState createState() => _AllComplainListState();
}

class _AllComplainListState extends State<AllComplainList> {
  late List<Widget> children = <Widget>[];
  late List<dynamic> list = <dynamic>[];
  final _textStatus = TextEditingController();

  String no_of_ticket = "";
  String new_ickets = "";
  String in_progress = "";
  String completed = "";
  String canceled = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("All Tickets"),
          backgroundColor: Colors.blue,
          actions: <Widget>[],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                    // 2.
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TicketListFromStatus(
                          status: "1",
                        ),
                      ));
                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                new_ickets + "\n New",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      ),
                    ),
                  ),

                  GestureDetector(
                    // 2.
                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TicketListFromStatus(
                          status: "2",
                        ),
                      ));

                    },
                    child: Container(
                      height: 120,
                      width: 120,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                in_progress + "\n in-Progress",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      ),
                    ),
                  ),

                  GestureDetector(
                    // 2.
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TicketListFromStatus(
                          status: "3",
                        ),
                      ));

                    },
                    child: Container(
                      height: 120,
                      width: 117,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                completed + "\n Completed",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  decorationStyle: TextDecorationStyle.wavy,
                                ),
                              ),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      ),
                    ),
                  ),

                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40, top: 130),
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyComplainDetail(
                              id: list[index].id,
                              complaints_user: list[index].complaints_user.toString(),
                              company_id: list[index].company_id,
                              department_id: list[index].department_id,
                              subject: list[index].subject,
                              description: list[index].description,
                              image_one: list[index].image_one,
                              image_two: list[index].image_two,
                              image_three: list[index].image_three,
                              image_four: list[index].image_four,
                              image_five: list[index].image_five,
                              resolved_by_user: list[index].resolved_by_user.toString(),
                              remarks: list[index].remarks,
                              resolved_image: list[index].resolved_image,
                              resolved_date: list[index].resolved_date,
                              create_date: list[index].create_date,
                              status: list[index].status,
                            ),
                          ));
                        },
                        child: Container(
                          height: 150,
                          child: Card(
                            margin: EdgeInsets.all(15),
                            child: ListTile(
                                leading: Container(
                                    width: 40,
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Image.network(API_Base_urlWithout +
                                        list[index].image_one)),
                                title: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                list[index].subject,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  decorationStyle:
                                                      TextDecorationStyle.wavy,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                list[index].tickets_categories.toString(),
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  decorationStyle:
                                                  TextDecorationStyle.wavy,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                list[index].complaints_user.toString(),
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  decorationStyle:
                                                  TextDecorationStyle.wavy,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                list[index].company_id.toString(),
                                                maxLines: 1,
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.normal,
                                                  decorationStyle:
                                                  TextDecorationStyle.wavy,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  list[index].description,
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.normal,
                                                    decorationStyle:
                                                    TextDecorationStyle.wavy,
                                                  ),
                                                ),
                                              ),
                                              if (list[index].status == "1")
                                                Container(
                                                  height: 25,
                                                  width: 70,
                                                  child: FlatButton(
                                                    child: Text(
                                                      "New",
                                                      style:
                                                      TextStyle(fontSize: 10.0),
                                                    ),
                                                    color: Colors.orange,
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      //updateStatusApi(list[index].id.toString(), "2");
                                                    },
                                                  ),
                                                ),
                                              if (list[index].status == "2")
                                                Container(
                                                  height: 28,
                                                  width: 84,
                                                  child: FlatButton(
                                                    child: Text(
                                                      "In-Progress",
                                                      style:
                                                      TextStyle(fontSize: 8.5),
                                                    ),
                                                    color: Colors.green,
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      //updateStatusApi(list[index].id.toString(), "1");
                                                    },
                                                  ),
                                                ),
                                              if (list[index].status == "4")
                                                Container(
                                                  height: 28,
                                                  width: 77,
                                                  child: FlatButton(
                                                    child: Text(
                                                      "Cancelled",
                                                      style:
                                                      TextStyle(fontSize: 10.0),
                                                    ),
                                                    color: Colors.red,
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      //updateStatusApi(list[index].id.toString(), "1");
                                                    },
                                                  ),
                                                ),
                                              if (list[index].status == "3")
                                                Container(
                                                  height: 28,
                                                  width: 75,
                                                  child: FlatButton(
                                                    child: Text(
                                                      "Done",
                                                      style:
                                                      TextStyle(fontSize: 10.0),
                                                    ),
                                                    color: Colors.grey,
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      //updateStatusApi(list[index].id.toString(), "1");
                                                    },
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  elevation: 0.0,
                  child: new Icon(Icons.add),
                  backgroundColor: new Color(0xFFE57373),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddComplain()),
                    );
                  })),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    complainList();
  }

  Future complainList() async {
    EasyLoading.show();
    final prefs = await SharedPreferences.getInstance();

    final response = await http.get(Uri.parse(ticket_get_list));

    print(response.body.toString());

    if (response.statusCode == 200) {
      EasyLoading.dismiss();
      final jsonResponse = json.decode(response.body);
      var rest = jsonResponse["result"]["ticket_list_details"] as List;
      new_ickets = jsonResponse["result"]["New Tickets"].toString();
      in_progress = jsonResponse["result"]["In-Progress"].toString();
      no_of_ticket = jsonResponse["result"]["number_of_tickets"].toString();
      completed = jsonResponse["result"]["Completed"].toString();
      canceled = jsonResponse["result"]["Canceled"].toString();
      list = rest
          .map<ComplainDataModal>((json) => ComplainDataModal.fromJson(json))
          .toList();
      setState(() {});
    } else {
      EasyLoading.dismiss();
      print(response.statusCode);
      throw Exception('Failed to create album.');
    }
  }

  Future updateStatusApi(String uuid, String status) async {
    final queryParameters = {
      'uuid': uuid.toString(),
      'status': status.toString()
    };
    print(queryParameters);
    final response =
        await http.post(Uri.parse(status_announcement), body: queryParameters);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse['res_code'] == 200) {
        Fluttertoast.showToast(
            msg: "Status Added Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
        complainList();
      } else {
        Fluttertoast.showToast(
            msg: "Some Error Occured",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1);
      }
    }
  }
}
