import 'package:tv_movice/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
          backdropPath: json['backdrop_path'] ?? '/aAgGrfBwna1nO4M2USxwFgK5O0t.jpg',
          id: json['id'],
      );

}