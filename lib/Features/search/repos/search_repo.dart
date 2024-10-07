
import 'package:bookly_app/Core/error/error.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>>searchBookName({required String bookName});
}