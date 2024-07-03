import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/app_exceptions.dart';
import 'package:myapp/bloc/quote_event.dart';
import 'package:myapp/bloc/quote_state.dart';
import 'package:myapp/quote_model.dart';
import 'package:myapp/ui_helper.dart';
import 'package:myapp/urls.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  ApiHelper apiHelper;
  QuoteBloc({required this.apiHelper}) : super(QuoteIntialState()) {
    on<GetQuotesEvent>(
      (event, emit) async {
        emit(QuoteLoadingState());
        try {
          var resJson = await apiHelper.getApi(url: Urls.getQuoteUrl);
          if (resJson != null) {
            var mResData = DataModel.fromJson(resJson);
            emit(QuoteLoadedState(resData: mResData));
          } else {
            emit(QuoteErrorState(errorMessage: "Something went wrong"));
          }
        } catch (e) {
          emit(QuoteErrorState(
              errorMessage: (e as AppExceptions).toErrorMsg()));
        }
      },
    );
  }
}
