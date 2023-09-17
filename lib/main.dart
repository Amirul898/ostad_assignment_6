import 'package:flutter/material.dart';

void main() {
  runApp(const PhotoGalleryApp());
}

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhotoGalleryScreen(),
    );
  }
}

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

mysnakbar(msg, context){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:Text(msg))
  );
}


class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1601034913836-a1f43e143611?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
    'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1601034913836-a1f43e143611?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
    'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1601034913836-a1f43e143611?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
    'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
  ];

  final TextEditingController textController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Photo Gallery'),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mysnakbar("Photos Uploaded Successfully!" , context);
        },
        child: const Icon(Icons.cloud_upload),
      ),


      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            const Text(
              'Welcome to the Photo Gallery!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),


            const SizedBox(height: 16.0),


            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter your message',
                border: OutlineInputBorder(),
              ),
            ),


            const SizedBox(height: 16.0),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Image.network(imageUrls[index]),
                      const SizedBox(height: 4.0),
                      Text('Photo ${index + 1}'),
                    ],
                  ),
                );
              },
            ),

            
            const SizedBox(height: 16.0),
            const Text(
              'Sample Photos:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8.0),


            ListTile(
              leading: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                  width: 40, // Adjust the width to your preference
                  height: 40, // Adjust the height to your preference
                  fit: BoxFit.cover, // You can choose the BoxFit that fits your needs
                ),
              ),
              title: const Text('Photo 1'),
              subtitle: const Text('Description for photo 1'),
            ),

            ListTile(
              leading: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1601034913836-a1f43e143611?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1374&q=80',
                  width: 40, // Adjust the width to your preference
                  height: 40, // Adjust the height to your preference
                  fit: BoxFit.cover, // You can choose the BoxFit that fits your needs
                ),
              ),
              title: const Text('Photo 2'),
              subtitle: const Text('Description for photo 2'),
            ),


            ListTile(
              leading: ClipOval(
                child: Image.network(
                  'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
                  width: 40, // Adjust the width to your preference
                  height: 40, // Adjust the height to your preference
                  fit: BoxFit.cover, // You can choose the BoxFit that fits your needs
                ),
              ),
              title: const Text('Photo 3'),
              subtitle: const Text('Description for photo 3'),
            ),





            const SizedBox(height: 16.0),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
