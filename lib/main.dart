
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'FourthPage.dart';
import 'SecondPage.dart';
import 'FirstPage.dart';
import 'ThirdPage.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MyHomePage(title:"Главная страница"),
    ),
    GoRoute(
        path: "/page1",
        builder: (context, state) => FirstPage()
    ),
    GoRoute(
        path: "/page3",
        builder: (context, state) => ThirdPage()
    )
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    )
    ;

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text("HomePage"),

        ),
        body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(onPressed: () => context.go("/"), child: Text("Main Page")),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () => context.go("/page1"), child: Text("Page 1 (Маршрутная)")),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage())),
                    child: Text("Page 2 (Страничная)")),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () => context.go("/page3"), child: Text("Page 3 (Маршрутная)")),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FourthPage())),
                    child: Text("Page 4 (Страничная)"))
              ],
            )
        )
    );
  }
}
