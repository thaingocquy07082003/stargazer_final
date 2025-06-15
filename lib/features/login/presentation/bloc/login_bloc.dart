import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stargazer/core/services/data/models/user.dart';
import 'package:stargazer/core/services/data/services/remove_sharedprefs_usecase.dart';
import 'package:stargazer/core/services/data/services/save_sharedprefs_usecase.dart';
import 'package:stargazer/features/login/domain/usecase/login_email_usecase.dart';
import 'package:stargazer/features/login/domain/usecase/login_google_usecase.dart';
import 'package:stargazer/features/login/domain/usecase/login_sharedprefs_usecase.dart';
import 'package:stargazer/features/login/domain/usecase/user_get_usecase.dart';
import 'package:stargazer/core/services/data/datasources/remote/login_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginGoogleUsecase loginGoogleUsecase;
  final LoginEmailUsecase loginEmailUsecase;
  final LoginSharedPrefsUsecase loginSharedPrefsUsecase;
  final SaveSharedPrefsUsecase saveSharedPrefsUsecase;
  final RemoveSharedPrefsUsecase removeSharedPrefsUsecase;
  final UserGetUsecase userGetUsecase;

  LoginBloc({
    required this.userGetUsecase,
    required this.removeSharedPrefsUsecase,
    required this.loginGoogleUsecase,
    required this.loginEmailUsecase,
    required this.loginSharedPrefsUsecase,
    required this.saveSharedPrefsUsecase,
  }) : super(const LoginState(loading: false)) {
    on<_OnInitial>((event, emit) async {
      await _onInitial(event, emit);
    });

    on<_LoginButtonPressed>((event, emit) async {
      await _onLoginButtonPressed(event, emit);
    });

    on<_OnGoogleLoginPressed>((event, emit) async {
      await _onGoogleLoginPressed(event, emit);
    });

    on<_SignUp>((event, emit) async {
      emit(state.copyWith(isSignUpBtnPressed: true));
    });

    on<_EmailChanged>((event, emit) async {
      emit(state.copyWith(email: event.email));
    });

    on<_PasswordChanged>((event, emit) async {
      emit(state.copyWith(password: event.password));
    });

    on<_GuestSignIn>((event, emit) async {
      await _onGuestSignIn(event, emit);
    });

    on<_ResetError>((event, emit) {
      emit(state.copyWith(errorMessage: ''));
    });

    add(const LoginEvent.onInitial());
  }

  Future<void> _onInitial(
    _OnInitial event,
    Emitter<LoginState> emit,
  ) async {
    // await removeSharedPrefsUsecase();
    final user = await loginSharedPrefsUsecase();
    if (user != null) {
      emit(state.copyWith(user: user, googleSuccess: true));
    } else {
      emit(state.copyWith(loading: false));
    }
  }

  Future<void> _onLoginButtonPressed(
    _LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(
          state.copyWith(loading: true, errorMessage: '', emailFailure: false));
      final response = await loginEmailUsecase(state.email, state.password);

      if (response['user'] == null) {
        emit(state.copyWith(
          emailFailure: true,
          errorMessage: response['message'] ?? 'Đăng nhập thất bại',
          loading: false,
        ));
        return;
      }

      final user = response['user'];
      if (user is! UserInfo) {
        emit(state.copyWith(
          emailFailure: true,
          errorMessage: 'Dữ liệu người dùng không hợp lệ',
          loading: false,
        ));
        return;
      }

      emit(state.copyWith(user: user));
      await saveSharedPrefsUsecase(user.token, user.name,user.email);
      emit(state.copyWith(
        emailSuccess: true,
        emailFailure: false,
        loading: false,
      ));
    } catch (e) {
      print('Login error: $e');
      emit(state.copyWith(
        emailFailure: true,
        errorMessage: e.toString(),
        loading: false,
      ));
    }
  }

  Future<void> _onGoogleLoginPressed(
    _OnGoogleLoginPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      final userId = await loginGoogleUsecase();
      emit(state.copyWith(id: userId['id']!, email: userId['email']!));
      final user = await userGetUsecase();
      if (user == null) {
        emit(state.copyWith(googleUserNotFound: true));
      } else {
        emit(state.copyWith(user: user));
        await saveSharedPrefsUsecase(user.token, user.name,user.email);
        emit(state.copyWith(googleSuccess: true));
      }
    } catch (e) {
      emit(state.copyWith(googleFailure: true));
    }
  }

  Future<void> _onGuestSignIn(
    _GuestSignIn event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(loading: true));
      // Create a guest user
      final guestUser = UserInfo(
        id: 'guest_${DateTime.now().millisecondsSinceEpoch}',
        name: 'Guest User',
        email: 'guest@example.com',
        token: 'guest_token',
        role: 'user',
      );

      emit(state.copyWith(user: guestUser));
      await saveSharedPrefsUsecase(guestUser.token, guestUser.name,guestUser.email);
      emit(state.copyWith(guestSuccess: true));
    } catch (e) {
      emit(state.copyWith(googleFailure: true));
    } finally {
      emit(state.copyWith(loading: false));
    }
  }
}
