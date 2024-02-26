import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/counter_bloc.dart';

class MyBloc extends StatefulWidget {
  const MyBloc({super.key});

  @override
  State<MyBloc> createState() => _MyBlocState();
}

class _MyBlocState extends State<MyBloc> {



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
  create: (context) => CounterBloc(),
  child: MaterialApp(
      home: BlocHome()


    ),
);
  }


}
class BlocHome extends StatefulWidget {
  const BlocHome({super.key});

  @override
  State<BlocHome> createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Bloc State Management"),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
  builder: (context, counter) {
    return Text("$counter");
  },
),
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: (){
                BlocProvider.of<CounterBloc>(context).add(DecrementCounterEvent());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.minimize),
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: (){
       BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
              },

              child: const Icon(Icons.add),
            ),
          ],
        )
    );
  }
}

