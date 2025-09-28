import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/home/data/cubit/popualr_state.dart';
import 'package:food_delivery_app/features/home/data/service/api_service.dart';

class PopularPeopleCubit extends Cubit<PopularPeopleState> {
  final PeopleService peopleService;

  PopularPeopleCubit({required this.peopleService})
    : super(PopularPeopleInitial());

  Future<void> getPopularPeople() async {
    emit(PopularPeopleLoading());

    try {
      final people = await peopleService
          .fetchPopularPeople();

      emit(PopularPeopleSuccess(people));
    } catch (e) {
      emit(PopularPeopleError(e.toString()));
    }
  }
}
