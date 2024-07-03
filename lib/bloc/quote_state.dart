
import 'package:myapp/quote_model.dart';

abstract class QuoteState {}

class QuoteIntialState extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteLoadedState extends QuoteState {
  DataModel resData;
  QuoteLoadedState({required this.resData});
}

class QuoteErrorState extends QuoteState {
  String errorMessage;
  QuoteErrorState({required this.errorMessage});
}


