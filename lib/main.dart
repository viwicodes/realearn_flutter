import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Relearn Flutter',
    theme: ThemeData(),
    home: const SplashScreen(),
  ));
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: Text(
//             'Relearning',
//             style: TextStyle(color: Colors.black38),
//           ),
//         ),
//         backgroundColor: Colors.blue[100],
//         elevation: 0,
//         leading: const Icon(
//           Icons.menu,
//           color: Colors.black38,
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.logout,
//               color: Colors.black38,
//             ),
//           )
//         ],
//       ),
//       body: Center(
//         child: Container(
//           height: 200,
//           width: 200,
//           decoration: BoxDecoration(
//               color: Colors.blue.shade100,
//               borderRadius: const BorderRadius.all(
//                 Radius.circular(50),
//               )),
//           child: IconButton(
//             onPressed: () {
//               Icon(Icons.favorite, color: Colors.black38,)
//             },
//             icon: const Icon(
//               Icons.favorite_border_sharp,
//               color: Colors.white,
//               size: 100,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

Color color = Colors.white;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Relearning',
            style: TextStyle(color: Colors.black38),
          ),
        ),
        backgroundColor: Colors.blue[100],
        elevation: 0,
        // leading: const Icon(
        //   Icons.menu,
        //   color: Colors.black38,
        // ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.black38,
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue[200],
        child: const Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 70,
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black45,
              ),
              title: Text(
                'H O M E',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black45,
              ),
              title: Text(
                'S E T T I N G S',
                style: TextStyle(color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.favorite_sharp,
              color: color,
              size: 100,
            ),
            onPressed: () {
              setState(
                () {
                  if (color == Colors.white) {
                    color = Colors.red[200]!;
                  } else {
                    color = Colors.white;
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
