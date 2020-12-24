import 'package:bloc/bloc.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/models/models.dart';
import 'package:equatable/equatable.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> getPosts(int idKategori, String keyword) async {
    ApiReturnValue<List<Post>> result =
        await PostServices.getPosts(idKategori, keyword);

    if (result.value != null) {
      emit(PostLoaded(result.value));
    } else {
      emit(PostLoadingFailed(result.message));
    }
  }
}
