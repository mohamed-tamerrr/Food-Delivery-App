import 'package:equatable/equatable.dart';

import 'known_for.dart';

class PersonModel extends Equatable {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final List<KnownFor>? knownFor;

  const PersonModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment:
          json['known_for_department'] as String?,
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,

      knownFor: (json['known_for'] as List<dynamic>?)
          ?.map(
            (e) => KnownFor.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props {
    return [
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      knownFor,
    ];
  }
}
