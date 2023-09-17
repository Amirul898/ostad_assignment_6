import 'package:flutter/material.dart';

void main() {
  runApp(PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatefulWidget {
  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

mysnakbar(msg, context){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:Text(msg))
  );
}


class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final List<String> imageUrls = [
    'https://example.com/image1.jpg',
    'https://example.com/image2.jpg',
    'https://example.com/image3.jpg',
    'https://example.com/image4.jpg',
    'https://example.com/image5.jpg',
    'https://example.com/image6.jpg',
  ];

  final TextEditingController textController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Photo Gallery'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mysnakbar("Photos Uploaded Successfully!" , context);
        },
        child: Icon(Icons.cloud_upload),
      ),


      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Text(
              'Welcome to the Photo Gallery!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),


            SizedBox(height: 16.0),


            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter your message',
                border: OutlineInputBorder(),
              ),
            ),


            SizedBox(height: 16.0),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.network(imageUrls[index]),
                      SizedBox(height: 4.0),
                      Text('Image ${index + 1}'),
                    ],
                  ),
                );
              },
            ),

            
            SizedBox(height: 16.0),
            Text(
              'Sample Photos:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Sample Photo 1'),
              subtitle: Text('Subtitle 1'),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Sample Photo 2'),
              subtitle: Text('Subtitle 2'),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Sample Photo 3'),
              subtitle: Text('Subtitle 3'),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
