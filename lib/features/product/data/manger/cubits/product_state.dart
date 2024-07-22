part of 'product_cubit.dart';
@immutable
abstract class ProductState {}
 class ProductInitial extends ProductState {}
//ToDo get product id
class AddNumberState extends ProductState{}
class MinusNumberState extends ProductState{}

class GetProductIdLoadingState extends ProductState{}
class GetProductIdSuccessState extends ProductState{
final ProductModel getProductModel;
  GetProductIdSuccessState(this.getProductModel);
}
class GetProductIdErrorState extends ProductState{
 final String errormessage;
  GetProductIdErrorState(this.errormessage);
}
class GetProductIdFailureState extends ProductState{
 final String failure;
 GetProductIdFailureState(this.failure);
}




//ToDo update product id
class UpdateProductIdErrorState extends ProductState{
 final dynamic errormessage;
  UpdateProductIdErrorState(this.errormessage);
}
class UpLoadImageUpdateProductState extends ProductState{}
class UpdateProductIdLoadingState extends ProductState{}
class UpdateProductIdSuccessState extends ProductState{}
class UpdateProductIdFailureState extends ProductState{
 final String failure;
 UpdateProductIdFailureState(this.failure);
}




//ToDo delete product id
class DeleteProductIdErrorState extends ProductState{
 final String errormessage;

  DeleteProductIdErrorState(this.errormessage);
}
class DeleteProductIdLoadingState extends ProductState{}
class DeleteProductIdSuccessState extends ProductState{}
class DeleteProductIdFailureState extends ProductState{
 final String failure;
 DeleteProductIdFailureState(this.failure);
}

//ToDo search by product name
class GetProductNameErrorState extends ProductState{
 final String errormessage;

  GetProductNameErrorState(this.errormessage);
}
class GetProductNameFailureState extends ProductState{
 final String failure;
 GetProductNameFailureState(this.failure);
}
class GetProductNameSuccessState extends ProductState{
final List<ProductModel> searchProduct;
 GetProductNameSuccessState(this.searchProduct);
}
class GetProductNameLoadingState extends ProductState{}




//ToDo  GetAllProduct
class GetAllProductErrorState extends ProductState{
 final String errormessage;

  GetAllProductErrorState(this.errormessage);

}
class GetAllProductSuccessState extends ProductState{
final  List<ProductModel> allProducts;
 GetAllProductSuccessState(this.allProducts);
}
class GetAllProductLoadingState extends ProductState{}
class GetAllProductFailureState extends ProductState{
 final String failure;
 GetAllProductFailureState(this.failure);
}
//ToDo  GetMyProduct
class GetMyProductErrorState extends ProductState{
 final String errormessage;

  GetMyProductErrorState(this.errormessage);
}
class GetMyProductSuccessState extends ProductState{
 final  List<ProductModel> allProducts;
 GetMyProductSuccessState(this.allProducts);
}
class GetMyProductLoadingState extends ProductState{}
class GetMyProductFailureState extends ProductState{
 final String failure;
 GetMyProductFailureState(this.failure);
}

//ToDo  PostProduct
class PostProductErrorState extends ProductState{
 final dynamic errormessage;
  PostProductErrorState(this.errormessage);
}
class PostProductSuccessState extends ProductState{}
class PostProductLoadingState extends ProductState{}
class PostProductFailureState extends ProductState{
 final String failure;
 PostProductFailureState(this.failure);
}

//ToDo  GetAllWorkspacesbySortReview
class GetAllWorkspacesbySortReviewErrorState extends ProductState{
 final String errormessage;
  GetAllWorkspacesbySortReviewErrorState(this.errormessage);
}
class GetAllWorkspacesbySortReviewFailureState extends ProductState{
 final String failure;
 GetAllWorkspacesbySortReviewFailureState(this.failure);
}
class GetAllWorkspacesbySortReviewSuccessState extends ProductState{

 final List<ProductbySortReviewModel> ProductbySortReview;
 GetAllWorkspacesbySortReviewSuccessState(this.ProductbySortReview);
}
class GetAllWorkspacesbySortReviewLoadingState extends ProductState{}
