import 'package:easy_pay/src/app_theme.dart';
import 'package:easy_pay/src/home/views/home_view.dart';
import 'package:easy_pay/src/login/views/login_view.dart';
import 'package:easy_pay/src/login/views/olvido_su_contrasenha_view.dart';
import 'package:easy_pay/src/login/views/register_view.dart';
import 'package:easy_pay/src/pago_qr/views/scanear_qr_view.dart';
import 'package:easy_pay/src/sample_feature/sample_item_details_view.dart';
import 'package:easy_pay/src/settings/settings_controller.dart';
import 'package:easy_pay/src/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case RegisterView.routeName:
                    return const RegisterView();
                  case OlvidoSuContrasenhaView.routeName:
                    return const OlvidoSuContrasenhaView();
                  case HomeView.routeName:
                    return const HomeView();
                  case ScanerarQRView.routeName:
                    return const ScanerarQRView();
                  case LoginView.routeName:
                  default:
                    return const LoginView();
                }
              },
            );
          },
          theme: AppTheme.getTheme(settingsController.theme),
        );
      },
    );
  }
}
