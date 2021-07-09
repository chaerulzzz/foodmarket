part of '../pages.dart';

class PaymentPage extends StatefulWidget {
  final Transaction? transaction;

  PaymentPage({this.transaction});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Payment",
      subtitle: "You deserve better meal",
      onBackButtonPressed: () {},
      backColor: colorFirst,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Ordered", style: blackFontStyle),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(widget.transaction!.food!.picturePath!), 
                              fit: BoxFit.cover)
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 2 * defaultMargin - 150,
                              child: Text(widget.transaction!.food!.name!, 
                                style: blackFontStyle2,
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                            ),
                            Text(NumberFormat.currency(
                              locale: "id-ID",
                              decimalDigits: 0,
                              symbol: "Rp. "
                            ).format(widget.transaction!.food!.price),
                              style: greyFontStyle.copyWith(fontSize: 13)
                            )
                          ],
                        )
                      ],
                    ),
                    Text("${widget.transaction!.quantity} item(s)")
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text("Detail Transaction", style: blackFontStyle3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(widget.transaction!.food!.name!, style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          decimalDigits: 0,
                          symbol: "Rp. "
                        ).format(widget.transaction!.total),
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("Delivery", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          decimalDigits: 0,
                          symbol: "Rp. "
                        ).format(3000),
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("Tax (10%)", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          decimalDigits: 0,
                          symbol: "Rp. "
                        ).format((widget.transaction!.total! + 3000) / 100 * 10),
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("Total Price", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        NumberFormat.currency(
                          locale: "id-ID",
                          decimalDigits: 0,
                          symbol: "Rp. "
                        ).format((widget.transaction!.total! + (widget.transaction!.total! + 3000) / 100 * 10) + 3000),
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 8),
                  child: Text("Deliver To:", style: blackFontStyle3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("Name", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        widget.transaction!.user!.name!,
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("Phone No", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        widget.transaction!.user!.phoneNumber!,
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("Address", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        widget.transaction!.user!.address!,
                        style: blackFontStyle3,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("House No", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        widget.transaction!.user!.houseNumber!,
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text("City", style: greyFontStyle),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
                      child: Text(
                        widget.transaction!.user!.city!,
                        style: blackFontStyle3,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                )
              ]
            )
          ),
          // Container(
          //   margin: EdgeInsets.only(bottom: defaultMargin),
          //   padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 16),
          //   color: Colors.white,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.only(top: 16, bottom: 8),
          //         child: Text("Order Status", style: blackFontStyle3),
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           SizedBox(
          //             width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
          //             child: Text(widget.transaction!.id.toString(), style: greyFontStyle),
          //           ),
          //           SizedBox(
          //             width: MediaQuery.of(context).size.width / 2 - defaultMargin - 5,
          //             child: Text(
          //               "Success",
          //               style: blackFontStyle3.copyWith(color: Colors.green, fontWeight: FontWeight.w600),
          //               textAlign: TextAlign.end,
          //             ),
          //           )
          //         ],
          //       ),
          //     ]
          //   )
          // ),
          (isLoading) 
            ? Center(child: loadingIndicator) 
            : Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });

                  bool result = await context.read<TransactionCubit>().submitTransactions(widget.transaction!.copyWith(
                    dateTime: DateTime.now(),
                    total: (widget.transaction!.total! + (widget.transaction!.total! + 20000) / 100 * 10).toInt()
                  ));

                  if (result) {
                    Get.to(() => SuccessOrderPage());
                  } else {
                    setState(() {
                      isLoading = false;
                    });

                    Get.snackbar("", "",
                      backgroundColor: "D9435E".toColor(),
                      icon: Icon(MdiIcons.closeCircleOutline, 
                        color: Colors.white),
                      titleText: Text(
                        "Transaction Failed", 
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      messageText: Text(
                        "Please try again later",
                        style: GoogleFonts.poppins(color: Colors.white)
                      )
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: mainColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(
                  "Checkout Now",
                  style: blackFontStyle3.copyWith(fontWeight: FontWeight.w500)
                ),
              ),
            )
        ],
      ),
    );
  }
}
