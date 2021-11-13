part of 'general_bloc.dart';


class GeneralState {

  final bool showMenuHome;

  GeneralState({
    this.showMenuHome = true
  });


  GeneralState copyWith({ bool? showMenuHome })
    => GeneralState(
      showMenuHome: showMenuHome ?? this.showMenuHome
    );
    //Cú pháp mũi tên béo chỉ đơn giản là một tay ngắn để trả về một biểu thức và tương tự như () {biểu thức return; }.
  
}