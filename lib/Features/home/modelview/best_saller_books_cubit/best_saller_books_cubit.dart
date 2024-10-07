import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_saller_books_state.dart';

class BestSallerBooksCubit extends Cubit<BestSallerBooksState> {
  final HomeRepo homeRepo;

  BestSallerBooksCubit(this.homeRepo) : super(BestSallerBooksInitial());

  Future<void> fetchBestSallerdBooks() async {
    emit(BestSallerBooksLoading());
    final books = await homeRepo.fetchBestSallerBooks();
    books.fold((failure) {
      emit(BestSallerBooksError(failure.errMessage));
    }, (books) {
      emit(BestSallerBooksSuccess(books));
    });
  }

  Future<void> fetchSearchBooks ({required String searchKey}) async {
    emit(LoadingSearchBooks());
    var result =  await homeRepo.fetchSearchDataBooks(searchKey: searchKey);

    result.fold((failure) {
      emit(FailureSearchBooks(failure.errorMessage));
    }, (bookResponse) {
      emit(SuccessSearchBooks(bookResponse.books));
    });
  }
}
