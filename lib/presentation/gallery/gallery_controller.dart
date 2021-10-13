import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/domain/repositories/pictures_repository.dart';
import 'package:tiles_puzzle_app/domain/use_cases/get_random_image.dart';
import 'package:tiles_puzzle_app/presentation/gallery/gallery_presenter.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/controller.dart';

class GalleryController extends BaseController {
  final GalleryPresenter presenter;
  var pictures = <dynamic>[].obs;
  var loading = true.obs;

  GalleryController(IPicturesRepository repository)
      : presenter = GalleryPresenter(repository),
        super() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      presenter.getRandoms(count: 10);
    });
  }

  @override
  InternalFinalCallback<void> get onStart {
    presenter.onComplete = () {
      loading.value = false;
    };

    presenter.onError = (error) {
      print(error);
    };

    presenter.onSuccess = (GetRandomImageResponse response) {
      pictures.value = response.pictures;
    };

    return super.onStart;
  }
}
