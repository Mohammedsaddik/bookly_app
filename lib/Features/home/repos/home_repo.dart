import 'package:bookly_app/Core/error/error.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFutureBooks();
  Future<Either<Failure, List<BookModel>>> fetchBestSallerBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
        Future<Either<Failure,BookModel>> fetchSearchDataBooks ({required String searchKey});

}
