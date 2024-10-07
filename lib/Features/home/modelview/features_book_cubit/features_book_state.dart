part of 'features_book_cubit.dart';

abstract class FeaturesBookState extends Equatable {
  const FeaturesBookState();

  @override
  List<Object> get props => [];
}

class FeaturesBookInitial extends FeaturesBookState {}

class FeaturedBooksLoading extends FeaturesBookState {}

class FeaturedBooksSuccess extends FeaturesBookState {
  final List<BookModel> books;

  const FeaturedBooksSuccess( this.books);
}

class FeaturedBooksFailer extends FeaturesBookState {
  final String errMessage;

  const FeaturedBooksFailer( this.errMessage);
}
