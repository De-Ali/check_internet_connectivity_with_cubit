import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/Internet cubit/internet_cubit.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                // TODO: implement listener
                if (state is InternetGainedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Internet Connected"),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is InternetLostState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Internet Not Connected"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return BlocBuilder<InternetCubit, InternetState>(
                    builder: (context, state) {
                  if (state is InternetGainedState) {
                    return const Text("Connected!");
                  } else if (state is InternetLostState) {
                    return const Text("Not Connected!");
                  } else {
                    return const Text("loading ...!");
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
