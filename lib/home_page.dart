import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/quote_bloc.dart';
import 'package:myapp/bloc/quote_event.dart';
import 'package:myapp/bloc/quote_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //bloc
    BlocProvider.of<QuoteBloc>(context).add(GetQuotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotes'),
      ),
      body: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {
          if (state is QuoteLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuoteErrorState) {
            return Center(child: Text(state.errorMessage));
          } else if (state is QuoteLoadedState) {
            var mDataModel = state.resData;

            return ListView.builder(
              itemCount: mDataModel.quotes.length,
              itemBuilder: (context, index) {
                var eachQuote = mDataModel.quotes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text(eachQuote.quote),
                      subtitle: Text(eachQuote.author),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
