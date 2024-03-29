import 'package:flutter_bloc/flutter_bloc.dart';


part 'general_event.dart';
part 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState>{
   GeneralBloc() : super(GeneralState());

   @override
  Stream<GeneralState> mapEventToState(GeneralEvent event) async* {
      if( event is OnShowHideMenuHome ){

          yield state.copyWith( showMenuHome: event.showMenu );

      }
   }
}