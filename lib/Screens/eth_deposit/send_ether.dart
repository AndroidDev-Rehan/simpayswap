import 'dart:developer' as lg;
import 'package:get/get.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
import 'package:web_socket_channel/io.dart';
import 'EtherTransferFail.dart';
import 'EtherTransferSuccess.dart';
import 'colors.dart';
import 'constant.dart';

class SendEtherByWallet extends StatefulWidget {
  const SendEtherByWallet({Key? key}) : super(key: key);

  @override
  State<SendEtherByWallet> createState() => _SendEtherByWalletState();
}

class _SendEtherByWalletState extends State<SendEtherByWallet> {
  late String privateKey;
  late String receiverAddress;

  late double etherValue;
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController privateKeyField = TextEditingController();
    TextEditingController recieverAddressField = TextEditingController();
    TextEditingController etherAmountField = TextEditingController();

    return Scaffold(
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/bg_2.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Form(
          child: ListView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    height20Space,
                    Padding(
                      padding: EdgeInsets.only(right: 35.0, left: 35.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: blackColor.withOpacity(0.05),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: TextFormField(
                            controller: privateKeyField,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  (value.toString().length != 64)) {
                                return 'Enter a valid wallet key';
                              }
                              return null;
                            },
                            // controller: nameController,
                            style: black14MediumTextStyle,
                            keyboardType: TextInputType.text,
                            // obscureText: true,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.vpn_key_outlined,
                              //     color: greyColor.withOpacity(0.4)),
                              contentPadding: EdgeInsets.only(left: 10.0),
                              hintText:
                              'Enter Your Wallet Key'.toUpperCase(),
                              hintStyle: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    height20Space,
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0, left: 35.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: blackColor.withOpacity(0.05),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFormField(
                            controller: etherAmountField,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter ether amount you want to send';
                              }
                              return null;
                            },
                            // controller: nameController,
                            style: black14MediumTextStyle,
                            keyboardType: TextInputType.number,
                            // obscureText: true,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.payments_outlined,
                              //     color: greyColor.withOpacity(0.4)),
                              contentPadding: const EdgeInsets.only(left: 10.0),
                              hintText:
                              'Enter Amount in ETH'.toUpperCase(),
                              hintStyle: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    height20Space,
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0, left: 35.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                              color: blackColor.withOpacity(0.05),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  (value.toString().length != 42)) {
                                return 'Please enter a valid receiver address';
                              }
                              return null;
                            },
                            controller: recieverAddressField,
                            style: black14MediumTextStyle,
                            keyboardType: TextInputType.text,
                            // obscureText: true,
                            decoration: InputDecoration(
                              // icon: Icon(Icons.password_outlined,
                              //     color: greyColor.withOpacity(0.4)),
                              contentPadding: const EdgeInsets.only(left: 10.0),
                              hintText: 'Enter the reciever address'
                                  .toUpperCase(),
                              hintStyle: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
              height20Space,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 3.0),
                child: InkWell(
                  onTap: () async {
                    print('send');
                    if (_formKey.currentState!.validate()) {
                      privateKey = privateKeyField.text.toString();
                      receiverAddress =
                          recieverAddressField.text.toString();
                      etherValue =
                          double.parse(etherAmountField.text.toString());
                      print("private key is $privateKey\n"
                          "receiver address is $receiverAddress\n"
                          "ether amount is $etherValue\n");
                      setState(() {
                        loading = true;
                      });
                      await sendEther();
                    }
                  },
                  // if (_formKey.currentState.validate()) {
                  //   // setStaete(() {
                  //   //   loading = true;
                  //   // });
                  //   Get.to(FinalTransfer());
                  // }
                  // },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color(0xff347AF0),
                    ),
                    child: const Text(
                      'next',
                      style: white14BoldTextStyle,
                    ),
                  ),
                ),
              ),
            ],
          ),
          key: _formKey,
        ),
      ),
    );
  }

  sendEther() async {
    const String rpcUrl =
        "https://mainnet.infura.io/v3/9e4e431bf13543a58e6a335e95ba8336";
    const String wsUrl =
        "wss://mainnet.infura.io/ws/v3/9e4e431bf13543a58e6a335e95ba8336";

    // final String rpcUrl =
    //     "https://rinkeby.infura.io/v3/9e4e431bf13543a58e6a335e95ba8336";
    // final String wsUrl =
    //     "wss://rinkeby.infura.io/ws/v3/9e4e431bf13543a58e6a335e95ba8336";


    try {

      Web3Client client = Web3Client(rpcUrl, Client(), socketConnector: () {
        return IOWebSocketChannel.connect(wsUrl).cast<String>();
      });
      Credentials credentials =
      // await client.credentialsFromPrivateKey(privateKey);
      EthPrivateKey.fromHex(privateKey);


      print('--------------------------');
      EthereumAddress receiver = EthereumAddress.fromHex(receiverAddress);
      final BigInt etherAmountinWie = BigInt.from(
          1000000000000000000 * etherValue -
              (1000000000000000000 * etherValue * 0.03));
      final BigInt gasFeeAmount =
      BigInt.from(1000000000000000000 * etherValue * 0.03);
      lg.log(etherAmountinWie.toString());
      print(etherAmountinWie.toString());
      print(gasFeeAmount.toString());

      String transactionHash = await client.sendTransaction(
        credentials,
        Transaction(
          to: receiver,
          value: EtherAmount.fromUnitAndValue(EtherUnit.wei, etherAmountinWie),
        ),
      );

      TransactionReceipt? transactionReceipt =
      await client.getTransactionReceipt(transactionHash);
      bool status = transactionReceipt!.status!;
      if (status == true) {
        const EtherTransferSuccessScreen("Transaction was Successful");
      } else {
        Get.off(const EtherTransferFailScreen("Transaction was not Successful"));

      }
    } on RPCError catch (e) {
      print(e);
      Get.off(const EtherTransferFailScreen("Insufficient funds for transfer"));
    }
    on FormatException catch (e){
      Get.off(const EtherTransferFailScreen("Invalid private key or ethereum address"));
    }
    on ArgumentError catch (e){
      Get.off(const EtherTransferFailScreen("Invalid private key or ethereum address"));
    }
    catch (ej) {
      print(ej);
      Get.off(EtherTransferFailScreen(ej.toString()));
      rethrow;
    }
    print("sending ether finished!");
  }
}
