import 'package:animate_do/animate_do.dart';
import 'package:e_com/Bloc/auth/auth_bloc.dart';
import 'package:e_com/Bloc/general/general_bloc.dart';
import 'package:e_com/Bloc/product/product_bloc.dart';
import 'package:e_com/Views/Cart/cart.dart';
import 'package:e_com/Views/Categories/category_screen.dart';
import 'package:e_com/Widgets/animation_router.dart';
import 'package:e_com/Widgets/text_frave.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'list_carousel.dart';
import 'list_category.dart';
import 'list_product.dart';

class ListHome extends StatefulWidget {
  const ListHome({Key? key}) : super(key: key);

  @override
  _ListHomeState createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  ScrollController scrollControllerHome =
      ScrollController(); // controller thanh cuộn
  double scrollPrevious = 0;

  @override
  void initState() {
    scrollControllerHome.addListener(() {
      if (scrollControllerHome.offset > scrollPrevious) {
        // Độ lệch cuộn hiện tại của tiện ích con có thể cuộn > scrollPrevious (chỉ cần có hiệu ứng scoll là menu bottom sẽ hiện ra)
        BlocProvider.of<GeneralBloc>(context, listen: false)
            .add(OnShowHideMenuHome(showMenu: false));
      } else {
        BlocProvider.of<GeneralBloc>(context, listen: false)
            .add(OnShowHideMenuHome(showMenu: true));
      }

      scrollPrevious = scrollControllerHome.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollControllerHome.dispose();
    super.dispose();
  }
  // xóa widget tạm thời

  @override
  Widget build(BuildContext context) {
    final authBlocState = BlocProvider.of<AuthBloc>(context).state;

    return SafeArea(
      child: SizedBox(
        child: ListView(
          controller: scrollControllerHome,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInLeft(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: const Color(0xff006CF2),
                            child: TextFrave(
                              text: authBlocState.username
                                  .substring(0, 2)
                                  .toUpperCase(),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          TextFrave(
                            text: authBlocState.username,
                            fontSize: 18,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => Navigator.of(context).pushReplacement(
                          rutaFrave(
                              page: const CartPage(),
                              curved: Curves.easeInOut)),
                      child: Stack(
                        children: [
                          FadeInRight(
                              child: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: SvgPicture.asset(
                                      'Assets/bolso-negro.svg',
                                      height: 25))),
                          Positioned(
                            left: 0,
                            top: 12,
                            child: FadeInDown(
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                    color: Color(0xff0C6CF2),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: BlocBuilder<ProductBloc,
                                            ProductState>(
                                        builder: (context, state) => state
                                                    .amount ==
                                                0
                                            ? const TextFrave(
                                                text: '0',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)
                                            : TextFrave(
                                                text:
                                                    '${state.products!.length}',
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold))),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 5.0, right: 10.0),
              child: CarCarousel(),
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextFrave(
                    text: 'Categories',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(rutaFrave(
                        page: const CategoriesPage(),
                        curved: Curves.easeInOut)),
                    child: Row(
                      children: const [
                        TextFrave(text: 'See All', fontSize: 17),
                        SizedBox(width: 5.0),
                        Icon(Icons.arrow_forward_ios_rounded,
                            size: 18, color: Color(0xff006CF2))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
              child: ListCategories(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextFrave(
                    text: 'Popular Products',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: const [
                      TextFrave(text: 'See All', fontSize: 17),
                      SizedBox(width: 5.0),
                      Icon(Icons.arrow_forward_ios_rounded,
                          size: 18, color: Color(0xff006CF2))
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              child: ListProducts(),
            )
          ],
        ),
      ),
    );
  }
}
