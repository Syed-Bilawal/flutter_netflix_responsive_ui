import 'package:flutter/material.dart';
import 'package:netflix/model/content_model.dart';

class ContentList extends StatelessWidget {
  final title;
  final List<Content> contentList;
  final bool isOriginals;
  const ContentList({super.key,
  required this.contentList,
  required this.title,
  this.isOriginals = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(title, style: TextStyle( color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
    
          ), 
          Container(
            height: isOriginals ? (isOriginals ? 500.0 : 220.0) : 220.0,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16
              ),
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final Content content =contentList[index];
                return GestureDetector(
                  onTap: () {
                    print(content.name);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: isOriginals ? 400:200,
                    width: isOriginals ? 200 : 130,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage(content.imageUrl),
                    fit: BoxFit.cover
                    )),
                  ),
                );
              },),

          )
      ]
      ),
    );
  }
}