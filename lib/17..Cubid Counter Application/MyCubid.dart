import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week2/17..Cubid%20Counter%20Application/Counter/counter_cubit.dart';

class MyCubid extends StatefulWidget {
  const MyCubid({super.key});

  @override
  State<MyCubid> createState() => _MyCubidState();
}

class _MyCubidState extends State<MyCubid> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          home: CubidHome()


      ),
    );

  }
}
class CubidHome extends StatefulWidget {
  const CubidHome({super.key});

  @override
  State<CubidHome> createState() => _CubidHomeState();
}

class _CubidHomeState extends State<CubidHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cubid State Management"),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterCubit, int>(
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
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.minimize),
            ),
            SizedBox(height: 10,),
            FloatingActionButton(
              onPressed: (){
                BlocProvider.of<CounterCubit>(context).increment();
              },

              child: const Icon(Icons.add),
            ),
          ],
        )
    );
  }
}
