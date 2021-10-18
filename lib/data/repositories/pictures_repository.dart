import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:tiles_puzzle_app/data/exceptions/invalid_search_response.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';
import 'package:tiles_puzzle_app/data/utils/mixin/default_headers.dart';
import 'package:tiles_puzzle_app/domain/entities/unsplash_picture.dart';
import 'package:tiles_puzzle_app/domain/repositories/pictures_repository.dart';
import 'package:http/http.dart' as http;

class PicturesRepository extends IPicturesRepository with DefaultHeaders {
  @override
  Future<SearchResults> search(
    String criteria, {
    int page = 1,
    int perPage = 10,
  }) async {
    SearchResults result = SearchResults(total: 0, totalPages: 0, results: []);
    try {
      final uri = Uri.parse(dotenv.env['BASE_URL']! +
          '/search?page=$page&per_page=$perPage&query=$criteria');

      final response = await http.get(uri, headers: defaultHeaders);

      if (response.statusCode == HttpStatus.ok) {
        result = SearchResults.fromJson(jsonDecode(response.body));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw InvalidSearchResponse(ConstantErrors.INVALID_SEARCH_RESPONSE);
    }

    return result;
  }

  @override
  Future<List<UnsplashPicture>> random({int count = 1}) async {
    List<UnsplashPicture> result = [];
    try {
      final uri =
          Uri.parse(dotenv.env['BASE_URL']! + 'photos/random?count=$count');

      final response = await http.get(uri, headers: defaultHeaders);

      if (response.statusCode == HttpStatus.ok) {
        final list = jsonDecode(response.body) as List<dynamic>;
        result = list
            .map((e) => UnsplashPicture.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw InvalidSearchResponse(ConstantErrors.INVALID_SEARCH_RESPONSE);
    }

    return result;
  }
}
