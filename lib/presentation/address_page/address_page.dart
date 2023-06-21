import 'package:flutter/material.dart';
import 'package:fullfill_user_app/globals/colors.dart';
import 'package:fullfill_user_app/globals/instence.dart';
import 'package:fullfill_user_app/presentation/address_page/providers/address_select_provider.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_bottom_buttons.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_list.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_page_app_bar.dart';
import 'package:fullfill_user_app/presentation/address_page/widgets/address_page_heading.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({
    super.key,
    required this.totalAmount,
    required this.sellerUID,
  });

  final double totalAmount;
  final String sellerUID;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AddressSelectionProvider(),
        builder: (context, _) {
          final addressProvider =
              Provider.of<AddressSelectionProvider>(context);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            addressProvider
                .fetchAddresses(sharedPreferences!.getString("uid")!);
          });

          return Scaffold(
            appBar: buildAppBar(context),
            backgroundColor: backgroundColor,
            body: Column(
              children: [
                buildHeading(),
                buildAddressList(),
                buildBottomButtons(context),
              ],
            ),
          );
        });
  }
}
