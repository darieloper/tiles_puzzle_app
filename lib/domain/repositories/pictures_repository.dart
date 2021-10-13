import 'package:tiles_puzzle_app/domain/entities/unsplash_picture.dart';

abstract class IPicturesRepository {
  /// Returns all photos resulting of the search by a criteria
  Future<SearchResults> search(String criteria, {int page, int perPage});
}
