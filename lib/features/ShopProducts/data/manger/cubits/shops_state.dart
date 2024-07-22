part of 'shops_cubit.dart';
@immutable
abstract class ShopsState {}
 class ShopProductsInitial extends ShopsState {}
class GetAllShopProductsSuccessState extends ShopsState{
final  List<ShopsModel> allShop;
 GetAllShopProductsSuccessState(this.allShop);
}
class GetAllShopProductsLoadingState extends ShopsState{}
class GetAllShopProductsErrorState extends ShopsState{
 final String errorMessage;
  GetAllShopProductsErrorState(this.errorMessage);

}
class GetAllShopProductsFailureState extends ShopsState{
 final String failure;
 GetAllShopProductsFailureState(this.failure);
}

class GetMyShopsErrorState extends ShopsState{
 final String errorMessage;
 GetMyShopsErrorState(this.errorMessage);
}

class GetMyShopsSuccessState extends ShopsState
{
 final  List<ShopsModel> allShop;
 GetMyShopsSuccessState(this.allShop);
}
class GetMyShopLoadingState extends ShopsState{

}

class CreateShopsErrorState extends ShopsState{
 final String errorMessage;
 CreateShopsErrorState(this.errorMessage);
}
class CreateShopsSuccessState extends ShopsState{

}
class CreateShopsShopsLoadingState extends ShopsState{

}
class UpdateShopsErrorState extends ShopsState{
 final String errorMessage;
 UpdateShopsErrorState(this.errorMessage);
}
class UpdateShopsSuccessState extends ShopsState{

}
class UpdateShopsLoadingState extends ShopsState{

}



class DeleteShopsErrorState extends ShopsState{
 final String errorMessage;
 DeleteShopsErrorState(this.errorMessage);
}
class DeleteShopsSuccessState extends ShopsState{

}
class DeleteShopsLoadingState extends ShopsState{

}