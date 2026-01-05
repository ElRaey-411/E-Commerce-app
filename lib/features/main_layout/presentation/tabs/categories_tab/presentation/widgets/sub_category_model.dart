class SubCategoryModel {
  SubCategoryModel(
  {
    required this.title,
  required this.image,

}
      );
 final String title;
 final String image;

static List<SubCategoryModel> subCategories=[
   SubCategoryModel(title: 'shirts', image: 'assets/images/test1.png'),
   SubCategoryModel(title: 'Tshirts', image: 'assets/images/test2.png'),
   SubCategoryModel(title: 'FDFFFirts', image: 'assets/images/test1.png'),
   SubCategoryModel(title: 'shiefsefrts', image: 'assets/images/test1.png'),
   SubCategoryModel(title: 'shiffferts', image: 'assets/images/test2.png'),
   SubCategoryModel(title: 'shiefsefsrts', image: 'assets/images/test1.png'),
   SubCategoryModel(title: 'shisefsrts', image: 'assets/images/test2.png'),
 ];
}