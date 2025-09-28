import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/utils/app_router.dart';
import 'package:food_delivery_app/features/home/data/cubit/popualr_cubit.dart';
import 'package:food_delivery_app/features/home/data/cubit/popualr_state.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    context.read<PopularPeopleCubit>().getPopularPeople();

    return Scaffold(
      appBar: AppBar(
        actions: [
          Hero(
            tag: 'profile',
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: () => GoRouter.of(
                context,
              ).push(AppRouter.kProfileView),
            ),
          ),
        ],
        title: const Text(
          'Popular People',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child:
            BlocBuilder<
              PopularPeopleCubit,
              PopularPeopleState
            >(
              builder: (context, state) {
                if (state is PopularPeopleInitial) {
                  return const Text(
                    'Fetching initial data...',
                  );
                }

                if (state is PopularPeopleLoading) {
                  return const Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Fetching data...'),
                      ),
                    ],
                  );
                }

                if (state is PopularPeopleSuccess) {
                  if (state.people.isEmpty) {
                    return const Text(
                      'No popular people found.',
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: state.people.length,
                    itemBuilder: (context, index) {
                      final person = state.people[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                        ),
                        child: ListTile(
                          title: Text(
                            person.name!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is PopularPeopleError) {
                  return Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Failed to load data: \n${state.message}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
      ),
    );
  }
}
