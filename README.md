# done_button_keyboard
<img width="583" alt="Screenshot 2567-04-02 at 06 41 47" src="https://github.com/RAGOpoR/FlutterDoneOverKeyboard/assets/875062/be409559-0fb8-4291-ac4e-e36f2298aadf">

Rendering a "Done" button as an `inputAccessoryView` in Flutter typically involves creating a custom toolbar widget that appears above the keyboard when an input field is focused. In iOS development, `inputAccessoryView` is a property used to attach a custom accessory view, such as a toolbar with buttons, to the top of the keyboard. Flutter doesn't directly use the `inputAccessoryView` concept because it aims to provide a unified way to create UIs that work across platforms. However, you can achieve a similar result by using the `TextField` widget along with a toolbar that shows when the keyboard is active.

To create a custom "Done" button above the keyboard in Flutter, follow these steps:

1. **Create a Focus Node**: Use a `FocusNode` to track whether the text field is focused.
2. **Listen to Keyboard Visibility**: Listen to keyboard visibility changes. When the keyboard is visible and the text field is focused, show the custom toolbar.
3. **Create a Custom Toolbar Widget**: This toolbar will contain the "Done" button. When pressed, the button will unfocus the text field, which hides the keyboard and the toolbar.
4. **Place the Toolbar Widget**: Use a `Stack` widget or another layout strategy to position your toolbar appropriately.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
