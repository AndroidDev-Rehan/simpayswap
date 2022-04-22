import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:simpayswap/ApiManager/PassbaseApi.dart';
import 'package:simpayswap/models/KycModel.dart';

class VerificationController extends GetxController
{
  var status="".obs;
  var owner=Owner(email: "", firstName: "", lastName: "").obs;
  var isLoading=false.obs;
  String _id;
  VerificationController(this._id);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getData();
  }
  Future<void> _getData()async
  {
    try{
    isLoading.value=true;
      var model=await PassbaseApi().getVerificationProgress(this._id);
      if(model!=null) {
        status.value = model!.status;
        print(status.value);
        owner.value = model.owner;
      }
    isLoading.value=false;
    }catch(e)
    {
      Fluttertoast.showToast(msg: e.toString());
      isLoading.value=false;
    }
  }
}