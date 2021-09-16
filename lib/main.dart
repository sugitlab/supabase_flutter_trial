import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
    url: 'https://qduzbkpvosaiyhvpupuk.supabase.co', //'SUPABASE_URL',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzMTcxMTg4MCwiZXhwIjoxOTQ3Mjg3ODgwfQ.ZPvvK7lqx7xJ3iCof5s2xQJ72YJBegukvAhAs7EKpB8', //'SUPABASE_ANNON_KEY',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Trial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Supabase Trial'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Supabase Email Auth',
            ),
            ElevatedButton(
              child: const Text('Email'),
              onPressed: () => {
                supabaseSignUp('sugitlab@gmail.com', '12345678'),
              },
            ),
          ],
        ),
      ),
    );
  }
}

void supabaseSignin(String email, String password) async {
  final res = await Supabase.instance.client.auth
      .signIn(email: email, password: password);
  if (res.error != null) {
    print('error');
    print(res.error?.message);
  } else {
    print('success');
  }
}

void supabaseSignUp(String email, String password) async {
  final res = await Supabase.instance.client.auth.signUp(email, password);
  if (res.error != null) {
    print('error, signup');
    print(res.error?.message);
    // A user with this email address has already been registered": email-in-use
  } else {
    print('success, signup');
  }
}
