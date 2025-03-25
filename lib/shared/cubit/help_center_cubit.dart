import 'package:flutter_bloc/flutter_bloc.dart';

class HelpCenterCubit extends Cubit<List<String>> {
  HelpCenterCubit()
      : super([
          "What is Lorem Ipsum? Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum vestibulum. Cras venenatis euismod malesuada.",
          "How does Lorem Ipsum work? Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
          "Why do we use Lorem Ipsum? Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "Where can I get Lorem Ipsum? Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis.",
          "Is Lorem Ipsum safe to use? Mauris tincidunt lorem eu ligula efficitur, at malesuada sapien vehicula. Phasellus feugiat nisl sed eros consequat, id fermentum nisl facilisis.",
          "Can I customize Lorem Ipsum? Curabitur et ligula. Ut molestie a, ultricies porta urna. Vestibulum commodo volutpat a, convallis ac, laoreet enim. Phasellus fermentum in, dolor. Pellentesque facilisis. Nulla imperdiet sit amet magna.",
          "Are there alternatives to Lorem Ipsum? Vivamus fermentum semper porta. Nunc diam velit, adipiscing ut tristique vitae, sagittis vel odio. Maecenas convallis ullamcorper ultricies.",
          "Can Lorem Ipsum be translated? Integer vehicula fringilla quam. Curabitur elit odio, posuere eget erat sit amet, congue laoreet justo. Nulla facilisi. Sed adipiscing blandit metus sit amet viverra.",
        ]);
}
