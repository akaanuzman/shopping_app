import 'package:provider/provider.dart';
import '../../nointernet/view/no_internet_view.dart';
import '../../../../product/component/text/headline6_text.dart';
import '../../../../product/manager/connectivity_manager.dart';

import '../../../../core/base/view/base_view.dart';
import '../viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/extensions/app_extensions.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<SplashViewModel>(
        viewModel: SplashViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
            Scaffold(
          backgroundColor: context.primaryColor,
          body: Consumer<ConnectivityManager>(
            builder: (context, model, child) {
              if (model.isOnline != null) {
                return model.isOnline!
                    ? _bodyView(context)
                    : const NoInternetView();
              }
              return Center(
                child: CircularProgressIndicator(
                  color: context.primaryColor,
                ),
              );
            },
          ),
        ),
      );

  Center _bodyView(BuildContext context) => Center(
        child: Headline6Text(context: context, data: 'Shopping App'),
      );
}
