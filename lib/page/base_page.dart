import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_base/config/locator.dart';
import 'package:provider_base/model_view/base_model_view.dart';

class BasePage<T extends BaseModel> extends StatefulWidget {
  final Widget child;
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BasePage({this.child, this.builder, this.onModelReady});

  @override
  _BasePageState<T> createState() => _BasePageState<T>();
}

class _BasePageState<T extends BaseModel> extends State<BasePage<T>> {
  T model = locator<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
        child: Scaffold(
          body: widget.child,
        ),
//      child: Consumer<T>(builder: widget.builder),
    );
  }
}
