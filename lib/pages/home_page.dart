import 'package:flutter/material.dart';
import 'package:retrofitapi_flutter/base/base_page.dart';
import 'package:retrofitapi_flutter/pages/home_viewmodel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with MixinBasePage<HomeVM> {
  @override
  Widget build(BuildContext context) {
    return builder(() => Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${provider.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              provider.incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  @override
  HomeVM create() {
    return HomeVM();
  }

  @override
  void initialise(BuildContext context) {}
}
