import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/utils/app_assets.dart';
import 'package:video_player/video_player.dart';
import 'widgets.dart';

class ContentHeader extends StatelessWidget {
  final Content featureContent;
  const ContentHeader({super.key,
  required this.featureContent});
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(featureContent: featureContent),
      desktop: _ContentHeaderDesktop(featureContent : featureContent));
  }
}
class _ContentHeaderDesktop extends StatefulWidget {
   final Content featureContent;
  const _ContentHeaderDesktop({super.key ,
  required this.featureContent});

  @override
  State<_ContentHeaderDesktop> createState() => _ContentHeaderDesktopState();
}

class _ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController _videoController ;
  bool _isMuted =true;
  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.featureContent.videoUrl!))
    ..initialize().then((value) => (value) {
      setState(() {});
    })..setVolume(0)..play();
    
  }

  @override
  void dispose() {
      _videoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying ? _videoController.pause():_videoController.play(),
      child: Stack( alignment: Alignment.bottomLeft,
        children: [
         AspectRatio(aspectRatio: 
         _videoController.value.isInitialized ? _videoController.value.aspectRatio : 2.344,
         child: _videoController.value.isInitialized ? VideoPlayer(_videoController) : 
         Image.asset(widget.featureContent.imageUrl, 
         fit: BoxFit.cover,),
         ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(aspectRatio: 
                   _videoController.value.isInitialized ? _videoController.value.aspectRatio : 2.344,
                   child:Container(
              decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              )
                
              ),
            ),
                   ),
          ),
           
          Positioned(
            left: 60,
            right: 60,
            bottom: 150,
            child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SizedBox(height: 100,
                  child: Image.asset!(widget.featureContent.titleImageUrl!),
                  
                  ),
                  SizedBox(height: 15,),
                  Text(widget.featureContent.description! , style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    shadows: [Shadow( color: Colors.black,
                    offset: Offset(2, 4),
                    blurRadius: 6
                    ) ]


                  ),),
                   SizedBox(height: 20,),
          Row(
            children: [
                _PlayButton(),
                SizedBox(width: 16,),
                TextButton.icon( 
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () => print('info'), icon: Icon(Icons.info_outline ,color: Colors.black,),
                 label: Text('More Info' ,style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w600 , color: Colors.black),)),

                 SizedBox(width: 20,),
                 if(_videoController.value.isInitialized)
                  IconButton(icon: Icon( _isMuted ? Icons.volume_off: Icons.volume_up),
                  color: Colors.white,
                  onPressed: () => setState(() {
                    _isMuted ? _videoController.setVolume(100) : _videoController.setVolume(0);
                    _isMuted = _videoController.value.volume == 0;
                  })
                  )
            ],
          )
              ],
            )
          ),
         
          
        ],
      ),
    );
  }
}

class _ContentHeaderMobile extends StatelessWidget {
  final Content featureContent;
  const _ContentHeaderMobile({super.key,
  required this.featureContent,
  });

  @override
  Widget build(BuildContext context) {
    return Stack( alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(featureContent.imageUrl),
            fit: BoxFit.cover
            ),
            
          ),
        ),
         Container(
          height: 500,
          decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          )
            
          ),
        ),
        Positioned(bottom: 110,
          child: SizedBox(height: 80,
          child: Image.asset(Assets.sintelTitle),
          ),
        ),
        Positioned(
          // left: 0,
          // right: 0,
          bottom: 40,
          child: Row(
            children: [
            VerticalIconButton(icon: Icons.add, title: 'List' , onTap: () => print('my list'),),
            SizedBox(width: 10,),
            _PlayButton(),
            SizedBox(width: 10,),
            VerticalIconButton(icon: Icons.info, title: 'info' , onTap: () => print('Onfo'),)
                          


            
          ],))
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !Responsive.isDesktop(context) ?
        const EdgeInsets.fromLTRB(15,5,20,5) : const EdgeInsets.fromLTRB(25,10,30,10) ,
      child: Container( color: Colors.white,
        child: TextButton.icon(
          onPressed: () => print('play'),
          icon: Icon(Icons.play_arrow, size: 30, color: Colors.black,),
          label: Text('Play' , style: TextStyle(fontSize: 10 , fontWeight: FontWeight.w600 , color: Colors.black),),
        ),
      ),
    );
  }
}