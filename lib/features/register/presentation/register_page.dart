import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stargazer/core/services/data/services/firebase_reference.dart';
import 'package:stargazer/core/services/data/services/save_sharedprefs_usecase.dart';
import 'package:stargazer/features/register/data/respitories/register_respository_impl.dart';
// import 'package:stargazer/features/register/data/services/register_firebase.dart';
import 'package:stargazer/features/register/domain/usecases/email_check_verification.dart';
import 'package:stargazer/features/register/domain/usecases/register_email_usecase.dart';
import 'package:stargazer/features/register/domain/usecases/register_google_usecase.dart';
import 'package:stargazer/features/register/presentation/bloc/register_bloc.dart';
import 'package:stargazer/features/register/presentation/register_container.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stargazer/features/register/domain/usecases/user_create_usecase.dart';
import 'package:stargazer/features/register/domain/usecases/email_verification.dart';
// import 'package:stargazer/features/register/domain/usecases/fields_validation_usecase.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = getRouteId(context);
    return BlocProvider(
      create: (context) => RegisterBloc(
        id: id,
        emailCheckVerificationUsecase: EmailCheckVerificationUsecase(
          // firebaseAuth: FirebaseAuth.instance,
        ),
        registerGoogleUsecase: RegisterGoogleUsecase(
          googleSignIn: GoogleSignIn(),
          // firebaseAuth: FirebaseAuth.instance,
        ),
        registerEmailUsecase: RegisterEmailUsecase(
          // firebaseAuth: FirebaseAuth.instance,
        ),
        userCreateUsecase: UserCreateUsecase(
          registerRepository: RegisterRepositoryImpl(
            // registerFirebase: RegisterFirebase(
            //   firebaseReference: FirebaseReference(),
            // ),
          ),
        ),
        emailVerificationUsecase: EmailVerificationUsecase(
          // firebaseAuth: FirebaseAuth.instance,
        ),
        saveSharedPrefsUsecase: SaveSharedPrefsUsecase(),
      ),
      child: RegisterContainer(),
    );
  }

  String? getRouteId(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    if (routeArgs is String) {
      return routeArgs;
    }
    if (routeArgs is Map<String, String>) {
      return routeArgs['id'];
    }
    return null;
  }
}
