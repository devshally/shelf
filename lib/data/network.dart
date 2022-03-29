import 'package:dio/dio.dart';
import 'package:shelf/model/author.dart';

///This class is going to be used to fetch data from the api.
class Network {
  Future<List<Author>> getAuthorData() async {
    final Dio dio = Dio();
    final response = await dio.get('https://quotable.io/authors');
    if (response.statusCode == 200) {
      final List<Author> data = response.data["results"]
          .map<Author>((author) => Author.fromJson(author))
          .toList();
      return data;
    } else {
      throw Exception('Failed to load authors');
    }
  }
}
