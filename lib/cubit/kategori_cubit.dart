import 'package:bloc/bloc.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/models/models.dart';
import 'package:equatable/equatable.dart';

part 'kategori_state.dart';

class KategoriCubit extends Cubit<KategoriState> {
  KategoriCubit() : super(KategoriInitial());

  Future<void> getKategori() async {
    ApiReturnValue<List<Kategori>> result =
        await KategoriServices.getKategori();

    if (result.value != null) {
      emit(KategoriLoaded(result.value));
    } else {
      emit(KategoriLoadingFailed(result.message));
    }
  }
}
