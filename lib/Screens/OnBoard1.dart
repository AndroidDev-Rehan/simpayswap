import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_onboard/flutter_onboard.dart';



class OnBoard1 extends StatelessWidget {
   OnBoard1({Key? key}) : super(key: key);


  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "Welcome ",
      description: "Manage all your crypto assets! Its simple \n and easy",
      imgUrl: "assets/pic1.png",

    ),
    const OnBoardModel(
      title: "Nice and Tidy Crypto Portfolio!",
      description:
      "Keep BTC, ETH, XRP and many other ERC-20 based tokens.",
      imgUrl: 'assets/pic2.png',
    ),
    const OnBoardModel(
      title: "Recieve and Send Money to Friends!",
      description:
      "Send crypto to your friends with a personal message attached",
      imgUrl: 'assets/pic3.png',
    ),
    const OnBoardModel(
      title: "Your Safety is Our Top Priority",
      description:
      "Oue top-notch security features will keep you completely safe.",
      imgUrl: 'assets/pic4.png',
    ),
  ];
   final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       toolbarHeight: 0,
       elevation: 0,


     ),
     // backgroundColor: Color(0xffEDF1F9),   back ground color for picture
      body:
      OnBoard(
        pageController: _pageController,
        onBoardData: onBoardData ,

        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: ()

        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        }
        ,
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));

        },

       titleStyles: (

       TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
       ),
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state,context),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration:

                BoxDecoration(
                    border: Border.all(color:Color(0xff347AF0)),
                  borderRadius: BorderRadius.circular(30),
                  color: state.isLastPage ?Color(0xff347AF0):Colors.white,
                ),
                child: Text(
                  state.isLastPage ? "Let's Get Started" : "Next Step",
                  style: TextStyle(
                    color: state.isLastPage ?Colors.white:Color(0xff347AF0),
                    fontSize: 17
                  ),
                ),
              ),

            );
          },
        ),

        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.grey,
          activeColor: Color(0xff347AF0),
          inactiveSize: Size(8, 8),
          activeSize: Size(10, 10),
        ),


      ),
    );
  }

   void _onNextTap(OnBoardState onBoardState,BuildContext context) {
     if (!onBoardState.isLastPage) {
       _pageController.animateToPage(
         onBoardState.page + 1,
         duration: const Duration(milliseconds: 300),
         curve: Curves.easeInOutSine,
       );
     } else {
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
     }
   }
}



