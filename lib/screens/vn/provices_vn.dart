import 'package:flutter/material.dart';
import 'package:the_movie_db/models/Province/province.dart';
import 'package:the_movie_db/resources/Province/api_province.dart';

class ProvicesVietNam extends StatefulWidget {
  const ProvicesVietNam({Key? key}) : super(key: key);

  @override
  State<ProvicesVietNam> createState() => _ProvicesVietNamState();
}

class _ProvicesVietNamState extends State<ProvicesVietNam> {
  bool isLoading = false;

  List<Province> provices = [];
// xử lý theo cách 1
/*
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      setState(() => isLoading = true);
      List<Province> values =
          await Api().getAllProvinceOfVietNam(onError: (msg) {
        setState(() {
          isLoading = false;
        });
        print(msg);
      });
      setState(() {
        isLoading = false;
        provices = values;
      });
    });
  }
   */

//=============================================================================//

  // xử lý theo cách 2
  //đối với cách 2, xử lý data sẽ đồng nhất, rõ ràng để để xử lý các trường hợp
  //và đặc biệt lắng nghe data liên tục
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      setState(() {
        isLoading = true;
      });
      await Api().getAllProvinceOfVietNam2(onSuccess: (values) {
        setState(() {
          isLoading = true;
          provices = values;
        });
      }, onError: (msg) {
        setState(() {
          isLoading = false;
          print(msg);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provinces of VietNam"),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(
              child: Text("loading ..."),
            )
          : provices.isEmpty
              ? const Center(
                  child: Text("empty"),
                )
              : ListView(
                  children: provices.map((province) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      color: Colors.green,
                      child: Text(province.name),
                    );
                  }).toList(),
                ),
    );
  }
}
