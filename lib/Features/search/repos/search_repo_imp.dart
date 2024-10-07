
import 'package:bookly_app/Core/Utils/api_service.dart';
import 'package:bookly_app/Core/error/error.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:bookly_app/Features/search/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImple extends SearchRepo{
  SearchRepoImple(this.apiService);
   final ApiService apiService;
  @override
  Future<Either<Failure, List<BookModel>>> searchBookName({required String bookName})async {
    var data = await apiService.get(
        endPoint:
        'volumes?Sorting=relevance&Filtering=free-ebooks&q=$bookName');
    List<BookModel> books = [];
    try {
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
        print(books);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}