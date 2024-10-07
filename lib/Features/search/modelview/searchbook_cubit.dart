import 'package:bookly_app/Features/search/modelview/searchbook_state.dart';
import 'package:bookly_app/Features/search/repos/search_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchbookCubit extends Cubit<SearchbookState> {
  SearchbookCubit(this.searchrepo) : super(SearchbookInitial());
  final SearchRepo searchrepo;
  Future<void> featurecustombook({required String text}) async {
    emit(SearchbookLoading());
    var response = await searchrepo.searchBookName(bookName: text);
    response.fold((faillure) {
      emit(SearchbookError(faillure.errMessage));
    }, (books) {
      emit(SearchbookSucess(books));
    });
  }
}
