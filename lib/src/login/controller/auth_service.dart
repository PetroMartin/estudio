// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_pay/src/core/widgets/dialog/sin_coneccion_dialog.dart';
import 'package:easy_pay/src/login/views/olvido_su_contrasenha_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_pay/src/login/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String? apiUrl = dotenv.env['API_URL'];
  Future<UserModel> fetchPersonaFromAPI(int personaId) {
    print('fetchPersonaFromAPI');
    return http.get(Uri.parse('$apiUrl/personas/$personaId')).then((response) {
      return userModelFromJson(response.body);
    });
  }

  void createPersona(BuildContext context, UserModel persona) {
    http
        .post(Uri.parse('$apiUrl/personas'),
            headers: {"Content-Type": "application/json"},
            body: userModelToJson(persona))
        .then((response) {
      Navigator.pop(context);
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SinConeccionDialog();
        },
      );
      Navigator.pop(context);
      //Navigator.restorablePushNamed(context, OlvidoSuContrasenhaView.routeName);
      // Handle network or parsing errors
    });
  }

  void login(BuildContext context, UserModel persona) {
    http
        .post(
      Uri.parse('$apiUrl/usuario/login'),
      headers: {"Content-Type": "application/json"},
      body: userModelToJson(persona),
    )
        .then((response) {
      if (response.statusCode == 201) {
        // var responseBody = personaJsonFromJson(response.body);

        if (response.body.isNotEmpty) {
          // Successful login: navigate to another page
          Navigator.pushReplacementNamed(
              context, '/home'); // Replace with your route
        } else {
          // Failed login: show failure message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Login Failed"),
                content: Text("Incorrect username or password."),
                actions: <Widget>[
                  TextButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Handle other status codes or network errors
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Login Error"),
              content: Text("An error occurred. Please try again later."),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }).catchError((error) {
      // Handle network or parsing errors
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SinConeccionDialog();
        },
      );
    });
  }
}
