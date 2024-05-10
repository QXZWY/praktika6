import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'FourthPage.dart';
import 'SecondPage.dart';
void popNavigator(context){
  if (Navigator().pages.length > 0) Navigator.pop(context);
}
class FirstPage extends StatelessWidget{

  @override
  Widget build (BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text("First Page"),
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