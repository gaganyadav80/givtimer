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

void main() {
  HydratedBlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      // await Hive.initFlutter();
      // HiveHelper().activityDb = await Hive.openBox<Map<dynamic, dynamic>>(
      //   HiveHelper.DB_ACTIVITY_DATA,
      // );
      // IsarHelper().isar = await Isar.open(
      //   schemas: [
      //     DailyActivityDataSchema,
      //     DailyProductiveTimeSchema,
      //     ActivityLogSchema,
      //   ],
      //   directory:
      //       kIsWeb ? null : (await getApplicationDocumentsDirectory()).path,
      //   // inspector: true,
      // );

      // await HiveHelper().activityDb.clear();
      // await IsarHelper().isar.writeTxn((isar) => isar.clear());

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
            : await getApplicationDocumentsDirectory(),
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
