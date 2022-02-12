import '../../../domain/entity/interest.dart';
import '../interest_dto.dart';

extension InterestParsing on InterestDto {
  Interest mapToInterest() {
    return Interest(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
