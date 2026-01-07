
import 'package:delivery_app/domain/usecases/home_usecases/home_get_banners_usecase.dart';
import 'package:delivery_app/presentation/view_models/user_view_models/home_cubits/get_banners_cubit/get_banners_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



class GetBannersCubit extends Cubit<GetBannersStates> {
  GetBannersCubit(this.featuredBooksUseCase) : super(GetBannersInitialState());

  static GetBannersCubit get(context) => BlocProvider.of(context);

  HomeGetBannersUseCase featuredBooksUseCase ;

  Future<void> fetchBanners() async {
    emit(GetBannersLoadingState());
    var result = await featuredBooksUseCase.call();
    result.fold((failure) {
      emit(GetBannersErrorState(errorMessage: failure.message));
    }, (banners) {
      emit(GetBannersLoadedState( bannersList: banners));
    });
  }
}
