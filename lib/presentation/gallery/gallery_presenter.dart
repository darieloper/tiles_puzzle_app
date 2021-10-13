import 'package:tiles_puzzle_app/domain/repositories/pictures_repository.dart';
import 'package:tiles_puzzle_app/domain/use_cases/get_random_image.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/observer.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/presenter.dart';

class GalleryPresenter extends Presenter {
  final GetRandomImageUseCase _getRandomUseCase;

  // Listeners
  Function? onSuccess;
  Function? onError;
  Function? onComplete;

  GalleryPresenter(IPicturesRepository repository)
      : _getRandomUseCase = GetRandomImageUseCase(repository);

  @override
  void dispose() {
    _getRandomUseCase.dispose();
  }

  void getRandoms({int count = 5}) {
    _getRandomUseCase.execute(
        GetRandomUseCaseObserver(this), GetRandomImageParams(count));
  }
}

class GetRandomUseCaseObserver extends Observer<GetRandomImageResponse> {
  final GalleryPresenter presenter;

  GetRandomUseCaseObserver(this.presenter);

  @override
  void onNext(GetRandomImageResponse? response) {
    assert(presenter.onSuccess != null);
    presenter.onSuccess!(response);
  }

  @override
  void onError(dynamic error) {
    assert(presenter.onError != null);
    presenter.onError!(error);
  }

  @override
  void onComplete() {
    assert(presenter.onComplete != null);
    presenter.onComplete!();
  }
}
