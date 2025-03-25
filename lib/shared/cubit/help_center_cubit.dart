import 'package:flutter_bloc/flutter_bloc.dart';

class HelpCenterCubit extends Cubit<List<String>> {
  HelpCenterCubit()
      : super([
          "What is Lorem Ipsum? Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.",
          "How does Lorem Ipsum work? Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "Why do we use Lorem Ipsum? Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
          "Where can I get Lorem Ipsum? Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.",
          "Is Lorem Ipsum safe to use? Mauris tincidunt lorem eu ligula efficitur, at malesuada sapien vehicula.",
          "Can I customize Lorem Ipsum? Curabitur et ligula. Ut molestie a, ultricies porta urna.",
          "Are there alternatives to Lorem Ipsum? Vivamus fermentum semper porta.",
          "Can Lorem Ipsum be translated? Integer vehicula fringilla quam.",
        ]);
}
