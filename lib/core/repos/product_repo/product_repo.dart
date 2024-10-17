import 'package:fruithupdashboard/features/add_product/domin/entities/add_product_entitie.dart';

abstract class ProductRepo {
  Future<void> addProduct(AddProductEntity addProductEntity);
}
