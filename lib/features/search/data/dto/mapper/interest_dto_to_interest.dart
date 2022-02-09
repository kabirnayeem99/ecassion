import 'package:ecassion/features/search/data/dto/interest_dto.dart';
import 'package:ecassion/features/search/domain/entity/interest.dart';

extension InterestParsing on InterestDto {
  Interest mapToInterest() {
    return Interest(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
