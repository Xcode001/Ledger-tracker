import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

final _keepAnalysisHappy = Intl.defaultLocale;

typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(task) => "Deleted \"${task}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => {
        "activeOrders": MessageLookupByLibrary.simpleMessage("Active Orders"),
        "addOrder": MessageLookupByLibrary.simpleMessage("Add Order"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "clearCompleted":
            MessageLookupByLibrary.simpleMessage("Clear completed"),
        "completedOrders":
            MessageLookupByLibrary.simpleMessage("Completed Orders"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteOrder": MessageLookupByLibrary.simpleMessage("Delete Order"),
        "deleteOrderConfirmation":
            MessageLookupByLibrary.simpleMessage("Delete this order?"),
        "editOrder": MessageLookupByLibrary.simpleMessage("Edit Order"),
        "emptyOrderError":
            MessageLookupByLibrary.simpleMessage("Please enter some text"),
        "filterOrders": MessageLookupByLibrary.simpleMessage("Filter Orders"),
        "markAllComplete":
            MessageLookupByLibrary.simpleMessage("Mark all complete"),
        "markAllIncomplete":
            MessageLookupByLibrary.simpleMessage("Mark all incomplete"),
        "newOrderHint":
            MessageLookupByLibrary.simpleMessage("What needs to be done?"),
        "notesHint":
            MessageLookupByLibrary.simpleMessage("Additional Notes..."),
        "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
        "showActive": MessageLookupByLibrary.simpleMessage("Show Active"),
        "showAll": MessageLookupByLibrary.simpleMessage("Show All"),
        "showCompleted": MessageLookupByLibrary.simpleMessage("Show Completed"),
        "stats": MessageLookupByLibrary.simpleMessage("Stats"),
        "orderDeleted": m0,
        "orderDetails": MessageLookupByLibrary.simpleMessage("Order Details"),
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "undo": MessageLookupByLibrary.simpleMessage("Undo")
      };
}
