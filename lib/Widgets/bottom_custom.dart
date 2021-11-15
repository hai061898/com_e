import 'package:e_com/Widgets/animation_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class BottomNavigationFrave extends StatelessWidget
{

  final int index;
  final bool showMenu;
  
  const BottomNavigationFrave({ Key? key ,required this.index, this.showMenu = true }):super(key: key);


  @override
  Widget build(BuildContext context) 
  {
    return AnimatedOpacity(
      duration:const  Duration(milliseconds: 250),
      opacity: ( showMenu ) ? 1 : 0,
      child: Container(
        height: 60,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ItemsButton(i: 0, index: index, svg: 'Assets/home.svg', activeSvg: 'Assets/home-selected.svg', onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: HomePage(), curved: Curves.easeInOut))),
            // ItemsButton(i: 1, index: index, icon: Icons.favorite_outline_rounded, isIcon: true, activeIcon: Icons.favorite_rounded, onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: FavoritePage(), curved: Curves.easeInOut))),
            // ItemsButton(i: 2, index: index, svg: 'Assets/bolso.svg', center: true, activeSvg: 'Assets/bolso-selected.svg', onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: CartPage(), curved: Curves.easeInOut))),
            // ItemsButton(i: 3, index: index, icon: Icons.search, isIcon: true, activeIcon: Icons.search,),
            // ItemsButton(i: 4, index: index, icon: Icons.person_outline_rounded, isIcon: true, activeIcon:  Icons.person, onPressed: () => Navigator.pushReplacement(context, rutaFrave( page: ProfilePage(), curved: Curves.easeInOut))),
          ]
        ),
      ),
    );
  }
}

class  ItemsButton extends StatelessWidget 
{
  final IconData? icon;
  final String? svg;
  final bool isIcon;
  final bool center;
  final Function()? onPressed;
  final IconData? activeIcon;
  final String? activeSvg;
  final int? index;
  final int? i;

  const ItemsButton({ 
    Key? key,
    this.i,
    this.index,
    this.icon, 
    this.svg, 
    this.center = false,
    this.isIcon = false,
    this.onPressed,
    this.activeIcon,
    this.activeSvg
  }):super(key:key);


  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector(
      onTap: onPressed,
      child: center
       ? CircleAvatar(
         backgroundColor:const Color(0xff006cf2),
         radius: 26,
         child: SvgPicture.asset( i == index ? activeSvg.toString() : svg.toString(), height: 26, color: Colors.white ),
       )
       : isIcon 
          ? Icon( i == index ? activeIcon : icon , size: 30, color: i == index ? const Color(0xff006cf2) : Colors.black )
          : SvgPicture.asset( i == index ? activeSvg.toString() : svg.toString() , height: 26, color: i == index ? const  Color(0xff006cf2) : Colors.black )
    );
  }
}