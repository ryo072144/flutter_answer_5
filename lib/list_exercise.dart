import 'package:flutter/material.dart';
import 'dart:math';

class ListExercise extends StatefulWidget {
  const ListExercise({Key? key}) : super(key: key);

  @override
  _ListExerciseState createState() => _ListExerciseState();
}

class _ListExerciseState extends State<ListExercise> {
  bool doesContain = false;

  //問２： TextFieldの入力を管理するウィジェット。
  TextEditingController numberEditingController = TextEditingController();

  List<int>? randomNumbers(){
    List<int> numbers = [];
    var rng = Random();
    for(int i=0; i<5; i++){
      numbers.add(rng.nextInt(10));
    }
    if(numbers[0]%2==0){
      return numbers;
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width/2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //問２： あらかじめ作ったTextEditingControllerのインスタンスを指定する。
              TextField(
                controller: numberEditingController,
                decoration: const InputDecoration(labelText: '入力', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){

                  //問３： numbersはnullになる可能性があるので、contains()を使う部分では、あらかじめその可能性を排除しておく。
                  List<int>? numbers = randomNumbers();
                  if(numbers!=null){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(

                        //問３： contains()を使って条件分岐。numberEditingController.textはString型なので、int型に変換する。
                        content: Text(
                            '$numbersは${numberEditingController.text}を'
                                +(numbers.contains(int.parse(numberEditingController.text))?'含みます':'含みません')
                        ),
                        actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('OK'))],
                      );
                    });
                  }else{
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        content: const Text(
                          'nullです'
                        ),
                        actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('OK'))],
                      );
                    });
                  }
                },
                child: const Text('表示', style: TextStyle(color: Colors.white),),
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
