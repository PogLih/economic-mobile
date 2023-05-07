import 'package:economic/config/themeManager.dart';
import 'package:economic/config/localeProvider.dart';
import 'package:economic/config/themeProvider.dart';
import 'package:economic/data/repository/user_repository/user_repository.dart';
import 'package:economic/l10n/l10n.dart';
import 'package:economic/presentation/register/bloc/register_bloc.dart';
import 'package:economic/presentation/view/splash_page.dart';
import 'package:economic/presentation/view/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../../common/route.dart';
import '../../data/repository/authentication_repository/authentication_repository.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../authentication/bloc/authentication_state.dart';
import '../login/view/login_page.dart';
import 'home.dart';

class App extends StatefulWidget {
  const App(
      {Key? key,
      required this.userRepository,
      required this.authenticationRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    widget.authenticationRepository.dispose();
    super.dispose();
  }
  // @override
  // void initState() {
  //   Provider.of<LocaleProvider>(context, listen: false);
  //   super.initState();
  // }
  static final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => LocaleProvider()),
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
        Provider(
            create: (ctx) => AuthenticationBloc(
                authenticationRepository: widget.authenticationRepository,
                userRepository: widget.userRepository)),
        RepositoryProvider.value(
          value: widget.authenticationRepository,
          child: BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: widget.authenticationRepository,
              userRepository: widget.userRepository,
            ),
          ),
        ),
        RepositoryProvider.value(
          value: widget.userRepository,
          child: BlocProvider(
            create: (_) => RegisterBloc(
              userRepository: widget.userRepository,
            ),
          ),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (ctx, themeObject, _) {
        var localeProvider = Provider.of<LocaleProvider>(ctx);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dynamic Theme Demo',
          themeMode: themeObject.mode,
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          locale: localeProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: L10n.all,
          // localizationsDelegate:const [],
          onGenerateRoute: (_) => splashRoute(),
          navigatorKey: _navigatorKey,
          routes: routes,
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushNamedAndRemoveUntil(HomePage.routeName,(route) => false,);
                    break;
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushNamedAndRemoveUntil(
                      SplashPage.routeName,
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unknown:
                    _navigator.pushNamed(SplashPage.routeName);
                    break;
                }
              },
              child: child,
            );
          },
        );
      }
          // home: HomePage()),
          ),
    );
  }
}
