// import 'package:get/get.dart';
// import '../models/product.dart';
// import '../service/api_service.dart';

// class ProductController extends GetxController {
//   var isLoading = true.obs;
//   var productList = <Product>[].obs;

//   @override
//   void onInit() {
//     fetchProducts();
//     super.onInit();
//   }

//   void fetchProducts() async {
//     try {
//       isLoading(true);
//       var apiService = ApiService();
//       var products = await apiService.fetchProducts();
//       productList.assignAll(products);
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
// }
