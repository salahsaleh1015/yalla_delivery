// cart_cubit.dart
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/cart_cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  /// المنتجات المختارة مع الكمية
  Map<HomeShopProductEntity, int> selectedProducts = {};

  /// زيادة الكمية
  void incrementQuantity(HomeShopProductEntity product) {
    selectedProducts[product] = (selectedProducts[product] ?? 0) + 1;
    emit(CartUpdatedState(Map.from(selectedProducts)));
  }

  /// تقليل الكمية
  void decrementQuantity(HomeShopProductEntity product) {
    if ((selectedProducts[product] ?? 0) > 0) {
      selectedProducts[product] = selectedProducts[product]! - 1;

      if (selectedProducts[product] == 0) {
        selectedProducts.remove(product);
      }

      emit(CartUpdatedState(Map.from(selectedProducts)));
    }
  }

  /// حساب إجمالي الطلب
  double getTotalPrice() {
    double total = 0;

    selectedProducts.forEach((product, quantity) {
      total += (product.productPrice ?? 0) * quantity;
    });

    return total;
  }

  /// عدد المنتجات المختلفة
  int getItemsCount() {
    return selectedProducts.length;
  }

  /// إجمالي الكميات
  int getTotalQuantity() {
    int totalQuantity = 0;

    selectedProducts.forEach((product, quantity) {
      totalQuantity += quantity;
    });

    return totalQuantity;
  }

  /// تجهيز الطلب بالكامل
  String getOrderSummary({
    required String shopName,
    required String shopAddress,
    required String shopPhone,
  }) {
    if (selectedProducts.isEmpty) return '';

    final buffer = StringBuffer();

    buffer.writeln('🏪 بيانات المحل');
    buffer.writeln('════════════════════');
    buffer.writeln('اسم المحل: $shopName');
    buffer.writeln('العنوان: $shopAddress');
    buffer.writeln('رقم المكان: $shopPhone');
    buffer.writeln('');

    buffer.writeln('🛒 تفاصيل الطلب');
    buffer.writeln('════════════════════');

    int index = 1;

    selectedProducts.forEach((product, quantity) {
      final itemTotal = (product.productPrice ?? 0) * quantity;

      buffer.writeln('$index) ${product.productName}');
      buffer.writeln('السعر: ${product.productPrice} ج');
      buffer.writeln('الكمية: $quantity');
      buffer.writeln('إجمالي الصنف: $itemTotal ج');
      buffer.writeln('────────────────');
      index++;
    });

    buffer.writeln('');
    buffer.writeln('💰 ملخص الطلب');
    buffer.writeln('════════════════════');
    buffer.writeln('عدد الأصناف: ${getItemsCount()}');
    buffer.writeln('إجمالي الكميات: ${getTotalQuantity()}');
    buffer.writeln('الإجمالي النهائي: ${getTotalPrice()} ج');

    return buffer.toString();
  }
}