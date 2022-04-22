
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:simpayswap/Constants/myStrings.dart';
import 'package:simpayswap/models/KycModel.dart';
import 'package:http/http.dart' as http;

class PassbaseApi
{ 
   static var client=http.Client();
   Future<KycModel?> getVerificationProgress(String id)async
   {
      String url=myStrings.Verification_Status+"{${id}}";
      print(url);
      try{
         var responce=await client.get(Uri.parse(url),
             headers: {
               "X-API-KEY":"T32HnDtBqYlxfUegTx4COuLbqOwchmGgromuv1lar7YDqwMaQ53VwY7MXEJgzbNk1LX0skEXZoR6BNw5KQta9M7YAhhPdp2oBdPQbKtuT4fc6QAOwK4WvN03MdRDbMRi"
             }
             );
         if(responce.statusCode==200)
            {
               var model=kycModelFromJson(responce.body);
               return model;
            }
         return null;
      }on http.ClientException catch(e)
      {
         Fluttertoast.showToast(msg: e.message);
         return null;
      }
    
   }
}