import 'dart:convert';

import 'package:flutter_course_winter_2021/models/post_model.dart';
import 'package:flutter_course_winter_2021/services/config_consts.dart';
import 'package:http/http.dart' as http;

class PostService {
  Future<List<PostModel>> getAllPosts(String token,
      {int? page, int? size, String? sort}) async {
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    Uri path = Uri.parse('$base_url/api/posts?');
    if (page != null && size != null)
      path = Uri.parse('${path}page=$page&size=$size&');
    if (sort != null) Uri.parse('${path}sort=$sort');
    http.Response response = await http.get(path, headers: headers);
    List data = jsonDecode(response.body) as List;
    List<PostModel> locations =
        data.map((e) => PostModel.fromJson(e)).toList(growable: true);
    return locations;
  }
}
