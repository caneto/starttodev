import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:another_flushbar/flushbar.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final status = await FirebaseMessaging.instance.requestPermission();
  print(status.authorizationStatus);

  runApp(const MyApp());
}

Future<void> onBackgroundMessage(RemoteMessage message) async {
  print(message.data);
} 

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  int _counter = 0;

  String? token;


  @override
  void initState() {
    super.initState();

    initializeFcn();
  }

  Future<void> initializeFcn() async {
    token = await messaging.getToken(vapidKey: 'BPVEYAE0PEtOdzoVU7Wsxe_2XURjs-D1zvNwVP_XNtsenKsWLgOwX7mcyeQTOREUpG7mHQbiSa4lmB0aC2Ey8ao');
    print(token);

    setState(() {
      
    });

    if(!kIsWeb)  {
      messaging.subscribeToTopic('teste');
    }

    FirebaseMessaging.onMessage.listen((message) {
      if(message.notification != null) {
        Flushbar(
          message: message.notification!.body,
          messageColor: Colors.white,
          icon: Icon(
            Icons.info_outline,
            size: 28.0,
            color: Colors.blue[300],
          ),
          flushbarPosition: FlushbarPosition.BOTTOM,
          backgroundColor: Colors.black12,
          duration: const Duration(seconds: 8),
          leftBarIndicatorColor: Colors.blue[500],
          onTap: (_) {
            print('Toque em foreground: ${message.data}');
            //Navigator.of(context).pushNamed(message.data['route']);
          },
        ).show(context);
        
      }
      print('MENSAGEM RECEBIDA!!!! ${message.notification?.title}');
    });

    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    FirebaseMessaging.onMessageOpenedApp.listen((message) { 
      print('Toque em background: ${message.notification?.title}');
      //Navigator.of(context).pushNamed(message.data['route']);
    });

    final RemoteMessage? message = await messaging.getInitialMessage();
    if(message != null) {
      print('Toque em terminated: ${message.notification?.title}');
    }
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            if(token != null) 
              SelectableText(token!),    
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
