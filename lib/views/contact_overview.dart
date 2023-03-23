import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nygma/controllers/nostr.dart';

import '../components/cards/app_card.dart';
import '../components/labeled_text_form_field.dart';
import '../controllers/contact_page_controller.dart';
import '../models/nostr_profile.dart';

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
            SizedBox(
              height: 700,
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
                        Get.snackbar("Todo", 'todo');
                      },
                      child: ContactWidget(contact: contact, width: width),
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
  });

  final Profile contact;
  final double width;

  @override
  Widget build(BuildContext context) {
    Widget maybeArrow = Container();
    if (contact.lud16 != null) {
      maybeArrow = const Icon(Icons.arrow_forward);
    }
    return AppCard(
      padding: const EdgeInsets.fromLTRB(23.0, 16.0, 23.0, 15.0),
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
          maybeArrow,
        ],
      ),
    );
  }
}
