import 'package:the_movie_db/models/Province/province.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ====================================================================//
// Cách 1
/*
class Api {
  Future<List<Province>> getAllProvinceOfVietNam(
      {required Function(String) onError}) async {
    String endPoint = 'https://vapi.vnappmob.com/api/province/';
    List<Province> provices = [];// đối với list empty, chuyển đổi sang trạng thái rỗng
    final Uri url = Uri.parse(endPoint);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["results"];
        data.forEach((element) {
          provices.add(Province.formJson(element));
          //code mới
          /* for (var element in data) {
          provices.add(Province.formJson(element));
        } */
        });
      } catch (e) {
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return provices;
  }
}
*/
//=============================================================================//
// Cách 2: thêm onSuccess vào hàm getApi
// Sử dụng tốt hơn với những tác vụ yêu cầu trả về dữ liệu liên tục
// Mọi dữ liệu trả về sẽ được trả về trong callback onSuccess

class Api {
  Future<void> getAllProvinceOfVietNam2(
      {required Function(List<Province>) onSuccess, required Function(String) onError}) async { // make onSuccess thành nullNable
    String apiPoint = "https://vapi.vnappmob.com/api/province/";
    List<Province> provices = [];
    final Uri url = Uri.parse(apiPoint);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["results"];
        for (var element in data) {
          provices.add(Province.formJson(element)); // sử dụng covert của VsCode
        }
      } catch (e) {
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
  }
}
