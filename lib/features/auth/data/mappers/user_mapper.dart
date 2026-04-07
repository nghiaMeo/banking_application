import 'package:bank_app/features/auth/data/models/user_model.dart';
import 'package:bank_app/features/auth/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      fullName: model.fullName,
      phone: model.phone,
    );
  }
}
