import 'package:flutter/material.dart';
import 'package:tastebuds/model/post_model.dart';
import 'package:tastebuds/widgets/custom_scaffold.dart';
import './pages/home_page.dart';
import 'package:provider/provider.dart';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

import 'amplify_outputs.dart';
import 'model/amplify_objects/ModelProvider.dart';

final appTheme = ThemeData(
    // Define the default brightness and colors.
    colorScheme: ColorScheme(
  brightness: Brightness.light,
  primary: Colors.yellow[700]!,
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  secondary: Colors.white,
  error: Colors.red,
  onError: Colors.red,
  surface: Colors.white,
  onSurface: Colors.black,
));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final api = AmplifyAPI(
        options: APIPluginOptions(modelProvider: ModelProvider.instance));
    final cognito = AmplifyAuthCognito();
    await Amplify.addPlugins([api, cognito]);
    await Amplify.configure(amplifyConfig);

    safePrint('Successfully configured Amplify');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
        authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
          switch (state.currentStep) {
            case AuthenticatorStep.signIn:
              return CustomScaffold(
                state: state,
                // A prebuilt Sign In form from amplify_authenticator
                body: SignInForm(),
                // A custom footer with a button to take the user to sign up
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signUp,
                      ),
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              );
            case AuthenticatorStep.signUp:
              return CustomScaffold(
                state: state,
                // A prebuilt Sign Up form from amplify_authenticator
                body: SignUpForm(),
                // A custom footer with a button to take the user to sign in
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () => state.changeStep(
                        AuthenticatorStep.signIn,
                      ),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              );
            case AuthenticatorStep.confirmSignUp:
              return CustomScaffold(
                state: state,
                // A prebuilt Confirm Sign Up form from amplify_authenticator
                body: ConfirmSignUpForm(),
              );
            case AuthenticatorStep.resetPassword:
              return CustomScaffold(
                state: state,
                // A prebuilt Reset Password form from amplify_authenticator
                body: ResetPasswordForm(),
              );
            case AuthenticatorStep.confirmResetPassword:
              return CustomScaffold(
                state: state,
                // A prebuilt Confirm Reset Password form from amplify_authenticator
                body: const ConfirmResetPasswordForm(),
              );
            default:
              // Returning null defaults to the prebuilt authenticator for all other steps
              return null;
          }
        },
        child: MultiProvider(
          providers: [ChangeNotifierProvider(create: (context) => PostModel())],
          child: MaterialApp(
            theme: appTheme,
            builder: Authenticator.builder(),
            home: HomePage(),
          ),
        ));
  }
}
