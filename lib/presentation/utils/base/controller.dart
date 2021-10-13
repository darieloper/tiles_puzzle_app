import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BaseController extends GetxController {
  final Logger _logger;

  BaseController() : _logger = Logger();

  Logger get logger => _logger;
}
