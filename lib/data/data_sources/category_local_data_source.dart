import 'package:faker/faker.dart';

import '../../../../core/utility.dart';
import '../dto/category_dto.dart';

class CategoryLocalDataSource {
  Future<List<CategoryDto>> getCategoryList() async {
    await Future.delayed(loadRandomDuration());
    return <CategoryDto>[
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
    ];
  }
}

String loadRandomImageUrl() =>
    randomImageUrl[random.integer(randomImageUrl.length)];

const randomImageUrl = [
  "http://whatson.ae/wp-content/uploads/2014/11/Cape-Town-Stadium.jpg",
  "https://images.assettype.com/tgdaily%2F2018-01%2F631a5cd0-c0d0-4bbe-94eb-9ef1c2546c44%2Fe92d3992-3dfc-466b-aade-2e02439c6fa1.jpeg?w=1200&auto=format%2Ccompress&ogImage=true",
  "https://www.californiahome.me/wp-content/uploads/sac-events-1.jpg",
  "https://www.washingtonpost.com/resizer/lp__uUXpBVVkZj8WiLU9wRzYIVY=/1484x0/arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/NIVM7GRNTBCALHHCNLRQJ6TMVI",
  "https://www.unp.me/images/cache/2010/08/503806worldgamesstadium-1.jpg",
  "http://cdn.bleacherreport.net/images_root/slides/photos/001/011/233/112509104_crop_650x440.jpg?1307939961",
  "http://whatson.ae/wp-content/uploads/2014/11/Augusta.jpg"
];
