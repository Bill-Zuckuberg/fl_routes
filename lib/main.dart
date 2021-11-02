import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routes Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHome(),
        '/page2': (context) => const _PageTwo(),
        '/page3': (context) => const _PageThree()
      },
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to page 2'),
          onPressed: () {
            Navigator.pushNamed(context, '/page2');
          },
        ),
      ),
    );
  }
}

class _PageTwo extends StatelessWidget {
  const _PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Page 2'), elevation: 1.0, actions: <Widget>[
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.close))
      ]),
      body: Builder(
        builder: (BuildContext contex) => Center(
          child: ElevatedButton(
            child: const Text('Page 3'),
            onPressed: () {
              Navigator.pushNamed(context, '/page3').then((value) => {
                    if (value != null)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('You clicked: $value'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        ))
                      }
                  });
            },
          ),
        ),
      ),
    );
  }
}

class _PageThree extends StatelessWidget {
  const _PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 3'),
          elevation: 2.0,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(Icons.close))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  child: Text('1'),
                ),
                title: const Text('user1@examble.com'),
                onTap: () {
                  Navigator.pop(context, 'user1@examble.com');
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Text('2'),
                ),
                title: const Text('user2@examble.com'),
                onTap: () {
                  Navigator.pop(context, 'user2@examble.com');
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  child: Text('3'),
                ),
                title: const Text('user3@examble.com'),
                onTap: () {
                  Navigator.pop(context, 'user3@examble.com');
                },
              ),
              const Divider(),
              MaterialButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: const Text('Go home'),
              )
            ],
          ),
        ));
  }
}
