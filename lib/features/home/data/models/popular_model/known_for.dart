import 'package:equatable/equatable.dart';

class KnownFor extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? name;
  final String? originalName;
  final String? mediaType;
  final double? voteAverage;
  final String? releaseDate;
  final String? firstAirDate;

  const KnownFor({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalTitle,
    this.name,
    this.originalName,
    this.mediaType,
    this.voteAverage,
    this.releaseDate,
    this.firstAirDate,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,

      title: json['title'] as String?,
      originalTitle: json['original_title'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      mediaType: json['media_type'] as String?,
      voteAverage: (json['vote_average'] as num?)
          ?.toDouble(),
      releaseDate: json['release_date'] as String?,
      firstAirDate: json['first_air_date'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'name': name,
      'original_name': originalName,
      'media_type': mediaType,
      'vote_average': voteAverage,
      'release_date': releaseDate,
      'first_air_date': firstAirDate,
    };
  }

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      id,
      title,
      originalTitle,
      name,
      originalName,
      mediaType,
      voteAverage,
      releaseDate,
      firstAirDate,
    ];
  }
}
