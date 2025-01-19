import 'package:blog_app/core/failure/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Usecase <SuccessType,Params>{
  Future<Either<Failure,SuccessType>> call(Params param);
}