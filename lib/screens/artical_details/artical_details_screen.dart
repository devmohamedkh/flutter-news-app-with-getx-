import 'package:flutter/material.dart';
import 'package:news/models/articl_model.dart';

class ArticaldetailsScreen extends StatelessWidget {
  final Article? article;

  const ArticaldetailsScreen({Key? key, this.article}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      article?.title ?? '',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Container(
                      child: Image.network(
                        article?.urlToImage ??
                            'https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg',
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(article?.description ?? '',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                    SizedBox(height: 15),
                    Text(
                      article?.content ?? '',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(article?.publishedAt ?? '',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
