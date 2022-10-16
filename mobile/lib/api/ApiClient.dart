import 'package:learning_api/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

var authentication = HttpBearerAuth();

ApiClient apiClient = ApiClient(
  basePath: dotenv.env['API_BASE_URL'],
  authentication: authentication
);