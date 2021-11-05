import 'package:flutter/material.dart';
import 'package:flutter_exercise_5/list_exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController idEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  Map<String, String> users = {'mugi': '1478', 'mogi': '2359', 'magi': '3727'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイトル', style: TextStyle(color: Color(0xffeeeeee), fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: idEditingController,
                decoration: const InputDecoration(labelText: 'ユーザーID', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20,),
              TextField(
                obscureText: true,
                controller: passwordEditingController,
                decoration: const InputDecoration(labelText: 'パスワード', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){

                  //問１： Mapの基本的な使い方が理解できていれば良い。
                  if(users[idEditingController.text] == passwordEditingController.text){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return const ListExercise();}));
                  }
                },
                child: const Text('ログイン', style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
