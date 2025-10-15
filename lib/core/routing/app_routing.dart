import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shoply_app/features/splash/presentation/screen/splash_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref){
  return GoRouter(routes: [
    GoRoute(path: "/",
        builder: (context, state)=>const SplashScreen()),
    /*GoRoute(path: "/login",
        builder: (context, state)=> LoginScreen()),
    GoRoute(path: '/user',
        builder: (context, state)=>UserScreen())*/
  ]);

});