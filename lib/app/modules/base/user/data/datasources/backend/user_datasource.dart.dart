import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

// import '../../../../../../shared/constants/backend_services_constants.dart'
//     as backend_services_constants;
import '../../../../../../shared/models/user_model.dart';
import '../../../domain/entities/user_result.dart';
import '../../../domain/errors/user_errors.dart';
import '../../../infra/datasources/backend/i_user_datasource.dart';
import '../../../infra/models/user_result_model.dart';

part 'user_datasource.dart.g.dart';

@Injectable(singleton: false)
class UserDatasource implements IUserDatasource {
  final Dio dio;

  UserDatasource(this.dio);

  @override
  Future<UserResult> register(UserResult userResult) async {
    try {
      var response = await dio.post(
        '', //backend_services_constants.usersUrl,
        data: userResult.user.toJson(),
      );

      var user = UserModel.fromMap(response.data);
      var resultModel = UserResultModel(user: user);
      return resultModel;
    } on Exception catch (_) {
      throw UserServerError();
    }
  }
}
