import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/home/data/models/popular_model/result.dart';

abstract class PopularPeopleState extends Equatable {
  const PopularPeopleState();

  @override
  List<Object> get props => [];
}

class PopularPeopleInitial extends PopularPeopleState {}

class PopularPeopleLoading extends PopularPeopleState {}

class PopularPeopleSuccess extends PopularPeopleState {
  final List<PersonModel> people;

  const PopularPeopleSuccess(this.people);

  @override
  List<Object> get props => [people];
}

class PopularPeopleError extends PopularPeopleState {
  final String message;

  const PopularPeopleError(this.message);

  @override
  List<Object> get props => [message];
}
