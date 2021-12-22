import 'package:flutter/material.dart';
import 'package:the_movie_db/models/flutter_api_2/user_model.dart';
import 'package:the_movie_db/resources/sever/sever.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<UserModel>? listUserModel;
  List<UserModel>? displayUserModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Api Part 2"),
      ),
      body: FutureBuilder(
          future: userRequestSever(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(displayUserModel?[index].companyModel.name ?? "abc"),
                    subtitle: Text(displayUserModel?[index].email ?? "abc"),
                    trailing: const Icon(
                      Icons.arrow_right,
                      size: 30.0,
                    ),
                  );
                },
                itemCount: displayUserModel?.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  @override
  void initState() {
    userRequestSever().then((value) {
      setState(() {
        displayUserModel = value;
      });
    });
    super.initState();
  }
}
