import 'package:ecassion/features/home/data/dto/category_dto.dart';

class CategoryLocalDataSource {
  Future<List<CategoryDto>> getCategoryList() async {
    await Future.delayed(const Duration(seconds: 2));
    return <CategoryDto>[
      CategoryDto(
          id: "802",
          name: "Sports",
          imageUrl:
              "https://arlingtonva.s3.dualstack.us-east-1.amazonaws.com/wp-content/uploads/sites/17/2014/02/badminton-1.jpg"),
      CategoryDto(
        id: "23r453",
        name: "Family",
        imageUrl:
            "https://www.cdc.gov/heartdisease/images/hd-family-history.jpg",
      ),
      CategoryDto(
          id: "82423423402",
          name: "Social",
          imageUrl:
              "https://media.istockphoto.com/vectors/seamless-pattern-social-concept-of-people-communication-in-flat-style-vector-id624126636?k=6&m=624126636&s=170667a&w=0&h=ccy_FszqtAODsAimm3Lv6YpTAFLGYREiWqd8hcMUEO8="),
      CategoryDto(
          id: "4q234243",
          name: "Issue",
          imageUrl:
              "https://arlingtonva.s3.dualstack.us-east-1.amazonaws.com/wp-content/uploads/sites/17/2014/02/badminton-1.jpg"),
      CategoryDto(
          id: "r243",
          name: "Fun",
          imageUrl:
              "https://media.istockphoto.com/photos/man-having-fun-picture-id528183081?k=6&m=528183081&s=170667a&w=0&h=PnBYFSY0fJ2KIjkxPFEXxNGgWZ2_zPX8FUpVcnSzL0w="),
    ];
  }
}
