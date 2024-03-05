import '../models/network_responce.dart';
import '../network/api_provider.dart';
import '../models/product/product.dart';

class ProductRepository {
  Future<NetworkResponse> getGoods() => ApiProvider.getAllProducts();

  Future<NetworkResponse> addGoods(ProductModel productModel) => ApiProvider.addAllProducts(productModel);

  Future<NetworkResponse> deleteGoods(String productId) => ApiProvider.deleteAllProducts(productId);

  Future<NetworkResponse> updateGoods(ProductModel productModel) => ApiProvider.updateAllProducts(productModel);
}
