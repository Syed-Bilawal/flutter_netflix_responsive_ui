import 'package:flutter/material.dart';
import 'package:netflix/model/content_model.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  const Previews({super.key,
  required this.contentList,
  required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(title, style: TextStyle( color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),

        ),
        Container(
          height: 165,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack( alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height:130 ,
                      width: 130,
                     decoration: BoxDecoration(image: DecorationImage(image: AssetImage(content.imageUrl),
                     fit: BoxFit.cover
                     ),
                     shape: BoxShape.circle,
                     border: Border.all(width: 4,color: content.color ?? Colors.transparent)
                     ),
                    ),
                     Container(
                      height:130 ,
                      width: 130,
                     decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.black87,
                        Colors.black45,
                        Colors.transparent
                      ],
                      stops: [0,0.25,1],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter
                      ),
                     shape: BoxShape.circle,
                     border: Border.all(width: 4,color: content.color ?? Colors.transparent)
                     ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 60,
                        child: Image.asset(content.titleImageUrl ?? ''),


                      ))
                  ],
                ),
              );
            },),
        )

      ],
    );
  }
}