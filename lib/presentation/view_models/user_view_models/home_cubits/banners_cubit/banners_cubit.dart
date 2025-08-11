import 'package:delivery_app/core/services/firebase_services/firestore_home_services.dart';
import 'package:delivery_app/presentation/models/banner_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersStates> {
  BannersCubit() : super(BannersInitialState());

  static BannersCubit get(context) => BlocProvider.of(context);

  final FirestoreHomeServices _firestoreHomeServices = FirestoreHomeServices();

  List<BannerModel> get bannersList => _bannersList;
  final List<BannerModel> _bannersList = [];

  Future<void> getAllBanners() async {
    emit(BannersLoadingState());
    _firestoreHomeServices
        .getAllBanners()
        .then((value) {
          for (var element in value) {
            _bannersList.add(
                BannerModel.fromJson(element.data() as Map<String, dynamic>));
          }
        })
        .then((value) => emit(BannersLoadedState()))
        .catchError((error) {
          emit(BannersErrorState(errorMessage: error.toString()));
        });
  }
}
