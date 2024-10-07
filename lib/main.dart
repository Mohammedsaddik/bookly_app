import 'package:bookly_app/Core/Utils/app_router.dart';
import 'package:bookly_app/Core/Utils/constants.dart';
import 'package:bookly_app/Core/Utils/service_locator.dart';
import 'package:bookly_app/Features/home/modelview/best_saller_books_cubit/best_saller_books_cubit.dart';
import 'package:bookly_app/Features/home/modelview/features_book_cubit/features_book_cubit.dart';
import 'package:bookly_app/Features/home/repos/home_repo_imp.dart';
import 'package:bookly_app/simnle_bloc_observable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(
          create: (context) => FeaturesBookCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => BestSallerBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchBestSallerdBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
