import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:the_movie_db/models/post.dart';
import 'package:http/http.dart' as http;

List<Post> parsePost(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
  return posts;
}

Future<List<Post>> fetchPost() async {
  const String apiLink = 'https://jsonplaceholder.typicode.com/posts';

  final Uri url = Uri.parse(apiLink);
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return compute(parsePost, response.body);
  } else {
    throw Exception("Request Api");
  }
}
