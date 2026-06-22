import 'package:absensi/helper/theme_data.dart';
import 'package:absensi/presentation/login/bloc/auth/login_bloc.dart';
import 'package:absensi/presentation/kasbon/bloc/kasbon_bloc.dart';
import 'package:absensi/presentation/kasbon/services/kasbon_services.dart';
import 'package:absensi/presentation/login/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:absensi/presentation/setting/bloc/profile_bloc/profile_bloc.dart';
import 'package:absensi/presentation/absensi/bloc/list_absen/llist_absensi_bloc.dart';
import 'package:absensi/presentation/login/pages/login_page.dart';
import 'package:absensi/presentation/absensi/services/absensi_service.dart';
import 'package:absensi/presentation/login/services/auth_service.dart';
import 'package:absensi/presentation/setting/services/profile_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localization/flutter_localization.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(AuthService()),
        ),
        BlocProvider(
          create: (_) => LlistAbsensiBloc(
            AbsensiService(),
          ),
        ),
        BlocProvider(
          create: (_) => ProfileBloc(ProfileServices(), AuthService()),
        ),
        BlocProvider(
          create: (_) => KasbonBloc(KasbonService()),
        ),
        BlocProvider(
          create: (_) => ForgotPasswordBloc(AuthService()),
        ),
      ],
      child: MaterialApp(
        supportedLocales: const [
          Locale('id'), // ⬅️ WAJIB setidaknya satu Locale
          Locale('en'), // (opsional sebagai fallback)
        ],
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          // ... app-specific localization delegate(s) here
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        navigatorObservers: [routeObserver],
        home: const LoginPage(),
        theme: AppTheme.lightTheme.copyWith(
          textTheme: AppTheme.lightTheme.textTheme.apply(
            fontFamily: _localization.fontFamily,
          ),
        ),
        locale: const Locale('id'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
      ),
    );
  }
}
