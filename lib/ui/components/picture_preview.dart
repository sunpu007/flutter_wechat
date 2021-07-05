import 'package:flutter/material.dart';

class PicturePreviewComponent extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const PicturePreviewComponent({Key? key, required this.imagePath, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Hero(
        tag: this.imagePath,
        child: this.child,
      ),
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (ctx, animation, animation2) {
            return FadeTransition(
              opacity: animation,
              child: PicturePreviewPage(imageURL: this.imagePath,),
            );
          }
        ));
      },
    );
  }
}

class PicturePreviewPage extends StatelessWidget {
  final String imageURL;

  const PicturePreviewPage({Key? key, required this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: imageURL,
            child: Image.network(
              this.imageURL,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          )
        ),
      ),
    );
  }
}

