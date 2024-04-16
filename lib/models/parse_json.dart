import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPost() async {
  final response = await http.get(
    Uri.parse('https://api.npoint.io/8b6caf62f7da3aae9896'),
  );
  if (response.statusCode == 200) {
    return parseStores(response.body);
  } else {
    throw Exception("Unexpected Error");
  }
}

List<Post> parseStores(String responseBody) {
  final parsed = jsonDecode(responseBody) as Map<String, dynamic>;
  final storesJson = parsed['stores'] as List<dynamic>;
  return storesJson
      .map(
        (json) => Post.fromJson(json as Map<String, dynamic>),
      )
      .toList();
}

class Post {
  late final String address;
  late final String city;
  late final String image;

  Post({required this.address, required this.city, required this.image});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      address: json['address'] as String,
      city: json['city'] as String,
      image: json['image'] as String,
    );
  }
}
