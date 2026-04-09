// cart_cubit.dart
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  // المنتجات اللي المستخدم اضافها مع الكميات
  Map<HomeShopProductEntity, int> selectedProducts = {};

  // زيادة الكمية
  void incrementQuantity(HomeShopProductEntity product) {
    selectedProducts[product] = (selectedProducts[product] ?? 0) + 1;
    emit(CartUpdatedState(Map.from(selectedProducts)));
  }

  // نقصان الكمية
  void decrementQuantity(HomeShopProductEntity product) {
    if ((selectedProducts[product] ?? 0) > 0) {
      selectedProducts[product] = selectedProducts[product]! - 1;
      if (selectedProducts[product] == 0) {
        selectedProducts.remove(product);
      }
      emit(CartUpdatedState(Map.from(selectedProducts)));
    }
  }

  // الميثود الأولى: المنتجات المختارة في String
  String getSelectedProductsAsString() {
    if (selectedProducts.isEmpty) return '';

    final buffer = StringBuffer();
    selectedProducts.forEach((product, quantity) {
      buffer.writeln('الاسم: ${product.productName}');
      buffer.writeln('الوصف: ${product.productDescription}');
      buffer.writeln('السعر: ${product.productPrice}');
      buffer.writeln('الكمية: $quantity');
      buffer.writeln('---');
    });

    return buffer.toString();
  }

  // الميثود التانية: Total Price
  double getTotalPrice() {
    double total = 0;
    selectedProducts.forEach((product, quantity) {
      total += (product.productPrice ?? 0) * quantity;
    });
    return total;
  }
}