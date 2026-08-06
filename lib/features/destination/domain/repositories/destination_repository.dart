import 'package:clean_arc_lesson/core/error/failure.dart';
import 'package:clean_arc_lesson/features/destination/domain/entities/destination_entitiy.dart';
import 'package:dartz/dartz.dart';

abstract class DestinationRepository {
  Future<Either<Failure, List<DestinationEntity>>> all();
  Future<Either<Failure, List<DestinationEntity>>> top();
  Future<Either<Failure, List<DestinationEntity>>> search(String query);
}