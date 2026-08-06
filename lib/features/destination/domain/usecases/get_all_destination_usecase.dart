import 'package:clean_arc_lesson/core/error/failure.dart';
import 'package:clean_arc_lesson/features/destination/domain/entities/destination_entitiy.dart';
import 'package:clean_arc_lesson/features/destination/domain/repositories/destination_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllDestinationUsecase {
  final DestinationRepository _repository;

  GetAllDestinationUsecase(this._repository);

  Future<Either<Failure, List<DestinationEntity>>> call() {
    return _repository.all();
  }
}