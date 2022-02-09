import 'package:ecassion/features/search/data/dto/city_dto.dart';
import 'package:ecassion/features/search/domain/entity/city.dart';

extension CityParsing on CityDto {
  City mapToCity() {
    return City(
      id: id,
      name: name,
      imageUrl: imageUrl,
    );
  }
}
