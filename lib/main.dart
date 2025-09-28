import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/features/home/data/cubit/popualr_cubit.dart';
import 'package:food_delivery_app/features/home/data/service/api_service.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:food_delivery_app/features/auth/data/cubit/auth_cubit/auth_cubit.dart';

import 'package:dio/dio.dart';

late final PeopleService peopleService;
late final Dio dio;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  dio = Dio();
  peopleService = PeopleService(dio: dio);
  runApp(const FoodDelvery());
}

class FoodDelvery extends StatelessWidget {
  const FoodDelvery({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),

        BlocProvider(
          create: (context) => PopularPeopleCubit(
            peopleService: peopleService,
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
      ),
    );
  }
}
