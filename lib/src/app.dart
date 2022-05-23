import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_classroom/src/core/flavors/flavor_config.dart';
import 'package:flutter_classroom/src/core/navigator/router_navigator.dart';
import 'package:flutter_classroom/src/core/services/http_client_impl.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/repository/currency_repository_impl.dart';
import 'package:flutter_classroom/src/features/currency_converter/data/services/currency_service_impl.dart';
import 'package:flutter_classroom/src/features/currency_converter/presentation/business_logic_objects/currency_bloc.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CurrencyBloc>(
          create: (BuildContext context) => CurrencyBloc(
            repository: CurrencyRepositoryImpl(
              service: CurrencyServiceImpl(
                client: HttpClientImpl(
                  client: http.Client(),
                  authority: FlavorConfig.instance.values.baseUrl,
                ),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Currency Converter',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        onGenerateRoute: RouterNavigator.generateRoute,
        initialRoute: RouterNavigator.initialRoute,
      ),
    );
  }
}
