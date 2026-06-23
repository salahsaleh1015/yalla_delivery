import 'package:delivery_app/domain/entities/cart_entities/order_entity.dart';
import 'package:delivery_app/domain/entities/delivery_management_entities/delivery_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_banner_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_entity.dart';
import 'package:delivery_app/domain/entities/home_entities/home_shop_product_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../constants.dart';

void saveBannersData(
    {required List<HomeBannerEntity> banners, required String boxName}) {
  var box = Hive.box<HomeBannerEntity>(boxName);
  box.addAll(banners);
}

void saveShopsData(
    {required List<HomeShopEntity> shops, required String boxName}) {
  var box = Hive.box<HomeShopEntity>(boxName);
  box.addAll(shops);
}

void saveProductsData(
    {required List<HomeShopProductEntity> products, required String boxName}) {
  var box = Hive.box<HomeShopProductEntity>(boxName);
  box.addAll(products);
}

void saveDeliveriesData(
    {required List<DeliveryEntity> deliveries, required String boxName}) {
  var box = Hive.box<DeliveryEntity>(boxName);
  box.addAll(deliveries);
}

Future<void> clearHiveBox<T>({required String boxName}) async {
  final box = Hive.box<T>(boxName);
  await box.clear();
}

void saveOrdersData({
  required List<OrderEntity> orders,
  required String boxName,
}) {
  var box = Hive.box<OrderEntity>(boxName);
  box.addAll(orders);
}

Future<void> clearOrders() async {
  await clearHiveBox<OrderEntity>(boxName: kPendingOrdersBox);
  await clearHiveBox<OrderEntity>(boxName: kCompletedOrdersBox);
  await clearHiveBox<OrderEntity>(boxName: kCanceledOrdersBox);
  await clearHiveBox<OrderEntity>(boxName: kAcceptedOrdersBox);
}

