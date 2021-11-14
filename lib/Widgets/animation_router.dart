import 'package:flutter/material.dart';

Route rutaFrave({Widget? page, Curve? curved}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 450),
    // thời gian animation
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        page!,
    // chuyển đến screen nào đó
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // thiết lập trasitions
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: curved!);
      // gọi biến CurvedAnimation (parent :Hoạt ảnh mà hoạt ảnh này áp dụng một đường cong , curved :Đường cong để sử dụng theo hướng về phía trước)

      return SlideTransition(
        // làm animation child
        position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(curvedAnimation),
        // positon: ảnh điều kiển vị trí position , Tween đặt trong phạm vi nào animetion , animate(curvedAnimation) kiểu hoạt động chuyển trang
        child: child,
      );
    },
  );
}
//link: https://flutter.dev/docs/cookbook/animation/page-route-animation#4-use-a-curvetween
