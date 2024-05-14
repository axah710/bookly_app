import 'package:dartz/dartz.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dio/dio.dart';

class HomeRepoImlemintation extends HomeRepo {
  ApiService apiService;
  HomeRepoImlemintation(
    this.apiService,
  );

  // This ApiService is used to make Dio requests to an external API.
  // HomeRepoImlemintation extends HomeRepo and includes an
  // instance of ApiService to make HTTP requests.
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestNewsBooks() async {
    // This method fetches books that are free, related to programming,
    //and sorted by the newest first. It constructs a
    //specific endpoint using these parameters.
    String sorting = "newest";
    String subject = "programming";
    String programmingBooksEndPoint =
        "volumes?Filtering=free-ebooks&q=subject:$subject&sorting=$sorting";
    try {
      var data = await apiService.get(
        endPoint: programmingBooksEndPoint,
      );
      // it makes a call to the API using apiService.get()
      //with a specific endpoint that includes parameters to
      // filter and sort the books by programming subjects
      //and only include free ebooks.
      List<BookModel> books = [];
      for (var item in data["items"]) {
        books.add(
          BookModel.fromJson(item),
          // transfer item into BookModel instances and added to a list.
        );
      }
      // The response is expected to contain a list of items,
      // each representing a book. These items are then transformed
      //into BookModel instances and added to a list.
      return right(books);
      // If the data fetching and processing are successful,
      // it returns the list of books wrapped in a right()
      //function (indicating success).
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      //  If there's an error (like a network issue handled by DioException),
      // it returns a Failure object wrapped in an Either type
      // indicating failure (left).
      // The method handles errors specifically catching DioException
      //to handle network-related errors and other exceptions for general errors.
      else {
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
// / Here we will handel home repo "feature" implementation.
