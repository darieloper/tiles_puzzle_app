import 'package:logger/logger.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/observer.dart';

abstract class UseCase<UseCaseResponse extends dynamic,
    UseCaseParams extends dynamic> {
  final Logger _logger;

  UseCase() : _logger = Logger();

  void dispose();

  Logger get logger => _logger;

  Future<Stream<UseCaseResponse>> buildUseCaseStream(UseCaseParams params);

  void execute(Observer<UseCaseResponse> observer, UseCaseParams params) {
    this.buildUseCaseStream(params).then(
          (value) => value.listen(
            (event) => observer.onNext(event),
            onDone: () => observer.onComplete(),
            onError: (error) => observer.onError(error),
          ),
        );
  }
}
