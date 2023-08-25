import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  double _scrollOfset = 0;
  

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(() { 
      setState(() {
        _scrollOfset = _scrollController.offset;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(onPressed: (){}
      ,backgroundColor: Colors.grey[850],
      child: Icon(Icons.cast, color: Colors.white,),
      ),
    appBar: PreferredSize(preferredSize: 
    Size(screenSize.width, 50),
    child: CustomAppBar(scrollOffset: _scrollOfset),
    ),
    body: CustomScrollView(controller: _scrollController,
    slivers: [
      SliverToBoxAdapter(child: ContentHeader(featureContent :sintelContent),
      ),
      SliverPadding(padding: EdgeInsets.only(top:20),
      sliver: SliverToBoxAdapter(
        child: Previews(
          key: PageStorageKey('previews'),
          title: 'Previews',
          contentList: previews,
        ),
      ),
     
      ),
      SliverToBoxAdapter(
        child: ContentList(
          key: PageStorageKey('myList'),
          title : 'My List',
          contentList : myList
        ),
        
      ),
      SliverToBoxAdapter(
        child: ContentList(
          key: PageStorageKey('orignals'),
          title : 'Netflix Orignals',
          contentList : originals,
          isOriginals: true
        ),
        
      ),
      SliverPadding(
        padding: EdgeInsets.only(bottom: 20),
        sliver: SliverToBoxAdapter(
          child: ContentList(
            key: PageStorageKey('trending'),
            title : 'Trending',
            contentList : trending
          ),
          
        ),
      ),
    ],
    
    
    
    ),
    
    
    );
  }
}