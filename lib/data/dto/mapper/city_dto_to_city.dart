

import '../../../domain/entity/city.dart';
import '../city_dto.dart';

extension CityParsing on CityDto {
  City mapToCity() {
    return City(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
