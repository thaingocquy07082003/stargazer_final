import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stargazer/features/login/presentation/bloc/login_bloc.dart';
import 'package:stargazer/core/core.dart';

class LoginContainer extends StatelessWidget {
  LoginContainer({super.key});

  late LoginBloc _loginBloc;
  late UserProvider _userProvider;

  @override
  Widget build(BuildContext context) {
    _loginBloc = context.read<LoginBloc>();
    _userProvider = context.read<UserProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.coal(1.0),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSignUpBtnPressed) {
            Navigator.popAndPushNamed(
              context,
              RouteConstants.register,
              arguments: {
                'id': null,
              },
            );
          }
          if (state.emailSuccess || state.googleSuccess || state.guestSuccess) {
            _userProvider.setUser(state.user);
            print('đang tới home');
            Navigator.popAndPushNamed(
              context,
              RouteConstants.home,
            );
          }
          if (state.emailFailure || state.googleFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Login failed')),
            );
          }
          if (state.googleUserNotFound) {
            Navigator.popAndPushNamed(
              context,
              RouteConstants.register,
              arguments: {
                'id': state.id,
                'email': state.email,
              },
            );
          }
        },
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 90,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo(),
                  SizedBox(height: 16),
                  _buildLoginForm(),
                  SizedBox(height: 16),
                  Text('Sign in as guest',
                      style: AppTexts.SFProRegular(
                          color: AppColors.rice(0.5), fontSize: 16)),
                  SizedBox(height: 16),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      _loginBloc.add(LoginEvent.guestSignIn());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildSignUpBtn(
                    () {
                      context.read<LoginBloc>().add(LoginEvent.signUp());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        ClipOval(
          child: Image.asset(
            'lib/assets/images/logo/stargazer logo - gradient.png',
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                AppColors.rice(1.0),
                AppColors.gradientBlue(1.0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: Text(
            'StarGazer',
            style: AppTexts.SFProLight(fontSize: 32),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return SizedBox(
      width: 320,
      child: Column(
        children: [
          Text(
            'Log in',
            style:
                AppTexts.SFProRegular(color: AppColors.rice(1.0), fontSize: 24),
          ),
          const SizedBox(height: 12),
          TextField(
            onChanged: (value) {
              _loginBloc.add(LoginEvent.emailChanged(value));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.coalLight(1.0),
              hintText: 'Email',
              hintStyle: AppTexts.SFProRegular(
                  color: AppColors.rice(0.5), fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            onChanged: (value) {
              _loginBloc.add(LoginEvent.passwordChanged(value));
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.coalLight(1.0),
              hintText: 'Password',
              hintStyle: AppTexts.SFProRegular(
                  color: AppColors.rice(0.5), fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              _loginBloc.add(LoginEvent.loginButtonPressed());
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: AppColors.rice(1.0),
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            child: Text(
              'Continue',
              style: AppTexts.SFProSemibold(
                  color: AppColors.coal(1.0), fontSize: 16),
            ),
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: () {
              _loginBloc.add(LoginEvent.onGoogleLoginPressed());
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: AppColors.coalLight(1.0)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              fixedSize: const Size.fromHeight(48),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/google_logo.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Continue with Google',
                  style: AppTexts.SFProRegular(
                      color: AppColors.rice(1.0), fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSignUpBtn(void Function() onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?',
              style: AppTexts.SFProRegular(
                  color: AppColors.rice(0.5), fontSize: 16)),
          const SizedBox(width: 8),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [AppColors.rice(1.0), AppColors.gradientBlue(1.0)],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Text(
              'Sign up now!',
              style: AppTexts.SFProMedium(
                  color: AppColors.rice(1.0), fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
