import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/services/auth_repo.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:dio/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const FoodDelvery());
}

class FoodDelvery extends StatelessWidget {
  const FoodDelvery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepo(null)),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
      ),
    );
  }
}
