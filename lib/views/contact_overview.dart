import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/constants/colors.dart';
import 'package:nygma/controllers/nostr.dart';
import 'package:nygma/views/quorum_page.dart';

import '../components/buttons/gradient_button.dart';
import '../components/cards/app_card.dart';
import '../components/labeled_text_form_field.dart';
import '../controllers/contact_page_controller.dart';
import '../models/nostr_profile.dart';
import 'index_or_login.dart';

class ContactOverView extends StatelessWidget {
  final NostrControlller nostrControlller = Get.put(NostrControlller());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: GetX<ContactPageController>(builder: (controller) {
        if (controller.contacts.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 10),
            child: Text("Fetching contacts...".tr),
          );
        }
        return Column(
          children: [
            SizedBox(
              height: 100,
              child: LabeledTextFormField(
                label: "Search contacts",
                controller: controller.searchLNAddressController,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                  child: Text(
                    "Contact(s) selected: ${controller.numberSelected()}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: GradientButton(
                      onPressed: () {
                        if (controller.selectedContacts.length < 2) {
                          Get.snackbar("You need at least 2 shares",
                              "We suggest selecting a minimum of 4 contacts.");
                          return;
                        }
                        Get.to(QuorumPage());
                      },
                      child: const Text(
                        'Backup',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 600,
              child: ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemCount: controller.shownContacts.length + 1,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    if (i == controller.shownContacts.length) {
                      return const SizedBox(
                        height: 30,
                      );
                    }
                    String key = controller.shownContacts.keys.elementAt(i);
                    Profile contact = controller.contacts[key]!;
                    return InkWell(
                      onTap: () {
                        controller.toggleSelected(contact);
                      },
                      child: ContactWidget(
                          contact: contact,
                          width: width,
                          selected: controller.isSelected(contact)),
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.contact,
    required this.width,
    required this.selected,
  });

  final Profile contact;
  final double width;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.fromLTRB(23.0, 16.0, 23.0, 15.0),
      background: selected ? kAccentColor : kOffGreyColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              "https://imgproxy.iris.to/insecure/plain/${contact.picture}",
              height: 60,
              errorBuilder: (context, error, stackTrace) => Image.network(
                "https://robohash.org/kwinten",
                width: 60,
              ),
            ),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name ?? contact.name!,
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    contact.lud16 ?? "",
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
    );
  }
}
