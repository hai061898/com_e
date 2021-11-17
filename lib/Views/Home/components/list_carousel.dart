import 'package:e_com/Data/Models/Home/home_carousel.dart';
import 'package:e_com/Repositories/home_repositories.dart';
import 'package:flutter/material.dart';

import 'load_shimmer_carosusel.dart';

class CarCarousel extends StatelessWidget {
  const CarCarousel({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<List<SliderHome>>(
        future: homeRepositories.getHomeCarouselSlider(),
        builder: (context, snapshot) {

            List<SliderHome>? silerHome = snapshot.data; 

            return !snapshot.hasData
            ?const LoadingShimmerCarosusel()
            : PageView.builder(
              itemCount: silerHome!.length,
              itemBuilder: (context, i) {
                return Container(
                  margin:const EdgeInsets.only(right: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('http://127.0.0.1/'+ silerHome[i].image)
                    )
                  ),
                );
              },
            );
            
        } 
      ),
    );
  }
}