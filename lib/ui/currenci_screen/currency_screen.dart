import 'package:currenci_app/presentation/currency_bloc/currency_bloc.dart';
import 'package:currenci_app/ui/currenci_screen/item_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/status.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final bloc = CurrencyBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(GetDateCurrencyEvent('11.06.2024'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<CurrencyBloc, CurrencyState>(
            builder: (context, state) {
              return Row(
                children: [
                  const Text(
                    'VALYUTA',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      _selectDate(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
          backgroundColor: const Color(0xFF6638B7),
          //foregroundColor: Colors.amber,
        ),
        body: BlocConsumer<CurrencyBloc, CurrencyState>(
          listener: (context, state) {
            if (state.status == Status.fail) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage ?? "")));
            }
          },
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (state.status == Status.fail) {
                return const Placeholder();
              } else {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ItemCurrency(state.data, context, index);
                  },
                  itemCount: state.data?.length,
                );
              }
            }
          },
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());

    if (picked != null) {
      context
          .read<CurrencyBloc>()
          .add(GetDateCurrencyEvent(picked.toString().substring(0, 10)));
    } else {}
  }
}
