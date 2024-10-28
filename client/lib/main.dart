
import 'package:flutter/material.dart';
import "pages/LoginPage.dart";

// 

void main() {
  runApp(const MyApp());
}

// initiator to initiate whole system; load default page
class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do Blockchain',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


/*

// DEFAULT PAGE IS PAGE THAT DOES NOT GET TOUCHED.
class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  // override the createState method and let it create the state build
  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

// create a class to handle page states. The DefaultPage will reroute accordingly.
class _DefaultPageState extends State<DefaultPage> {


  void changePage(int index) {
    setState(() {
      if (logged_in) {
        page_index = index;
        current_page = page_names[page_index];
      } else if (!logged_in) {
        if (current_page == "Login Page") {
          LoginPage();
        } else if (current_page == "Signup Page") {
          SignupPage();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // for our page states; create dynamic crucial elements such as menu bar etc.
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.black,
        centerTitle : true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(current_page,
          textAlign: TextAlign.center,
          style : const TextStyle(
            color : Colors.white,
          ),
        ),
      ),

      // body will automatically reconstruct itself because it is mutatable by state.
      body: logged_in ? page_widgets[page_index] : (current_page == "Login Page" ? const LoginPage() : const SignupPage()),

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: const Color.fromARGB(255, 72, 72, 72),
        showSelectedLabels: true,
        iconSize: 8,
        selectedFontSize: 8,
        unselectedFontSize: 8,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        onTap: changePage,
        items : const [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage : AssetImage("lib/images/profile.png"),
              backgroundColor : null,
            ),
            label: "Profile",
            tooltip: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image : AssetImage("lib/images/inventory.png"),
              color : null,
            ),
            label: "Inventory",
            tooltip: "Inventory",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image : AssetImage("lib/images/to_do.png"),
              color : null,
            ),
            label: "To Do List",
            tooltip: "To Do List",
          ),
          BottomNavigationBarItem(
            icon: Image(
              image : AssetImage("lib/images/pets.png"),
              color : null,
            ),
            label: "Pets",
            tooltip: "Pets",
          ),
        ]
      ),
    );
  }
}
*/