import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;  // Defining width
    return Scaffold(
      appBar: AppBar(
        title: Text("IT COMPANY"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            coverPicture(),
            nameCompany(),
            wordCompany(),
            message(),
            Divider(thickness: 1),
            sectionTitle("SECTORS"),
            allSectors(width),  // Pass width to allSectors
          ],
        ),
      ),
    );
  }

  Stack coverPicture() {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Image.asset(
          "images/cover3.jpg",
          height: 200,
        ),
        CircleAvatar(
          radius: 30,
          child: circleAvatar(80),
        ),
      ],
    );
  }

  CircleAvatar circleAvatar(double radius) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.black,
      backgroundImage: AssetImage("images/bird.jpeg"),
    );
  }

  Row nameCompany() {
    return Row(
      children: [
        Spacer(),
        Text(
          "6SOLUTIONS",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget wordCompany() {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        "Our Company allows you to promote your organization and improve your performance.",
        style: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Row message() {
    return Row(
      children: [
        Expanded(
          child: textFormField(),
        ),
        textButton(),
      ],
    );
  }

  TextFormField textFormField() {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        hintText: "New Message....",
        hintStyle: TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  TextButton textButton() {
    return TextButton.icon(
      onPressed: () => {},
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.normal,
        ),
      ),
      icon: const Icon(
        Icons.send,
        color: Colors.grey,
      ),
      label: const Text(''),
    );
  }

  Widget sectionTitle(String text) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget allSectors(double width) {
    Map<String, String> sectors = {
      "Robotic": "images/robotic.jpg",
      "Health": "images/health.jpg",
      "Education": "images/education.jpg",
      "Telecom": "images/telecom.jpg",
      "Energy": "images/energy.jpg",
      "Breeding": "images/breeding.jpg",
    };

    List<Widget> children = [];
    sectors.forEach((name, imagePath) {
      children.add(sectorsImage(name, imagePath, width));
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: children,
      ),
    );
  }

  Widget sectorsImage(String name, String imagePath, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),  // Space between the image and the text
        Text(
          name,
          style: TextStyle(
            color: Colors.black,

          ),
        ),
      ],
    );
  }
}
