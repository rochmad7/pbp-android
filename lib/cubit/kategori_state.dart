part of 'kategori_cubit.dart';

abstract class KategoriState extends Equatable {
  const KategoriState();

  @override
  List<Object> get props => [];
}

class KategoriInitial extends KategoriState {}

class KategoriLoaded extends KategoriState {
  final List<Kategori> kategori;

  KategoriLoaded(this.kategori);

  @override
  List<Object> get props => [kategori];
}

class KategoriLoadingFailed extends KategoriState {
  final String message;

  KategoriLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
