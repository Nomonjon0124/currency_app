import 'package:currenci_app/presentation/currency_bloc/currency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/source/remote/response/currency_response.dart';
import '../../utils/language.dart';

Widget ItemCurrency(List<CurrencyModel>? data, BuildContext context, int index) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  nameController.text = '1';
  passwordController.text = '1 USZ';

  _initstate() {
    if (nameController.text != '') {
      passwordController.text = ('${(double.parse(nameController.text)) * (double.parse(data?[index].rate ?? '1'))} UZS').toString();
    } else {
      passwordController.text = '1 UZS';
    }
  }

  double width = MediaQuery.of(context).size.width;
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24,
          boxShadow: [
            BoxShadow(offset: const Offset(4.0, 4.0), color: Colors.grey.shade500, blurRadius: 10, spreadRadius: 1),
            const BoxShadow(offset: Offset(4.0, 4.0), color: Colors.white, blurRadius: 10, spreadRadius: 1),
          ],
          border: Border.all(color: Colors.black26)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?[index].ccyNmUZ ?? "",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '1 ${data?[index].ccy} => ${data?[index].rate} UZS|',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data?[index].diff ?? "",
                      style: TextStyle(
                        fontSize: 14,
                        color: data?[index].diff?[0] == '-' ? Colors.red : Colors.green,
                      ),
                    ),
                    Text(
                      data?[index].date ?? '',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8, right: 8),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black38)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          _initstate();
                                        },
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        controller: nameController,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 8, right: 8),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black38)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {},
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        controller: passwordController,
                                        readOnly: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: width * 0.3,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: const Color(0xFF6638B7), borderRadius: BorderRadius.circular(10)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          Text(
                            "Hisoblash",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ));
}

class ItemCurrencyI extends StatelessWidget {
  final List<CurrencyModel>? data;
  final BuildContext context;
  final int index;

  const ItemCurrencyI({super.key, required this.data, required this.context, required this.index});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    nameController.text = '1';
    passwordController.text = '1 USZ';
    double width = MediaQuery.of(context).size.width;
    _initstate() {
      if (nameController.text != '') {
        passwordController.text = ('${(double.parse(nameController.text)) * (double.parse(data?[index].rate ?? '1'))} UZS').toString();
      } else {
        passwordController.text = '1 UZS';
      }
    }

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white24,
            boxShadow: [
              BoxShadow(offset: const Offset(4.0, 4.0), color: Colors.grey.shade500, blurRadius: 10, spreadRadius: 1),
              const BoxShadow(offset: Offset(4.0, 4.0), color: Colors.white, blurRadius: 10, spreadRadius: 1),
            ],
            border: Border.all(color: Colors.black26)),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getCurrency(context),
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1 ${data?[index].ccy} => ${data?[index].rate} UZS|',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        data?[index].diff ?? "",
                        style: TextStyle(
                          fontSize: 14,
                          color: data?[index].diff?[0] == '-' ? Colors.red : Colors.green,
                        ),
                      ),
                      Text(
                        data?[index].date ?? '',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
            ),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets + const EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, right: 8),
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black38)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          onChanged: (value) {
                                            _initstate();
                                          },
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          controller: nameController,
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 8, right: 8),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.black38)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          onChanged: (value) {},
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          controller: passwordController,
                                          readOnly: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: width * 0.3,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: const Color(0xFF6638B7), borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.white,
                            ),
                            Text(
                              _getCalculateText(context),
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  String _getCurrency(BuildContext context) {
    return switch (context.read<CurrencyBloc>().state.language) {
      Language.uzbekKirill => data?[index].ccyNmUZ ?? '',
      Language.uzbekLatin => data?[index].ccyNmUZ ?? '',
      Language.english => data?[index].ccyNmEN ?? '',
      Language.russian => data?[index].ccyNmRU ?? '',
    };
  }

  String _getCalculateText(BuildContext context) {
    return switch (context.read<CurrencyBloc>().state.language) {
      Language.uzbekKirill => 'Хисоблаш',
      Language.uzbekLatin => 'Hisoblash',
      Language.english => 'Calculate',
      Language.russian => 'Рассчитать',
    };
  }
}
