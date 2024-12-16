import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/button/button_builder.dart';

class PaymentPolicy extends StatefulWidget {
  const PaymentPolicy({super.key});

  @override
  State<PaymentPolicy> createState() => _PaymentPolicyState();
}

class _PaymentPolicyState extends State<PaymentPolicy> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return ScaffoldF(
      appBar: AppBar(
        title: Text(
          lang.paymentPolicy,
          style: theme.textTheme.labelLarge!.copyWith(fontSize: 23.sp),
        ),
        titleSpacing: 40.0,
        backgroundColor: const Color(0xFF2E1371),
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 28,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h,),
            SingleChildScrollView(
              child: Container(
                width: 350.w,
                height: 990.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Color(0xFF2F1472).withOpacity(.69),
                    border: Border.all(color: Color(0xFF815AE2), width: 1)),
                padding: EdgeInsets.all(16.sp),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        lang.currency,
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                       lang.allTransactionsOnYourSeatWillBeProcessedInLocalCurrency,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        lang.paymentTiming,
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        lang.paymentsMustBeCompletedAtTheTimeOfBookingYourBookingWillOnlyBeConfirmedUponSuccessfulPaymentPartialPaymentsAreNotAcceptedFullPaymentIsRequiredForTicketConfirmation,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        lang.bookingConfirmation,
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                       lang.oncePaymentIsSuccessfulAConfirmationEmailWithTicketDetailsAndBookingInformationWillBeSentToTheRegisteredEmailAddressIfYouDoNotReceiveAConfirmationWithinThirtyMinutesOfPaymentPleaseContactOurSupportTeamAtSupportYourSeatCom,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        lang.cancellationsRefunds,
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                       lang.ifCanceledMoreThanTwelveHoursBeforeTheMovie_sStartTimeTheCustomerIsEligibleForAFullRefundIfCanceledWithinTwelveHoursButMoreThanThirtyMinutesBeforeTheMovie_sStartTimeTheCustomerWillReceiveFiftyOutOfAHundredOfTheTicketAmountAsARefundCancellationsMadeLessThanThirtyMinutesBeforeTheMovie_sStartTimeAreNonRefundableRefundProcessInEligibleCasesRefundsWillBeCreditedBackToTheOriginalPaymentMethodWithinFive_TenBusinessDaysBankProcessingTimesMayVary,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        lang.serviceFees,
                        style: theme.textTheme.labelLarge!
                            .copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                       lang.anyServiceOrProcessingFeesAssociatedWithTheBookingAreNonRefundable,
                        style: theme.textTheme.bodyMedium!.copyWith(fontSize:14.sp),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height:10.h,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            activeColor: Color(0xFF9B51E0),
                            checkColor: Colors.black,
                            shape: CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),

                          Text(
                           lang.iAgreeWithPrivacyPolicy,
                            style:theme.textTheme.bodyMedium!.copyWith(fontSize:16.sp,fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            SizedBox(height:50.h,),
            ButtonBuilder(text:lang.continnue, onTap: () {  },),
            SizedBox(height:50.h,),
          ],
        ),
      ),
    );
  }
}
