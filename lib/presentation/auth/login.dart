import 'package:kunke_naturals_admin_app/core/mixins/form_mixin.dart';
import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/widgets/buttons/style1.dart';
import 'package:kunke_naturals_admin_app/core/widgets/image.dart';
import 'package:kunke_naturals_admin_app/core/widgets/textfield/textfield.dart';
import 'package:kunke_naturals_admin_app/presentation/auth/components/auth_components.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/context.dart';
import 'package:kunke_naturals_admin_app/core/utils/validators.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../core/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with FormMixin {
  // EmailAuth emailAuth = EmailAuth(sessionName: "Email Verification");

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Insets.xl),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(context.getHeight(.15)),
                  AuthComponents().compoTexts(
                    context,
                    "Hello again!",
                    "Welcome back, you’ve missed a lot!",
                  ),
                  const Gap(Insets.xl),
                  TextInputField(
                    controller: emailController,
                    hintText: "Email address",
                    labelText: "Email address",
                    // initialValue: LocalDb.email,
                    inputType: TextInputType.emailAddress,
                    prefixIcon: LocalSvgIcon(Assets.icons.bulk.sms),
                    validator: (input) => Validators.validateEmail(input),
                  ),
                  const Gap(Insets.md),
                  TextInputField(
                    controller: passwordController,
                    hintText: "Password",
                    labelText: "Password",
                    obscureText: isObscure,
                    validator: (input) => Validators.validatePassword()(input),
                    prefixIcon: LocalSvgIcon(Assets.icons.bulk.lock1),
                    suffixIcon: LocalSvgIcon(
                      isObscure
                          ? Assets.icons.linear.eye
                          : Assets.icons.bulk.eyeSlash,
                    ).onTap(() {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    }),
                  ),
                  const Gap(Insets.xl),
                  auth.isLoading
                      ? const LoadingButton()
                      : ButtonOne(
                          action: () async {
                            if (formKey.currentState!.validate()) {
                              auth.signInWithEmailAndPassword(
                                context,
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                            }
                          },
                          label: "Sign in"),
                  const Gap(Insets.md),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
