import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getintro/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  final valueController = ValueController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<ValueController>(
                init: valueController,
                builder: (ctrl) {
                    return 
                      Text(
                            'Valor definido : ${ctrl.definedValue}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                },
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: textController,
              ),
            ),

            // Botão para navegação
            GetX<ValueController>(
                init: valueController,
                builder: (ctrl) {
                    return ctrl.isLoading.value
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () {
                            String value = textController.text;
                            
                            valueController.setValue(value);
                        
                            print(value);
                          },
                          child: const Text('Confirmar'),
                        );
                },
              
            ),
          ],
        ),
      ),
    );
  }
}

class DataScreen extends StatelessWidget {
  DataScreen({Key? key}) : super(key: key);

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Definição de dado'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de definição de valor
            TextField(
              controller: textController,
            ),

            // Espaçamento
            const SizedBox(height: 10),

            // Botão para voltar passando o valor
            ElevatedButton(
              onPressed: () {

                final value = textController.text;

                //Navigator.of(context).pop();
                Get.back(result: value);
              },
              child: const Text('Retornar'),
            ),
          ],
        ),
      ),
    );
  }
}
