import 'package:flutter/material.dart';

import '../Model/user_data_model.dart';
import '../Repository/user_repo.dart';

class UserPagination extends StatefulWidget {
  const UserPagination({Key? key}) : super(key: key);

  @override
  State<UserPagination> createState() => _UserPaginationState();
}

class _UserPaginationState extends State<UserPagination> {
  int limit = 10;
  late bool isComplete;
  List<UserModel> allUsers = [];
  bool apiCalling = false;
  late ScrollController _controller;
  void apiData() async {
    allUsers = await UserRepository.getUserData(limit: limit, pageNo: 1);
    setState(() {});
  }

  @override
  void initState() {
    isComplete = false;
    _controller = ScrollController()
      ..addListener(() {
        if (_controller.position.extentAfter ==
            _controller.position.minScrollExtent) {
          if (apiCalling == false && limit <= 60) {
            limit = limit + 10;
            setState(() {});
            apiCalling = true;
            setState(() {
              apiData();
              UserRepository.getUserData(limit: limit, pageNo: 1)
                  .whenComplete(() {
                apiCalling = false;
                setState(() {});
              });
            });
          }
        } else if (_controller.position.extentAfter ==
            _controller.position.maxScrollExtent) {

        }
      });
    apiData();
    UserRepository.getUserData(limit: 10, pageNo: 1).whenComplete(() {
      isComplete = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Pagination'),
      ),
      body: isComplete == false
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: allUsers.length,
                    controller: _controller,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(16),
                        height: 100,
                        width: 40,
                        color: Colors.white,
                        child: Text(allUsers[index].title!),
                      );
                    },
                  ),
                ),
                apiCalling == true
                    ? const CircularProgressIndicator()
                    : Container(),
                limit >= 70 && apiCalling==false
                    ?const Padding(
                      padding:  EdgeInsets.only(bottom: 16),
                      child:  Text(
                          'all Data Fetched',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow),
                        ),
                    )
                    : Container(),
              ],
            ),
    );
  }
}
