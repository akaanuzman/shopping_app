import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../home/view/home_view.dart';
import '../../../../product/component/button/special_button.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../product/manager/connectivity_manager.dart';
import '../viewmodel/no_internet_view_model.dart';
import '../../../../core/extensions/app_extensions.dart';
import '../../../../product/component/text/subtitle1_text.dart';

class NoInternetView extends StatelessWidget {
  static const path = '/nointernet';
  const NoInternetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BaseView<NoInternetViewModel>(
        viewModel: NoInternetViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, NoInternetViewModel viewModel) =>
            Scaffold(
          backgroundColor: context.primaryColor,
          body: Consumer<ConnectivityManager>(
            builder: (context, model, child) {
              if (model.isOnline != null) {
                return model.isOnline!
                    ? const HomeView()
                    : _bodyView(context, viewModel);
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

  FlipInX _bodyView(BuildContext context, NoInternetViewModel viewModel) =>
      FlipInX(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Subtitle1Text(
                data: 'Please check your internet connection.',
                context: context,
              ),
            ),
            context.emptySizedHeightBoxLow2x,
            SpecialButton(
              context: context,
              onTap: viewModel.goToOnBoard,
            )
          ],
        ),
      );
}
