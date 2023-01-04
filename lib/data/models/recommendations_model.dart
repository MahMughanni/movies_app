import 'package:movies_app/domain/entities/recommendation.dart';

class RecommendationsModel extends Recommendation {
  const RecommendationsModel({
    required super.id,
    super.backdropPath,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> fromJson) =>
      RecommendationsModel(
        id: fromJson['id'],
        backdropPath:
            fromJson['backdrop_path'] ?? "/fMkfImQS9ZRRQbsKfeORnpyLMNL.jpg",
      );
}
