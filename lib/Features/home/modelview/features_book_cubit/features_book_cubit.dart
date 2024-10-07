import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'features_book_state.dart';

class FeaturesBookCubit extends Cubit<FeaturesBookState> {
  final HomeRepo homeRepo;
  FeaturesBookCubit(this.homeRepo) : super(FeaturesBookInitial());

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    final books = await homeRepo.fetchFutureBooks();
    books.fold((failure) {
      emit(FeaturedBooksFailer(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
