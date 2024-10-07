part of 'best_saller_books_cubit.dart';

abstract class BestSallerBooksState extends Equatable {
  const BestSallerBooksState();

  @override
  List<Object> get props => [];
}

class BestSallerBooksInitial extends BestSallerBooksState {}

class BestSallerBooksLoading extends BestSallerBooksState {}

class BestSallerBooksSuccess extends BestSallerBooksState {
  final List<BookModel> books;
  const BestSallerBooksSuccess(this.books);
}

class BestSallerBooksError extends BestSallerBooksState {
  final String message;
  const BestSallerBooksError(this.message);
}


class LoadingSearchBooks extends BestSallerBooksState {}


class SuccessSearchBooks extends BestSallerBooksState {
  final List<BookModel> ? searchBooks ;
  SuccessSearchBooks(this.searchBooks);
}

class FailureSearchBooks extends BestSallerBooksState {
  final String error ;

  FailureSearchBooks(this.error);

}
