import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/deep_link_service.dart';
import 'package:movies_app/core/services/notification_service.dart';
import 'package:movies_app/features/movie_details/presentation/view/movies_details_view.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/presentation/manager/cubit/movie_cubit.dart';
import 'package:movies_app/features/movies/presentation/view/movies_view.dart';
import 'package:movies_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize Notification Service
  await NotificationService().init();

  runApp(const MoviesApp());
}

class MoviesApp extends StatefulWidget {
  const MoviesApp({super.key});

  @override
  State<MoviesApp> createState() => _MoviesAppState();
}

class _MoviesAppState extends State<MoviesApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      DeepLinkService.initialize();
    });
  }

  @override
  void dispose() {
    DeepLinkService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: DeepLinkService.navigatorKey,
        home: const MoviesView(),
        routes: {'/movies': (context) => const MoviesView()},
        onGenerateRoute: (settings) {
          if (settings.name == '/movie-details') {
            final movie = settings.arguments as MovieModel;

            return MaterialPageRoute(
              builder: (context) => MoviesDetailsView(movie: movie),
            );
          }
          return null;
        },
      ),
    );
  }
}
