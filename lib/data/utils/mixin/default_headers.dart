import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin DefaultHeaders {
  Map<String, String> get defaultHeaders {
    return {
      'Authorization': 'Client-ID ${dotenv.env['ACCESS_KEY']}',
      'Accept-Version': 'v1',
    };
  }
}
