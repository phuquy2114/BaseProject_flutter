import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../components/error_popup.dart';
import '../components/loading_popup.dart';
import 'base_viewmodel.dart';

mixin MixinBasePage<T extends BaseViewModel> {
  late T _provider;

  T get provider => _provider;

  @protected
  T create();

  @protected
  void initialise(BuildContext context);

  Widget builder(Widget Function() builder) =>
      ChangeNotifierProvider<T>(create: (context) {
        _provider = create();

        _provider.onShowLoading = () {
          LoadingPopup.show(context);
        };

        _provider.onHideLoading = () {
          Navigator.of(context).pop();
        };

        _provider.onShowError = (message) {
          ErrorPopup.show(context, message);
        };

        initialise(context);

        return _provider;
      }, child: Consumer<T>(
        builder: (context, provider, _) {
          _provider = provider;

          return VisibilityDetector(
              onVisibilityChanged: (info) {
                if (info.visibleFraction >= 1) {
                  try {
                    _provider.appear();
                  } catch (_) {}
                } else if (info.visibleFraction <= 0) {
                  try {
                    _provider.disAppear();
                  } catch (_) {}
                }
              },
              key: Key(T.toString()),
              child: GestureDetector(
                child: builder.call(),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ));
        },
      ));
}
