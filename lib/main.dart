import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/firebase_options.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/routes.dart' as rt;
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotable_flutter/quotable_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  HydratedBlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final authenticationRepository = AuthenticationRepository();
      final quote = await Quotable.getRandom();
      await authenticationRepository.user.first;
      return runApp(
        App(authenticationRepository: authenticationRepository, quote: quote),
      );
    },
    blocObserver: AppBlocObserver(),
    createStorage: () async {
      WidgetsFlutterBinding.ensureInitialized();
      return HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getApplicationDocumentsDirectory(),
      );
    },
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required this.quote,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
              quote: quote,
            ),
          ),
          BlocProvider<SettingsCubit>(
            create: (context) => SettingsCubit(_authenticationRepository),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routeInformationParser: rt.Router.router.routeInformationParser,
      routerDelegate: rt.Router.router.routerDelegate,
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 2560,
        minWidth: 350,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(350, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(768, name: TABLET),
          const ResponsiveBreakpoint.resize(1024, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          // const ResponsiveBreakpoint.resize(350, name: PHONE),
          // const ResponsiveBreakpoint.autoScale(600, name: TABLET),
          // const ResponsiveBreakpoint.resize(1240, name: MOBILE),
          // const ResponsiveBreakpoint.autoScale(1440, name: DESKTOP),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      ),
    );
  }
}
