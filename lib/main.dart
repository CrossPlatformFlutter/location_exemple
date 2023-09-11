
import 'package:flutter/material.dart';
import 'package:location/location.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Location App'),
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


Location _location=Location();
late LocationData _locationData;

Future<void> _getPosition() async{
  try{
    _locationData=await _location.getLocation();
  }catch(e){  
    print('$e');
  }
}

 @override
  void initState() {
    super.initState();
    _getPosition();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: const Icon(Icons.favorite),
      ),
      body: Center(child: Padding(padding: const EdgeInsets.all(15),child: 
      ElevatedButton(child: const Icon(Icons.local_activity),onPressed: (){
        showModalBottomSheet(context: context, builder:(BuildContext context){
          return Center(
            child: Column(children: [
              const Text("Location"),
              Text("Logitutde ${_locationData.longitude}"),
              Text("latitude ${_locationData.latitude}")
            ]),
          );
        });
      },),
      ),
      )
    );
  }
}
