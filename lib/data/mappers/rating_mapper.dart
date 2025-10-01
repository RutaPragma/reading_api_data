import 'package:lectura_datos_api/data/models/rating_model.dart';
import 'package:lectura_datos_api/domain/entities/entities.dart';

class RatingMapper {
  static RatingModel fromMap(Map<String, dynamic> map) {
    return RatingModel(
      rate: (map['rate'] as num).toDouble(),
      count: map['count'],
    );
  }

  static Map<String, dynamic> toMap(RatingModel? model) {
    return {'rate': model?.rate, 'count': model?.count};
  }

  static Rating toEntity(RatingModel model) {
    return Rating(rate: model.rate, count: model.count);
  }
}
