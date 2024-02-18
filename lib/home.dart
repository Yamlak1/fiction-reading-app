// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/doc_model.dart';
import 'reader_screen.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 244, 250, 251),
    scaffoldBackgroundColor: Color.fromARGB(255, 244, 250, 251),
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 14, 134, 158)),
    cardColor: Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Color.fromARGB(255, 14, 134, 158)),
      bodyText2: TextStyle(color: Color.fromARGB(255, 14, 134, 158)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Color.fromARGB(255, 14, 134, 158),
    scaffoldBackgroundColor: Color.fromARGB(255, 14, 134, 158),
    appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 14, 134, 158)),
    cardColor: Colors.blueGrey[900],
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.white),
      bodyText2: TextStyle(color: Colors.white),
    ),
  );
}

class BookList extends StatelessWidget {
  final bool useCardLayout;
  final List<Document> filteredList;

  BookList({required this.useCardLayout, required this.filteredList});

  @override
  Widget build(BuildContext context) {
    return useCardLayout
        ? _buildCardLayout(context)
        : _buildDefaultLayout(context);
  }

  Widget _buildCardLayout(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final doc = filteredList[index];

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReaderScreen(doc),
                  ),
                );
              },
              child: Card(
                elevation: 5, // Set the elevation value
                color: Colors.orangeAccent, // Set the new color
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        doc.coverImageAsset ?? 'assets/default_cover_image.png',
                        width: 300,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            doc.doc_title!,
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${doc.page_num!} Pages",
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                              ),
                              Text(
                                doc.doc_date!,
                                style: GoogleFonts.nunito(
                                  fontSize: 10,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDefaultLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: filteredList
            .map(
              (doc) => Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),

                //elevation: 5, // Set the elevation value
                color: Theme.of(context).cardColor,

                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReaderScreen(doc),
                      ),
                    );
                  },
                  title: Text(
                    doc.doc_title!,
                    style: GoogleFonts.nunito(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${doc.page_num!} Pages",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 8),
                          Text(
                            doc.doc_date!,
                            style: GoogleFonts.nunito(
                              fontSize: 10,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: Image.asset(
                    doc.coverImageAsset ?? 'assets/default_cover_image.png',
                    width: 52,
                    height: 52,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
  bool isDarkMode = false;
  bool isSearchVisible = false;
  String searchName = '';

  @override
  Widget build(BuildContext context) {
    List<Document> filteredList = Document.doc_list
        .where((doc) =>
            doc.doc_title?.toLowerCase().contains(searchName.toLowerCase()) ??
            false)
        .toList();

    return Theme(
      data: isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                );
              },
            ),
            title: const Text('Book Reader'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Color.fromARGB(255, 14, 134, 158)
                        : Color.fromARGB(255, 244, 250, 251),
                  ),
                  child: Center(
                    child: Text(
                      'User name',
                      style: TextStyle(
                        color: isDarkMode
                            ? Color.fromARGB(255, 244, 250, 251)
                            : Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Switch Theme'),
                  onTap: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Search'),
                  onTap: () {
                    setState(() {
                      isSearchVisible = !isSearchVisible;
                      // Clear the search text when showing/hiding the search bar
                      searchName = '';
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Logout'),
                  onTap: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      // Navigate to the login page and prevent going back to the home page
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    } catch (e) {
                      print('Error logging out: $e');
                      // Handle logout error
                    }
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Column(
              children: [
                if (isSearchVisible)
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      fillColor: Color.fromARGB(255, 119, 159, 167),
                      filled: true,
                      labelText: 'Search Name',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return BookList(
                            useCardLayout: true, filteredList: filteredList);
                      } else {
                        return BookList(
                            useCardLayout: false, filteredList: filteredList);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
