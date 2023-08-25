import 'package:flutter/material.dart';
import 'package:netflix/utils/app_assets.dart';
import 'package:netflix/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, this.scrollOffset = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: Responsive(
      mobile: _CustomAppBarMoblie(),
      desktop: _CustomAppBarDesktop(),
      )
    );
  }
}

class _CustomAppBarMoblie extends StatelessWidget {
  const _CustomAppBarMoblie({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    title: 'Tv Show',
                    onTap: () => print('Tv show'),
                  ),
                  _AppBarButton(
                    title: 'Movies',
                    onTap: () => print('Movies'),
                  ),
                  _AppBarButton(
                    title: 'My List',
                    onTap: () => print('My List'),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}


class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo1),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    title: 'Home',
                    onTap: () => print('Home'),
                  ),
                  _AppBarButton(
                    title: 'Tv Show',
                    onTap: () => print('Tv show'),
                  ),
                  _AppBarButton(
                    title: 'Movies',
                    onTap: () => print('Movies'),
                  ),
                  _AppBarButton(
                    title: 'My List',
                    onTap: () => print('My List'),
                  ),
                  _AppBarButton(
                    title: 'Latest',
                    onTap: () => print('Latest'),
                  ),
                ],
              ),
            ),
            Spacer(),


            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(icon: Icons.search, size: 28, onTap: () => print('Search'),),
                  _AppBarButton(
                    title: 'KIDS',
                    onTap: () => print('KIDS'),
                  ),
                  _AppBarButton(
                    title: 'DVD',
                    onTap: () => print('DVD'),
                  ),
                 CustomIconButton(icon: Icons.card_giftcard, size: 28, onTap: () => print('Gift'),),
                  CustomIconButton(icon: Icons.notifications, size: 28, onTap: () => print('Notification'),),
                ],
              ),
            )
          ],
        ),
      );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const _AppBarButton({super.key, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}


class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? size ;
  final void Function()? onTap;
  const CustomIconButton({super.key, required this.icon, required this.size, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
    onPressed: onTap,
    icon: Icon(icon, size: size, color: Colors.white,));
    
  }
}
