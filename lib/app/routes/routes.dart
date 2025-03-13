import 'package:e_election/data/model/candidates_respones_model.dart';
import 'package:e_election/ui/features/candidate/candidate_screen.dart';
import 'package:e_election/ui/features/candidate_details/candidate_details_screen.dart';
import 'package:e_election/ui/features/home/home_sccreen.dart';
import 'package:e_election/ui/features/on_boarding/on_boarding_screen.dart';
import 'package:e_election/ui/features/phone_verification/phone_verification_screen.dart';
import 'package:e_election/ui/features/scan_passport/scan_passport_screen.dart';
import 'package:e_election/ui/features/settings/settings_screen.dart';
import 'package:e_election/ui/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

/// [AppRouter]
/// This the base router classes where you can registered
/// and customize all the named routes of your app
class AppRouter {
  static GoRouter routerConfig() {
    return GoRouter(
      initialLocation: SplashScreen.routeName,
      routes: [
        GoRoute(
          path: SplashScreen.routeName,
          name: SplashScreen.routeName,
          builder: (context, state) => SplashScreen(),
        ),
        GoRoute(
          path: OnBoardingScreen.routeName,
          name: OnBoardingScreen.routeName,
          builder: (context, state) => OnBoardingScreen(),
        ),
        GoRoute(
          path: ScanPassportScreen.routeName,
          name: ScanPassportScreen.routeName,
          builder: (context, state) => ScanPassportScreen(),
        ),
        GoRoute(
          path: HomeScreen.routeName,
          name: HomeScreen.routeName,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: PhoneVerificationScreen.routeName,
          name: PhoneVerificationScreen.routeName,
          builder: (context, state) => PhoneVerificationScreen(
            passportNumber: state.extra as String,
          ),
        ),
        GoRoute(
          path: CandidateScreen.routeName,
          name: CandidateScreen.routeName,
          builder: (context, state) => CandidateScreen(),
        ),
        GoRoute(
          name: CandidateDetailsScreen.routeName,
          path: '/candidate-details', // Make sure this path matches
          builder: (context, state) {
            final candidate = state.extra as Candidate;
            return CandidateDetailsScreen(candidate: candidate);
          },
        ),
        GoRoute(
          path: SettingsScreen.routeName,
          name: SettingsScreen.routeName,
          builder: (context, state) => SettingsScreen(),
        ),
      ],
    );
  }
}
