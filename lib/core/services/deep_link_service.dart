import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

class DeepLinkService {
  static const _channel = MethodChannel('com.example.movie_app/deep_link');

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // ✅ نفس الـ config بتاع MovieService
  static final _dio = Dio();
  static const _baseUrl = 'https://api.themoviedb.org/3';
  static const _apiKey = 'a9ad3393eba6ee3461adb160f3cfd2dd';

  static Future<void> initialize() async {
    // Cold start
    try {
      final initialLink = await _channel.invokeMethod<String>('getInitialLink');
      if (initialLink != null) {
        _logDeepLink('Cold start: $initialLink');
        await _navigate(initialLink);
      }
    } catch (e) {
      _logDeepLink('Error getting initial link: $e');
    }

    // Warm start
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'onDeepLink') {
        final uri = call.arguments as String?;
        if (uri != null) {
          _logDeepLink('Warm start: $uri');
          await _navigate(uri);
        }
      }
    });
  }

  static Future<void> _navigate(String rawUri) async {
    final uri = Uri.tryParse(rawUri);
    if (uri == null || uri.scheme != 'movieapptask') return;

    final context = navigatorKey.currentContext;
    if (context == null) return;

    switch (uri.host) {
      case 'open':
        _logDeepLink('→ Movies List');
        Navigator.pushNamed(context, '/movies');
        break;

      case 'details_screen':
        final movieId = uri.pathSegments.isNotEmpty
            ? int.tryParse(uri.pathSegments.first)
            : null;

        if (movieId != null) {
          _logDeepLink('→ Movie Details (id: $movieId)');

          final movie = await _fetchMovieById(movieId);
          if (movie == null) {
            _logDeepLink('→ Failed to fetch movie $movieId');
            return;
          }

          // ✅ نأخد الـ context تاني بعد الـ await عشان يكون valid
          final ctx = navigatorKey.currentContext;
          if (ctx == null) return;

          Navigator.pushNamed(ctx, '/movie-details', arguments: movie);
        }
        break;
    }
  }

  // ✅ Fetch حقيقي من TMDB
  static Future<MovieModel?> _fetchMovieById(int id) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/movie/$id',
        queryParameters: {'api_key': _apiKey, 'language': 'en-US'},
      );
      return MovieModel.fromJson(response.data);
    } catch (e) {
      _logDeepLink('Error fetching movie $id: $e');
      return null;
    }
  }

  static void dispose() {
    _channel.setMethodCallHandler(null);
  }

  static void _logDeepLink(String message) {
    if (kDebugMode) debugPrint('[DeepLink] $message');
  }
}
