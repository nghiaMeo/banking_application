import 'package:bank_app/features/auth/data/mappers/user_mapper.dart';
import 'package:bank_app/features/auth/data/models/auth_response_model.dart';
import 'package:bank_app/features/auth/domain/entities/auth_result_entity.dart';
import 'package:bank_app/features/auth/domain/entities/auth_tokens_entity.dart';

class AuthMapper {
  static AuthResultEntity toEntity(AuthResponseModel model) {
    return AuthResultEntity(
      tokens: AuthTokensEntity(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        tokenType: model.tokenType,
        expiresIn: model.expiresIn,
      ),
      user: UserMapper.toEntity(model.user),
    );
  }
}
