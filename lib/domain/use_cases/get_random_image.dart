import 'dart:async';

import 'package:tiles_puzzle_app/data/exceptions/invalid_search_response.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';
import 'package:tiles_puzzle_app/domain/entities/unsplash_picture.dart';
import 'package:tiles_puzzle_app/domain/repositories/pictures_repository.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/use_case.dart';

class GetRandomImageUseCase
    extends UseCase<GetRandomImageResponse, GetRandomImageParams> {
  final IPicturesRepository repository;

  GetRandomImageUseCase(this.repository);

  @override
  Future<Stream<GetRandomImageResponse>> buildUseCaseStream(
      GetRandomImageParams params) async {
    final controller = StreamController<GetRandomImageResponse>();
    final _className = this.runtimeType;

    try {
      final images = await repository.random(count: params.count);
      if (images.isNotEmpty) {
        controller.add(GetRandomImageResponse(images));
        print('[SUCCESS] $_className');
      } else {
        controller.addError(
            InvalidSearchResponse(ConstantErrors.INVALID_SEARCH_RESPONSE));
        print('[ERROR] $_className');
      }

      controller.close();
    } catch (e) {
      controller.addError(e);
      print('[ERROR] $_className');
    }

    return controller.stream;
  }

  @override
  void dispose() {}
}

class GetRandomImageParams {
  final int count;

  GetRandomImageParams(this.count);
}

class GetRandomImageResponse {
  final List<UnsplashPicture> pictures;

  GetRandomImageResponse(this.pictures);
}
