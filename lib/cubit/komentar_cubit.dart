import 'package:bloc/bloc.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/models/models.dart';
import 'package:equatable/equatable.dart';

part 'komentar_state.dart';

class KomentarCubit extends Cubit<KomentarState> {
  KomentarCubit() : super(KomentarInitial());

  Future<List<Komentar>> getComments(int idpost) async {
    ApiReturnValue<List<Komentar>> result =
        await KomentarServices.getComments(idpost);

    if (result.value != null) {
      emit(KomentarLoaded(result.value));
      return result.value;
    } else {
      emit(KomentarLoadingFailed(result.message));
      return null;
    }
  }
}
