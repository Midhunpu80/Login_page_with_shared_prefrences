import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_flutter/Loginpage.dart';
import 'package:loginpage_flutter/log2.dart';
import 'package:loginpage_flutter/newpages/p1.dart';
import 'package:loginpage_flutter/newpages/p3.dart';
import 'package:loginpage_flutter/newpages/p4.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_typing_uninitialized_variables///

class Log1 extends StatefulWidget {
  Log1({super.key});

  var obs = true;

  @override
  State<Log1> createState() => _Log1State();
}

class _Log1State extends State<Log1> {
  var sam = true;
  List contact = [
    "Midhun",
    "Athul",
    "Abinav",
    "billie ellish",
    "sarang",
    "shamil",
    "sebih"
        "lokesh",
    "vikram",
    "dilli",
    "rolex"
  ];
  List imaged = [
    "images/midhun.jpg",
    "images/athul.jpg",
    "images/abhinav.jpg",
    "images/cat.jpg",
    "images/sarang.jpg",
    "images/athul.jpg",
    "images/abhinav.jpg",
    "images/cat.jpg",
    "images/sarang.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            /////floating acrion button////////////////////////
            floatingActionButton: FloatingActionButton(
                backgroundColor: const Color.fromARGB(255, 240, 7, 182),
                onPressed: () => sheet(context),
                // ignore: sort_child_properties_last
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                shape: const StadiumBorder()),

            ///drawer /////////////////////////////////////////////////////
            drawer: Drawer(
              child: ListView(
                children: const [
                  UserAccountsDrawerHeader(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 255, 0, 85)),
                    accountName: Text("Midhunpu"),
                    accountEmail: Text("midhunpu@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/mdn.jpg")),
                  )
                ],
              ),
            ),

            ///appbar ////////////////////////////////
            appBar: AppBar(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              centerTitle: true,
              title: const Text(
                "MDX",
                style: TextStyle(fontSize: 30),
              ),
              actions: [
                IconButton(
                    onPressed: () => sample(context),
                    icon: const Icon(Icons.logout_outlined))
              ],
              toolbarHeight: 100,
              backgroundColor: const Color.fromARGB(255, 255, 0, 166),
            ),

            /////////appbar   end /////////////////////////////////////
            body: Container(
              child: Container(
                child: ListView.builder(
                  itemCount: imaged.length,
                  itemBuilder: (context, index) => Card(
                    child: Container(
                        height: 80,
                        width: 100,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: ListTile(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const log2())),
                          title: Text("${contact[index]}"),
                          subtitle: const Text(
                            "Hey iam using MDx",
                            style: TextStyle(
                                color: Color.fromARGB(255, 142, 186, 142)),
                          ),
                          ////////////////////////trailing //////////////////////////////////////////////////////////////////////
                          trailing: TextButton(
                            onPressed: () => print("name"),
                            child: Text(
                              "10$index:20am",
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 255, 8)),
                            ),
                          ),

                          /////////////////////leading ////////////////////////////////
                          leading: index.isEven
                              ? CircleAvatar(
                                  backgroundImage: AssetImage(imaged[index]))
                              : Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      Image(image: AssetImage(imaged[index])),
                                ),
                        )),
                  ),
                ),
              ),
            )));
  }
  ////////////show dialog ///////////////////////////////////////////////////

  void sample(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Logout"),
              actions: [
                TextButton(
                  onPressed: () async {
                    final sharep = await SharedPreferences.getInstance();
                    sharep.clear();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Loginpage()));
                  },
                  child: const Text(
                    "yes",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("no"))
              ],
            ));
  }

///////bottom model sheet /////////////////////////////////////////////
  void sheet(BuildContext context) {
    showModalBottomSheet(
        context: (context),
        builder: ((context) => Container(
              height: 800,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  contain(
                    colo: Colors.red,
                  ),
                  contain(
                    colo: Colors.blue,
                  ),
                  contain(
                    colo: Colors.pink,
                  ),
                  contain(
                    colo: Colors.yellow,
                  ),
                ],
              ),
            )));
  }
}

//"https://scontent-tir2-1.cdninstagram.com/v/t51.2885-19/328079513_916998092814876_8222248890800626552_n.jpg?stp=dst-jpg_s320x320&_nc_ht=scontent-tir2-1.cdninstagram.com&_nc_cat=100&_nc_ohc=PDL9KK0gp4sAX9ZIzp4&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AfDVebV8ExgSJlMr8EARmr6WCFbvlrR2dWaui7zQ7Tix-g&oe=63E76F1B&_nc_sid=8fd12b"
// ignore: must_be_immutable
class contain extends StatelessWidget {
// ignore: prefer_typing_uninitialized_variables
  var colo;
  var im;

  contain({this.colo, this.im}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      height: 50,
      width: 10,
      color: colo,
    );
  }
}
