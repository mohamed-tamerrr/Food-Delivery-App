import 'package:food_delivery_app/features/auth/presentation/views/login_view.dart';
import 'package:food_delivery_app/features/auth/presentation/views/signup_view.dart';
import 'package:food_delivery_app/features/home/presentation/views/home_view.dart';

import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final String kSignUp = '/SignUp';
  static final String kHomeView = '/HomeView';
  static final String kProfileView = '/ProfileView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginView(),
      ),

      GoRoute(
        path: kSignUp,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
