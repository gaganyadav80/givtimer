import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givtimer/data/db_helper.dart';
import 'package:givtimer/firebase_options.dart';
import 'package:givtimer/logic/logic.dart';
import 'package:givtimer/routes.dart' as rt;
import 'package:givtimer/theme.dart';
import 'package:givtimer/utils/utils.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  HydratedBlocOverrides.runZoned(
    () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await Hive.initFlutter();
      DBHelper().db = await Hive.openBox<Map<dynamic, dynamic>>(
        DBHelper.DB_ACTIVITY_DATA,
      );

      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;
      return runApp(
        App(authenticationRepository: authenticationRepository),
      );
    },
    blocObserver: AppBlocObserver(),
    createStorage: () async {
      WidgetsFlutterBinding.ensureInitialized();
      return HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory(),
      );
    },
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(key: key);

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
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
    );
  }
}
