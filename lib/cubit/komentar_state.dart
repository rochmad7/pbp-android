part of 'komentar_cubit.dart';

abstract class KomentarState extends Equatable {
  const KomentarState();

  @override
  List<Object> get props => [];
}

class KomentarInitial extends KomentarState {}

class KomentarLoaded extends KomentarState {
  final List<Komentar> comments;

  KomentarLoaded(this.comments);

  @override
  List<Object> get props => [comments];
}

class KomentarLoadingFailed extends KomentarState {
  final String message;

  KomentarLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
