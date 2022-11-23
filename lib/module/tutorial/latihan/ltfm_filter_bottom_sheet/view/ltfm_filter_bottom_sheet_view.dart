import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmFilterBottomSheetView extends StatefulWidget {
  const LtfmFilterBottomSheetView({Key? key}) : super(key: key);

  Widget build(context, LtfmFilterBottomSheetController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmFilterBottomSheet"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.tune),
                label: const Text("Filter"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () async {
                  await showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Wrap(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  QDatePicker(
                                    label: "From",
                                    hint: "",
                                    validator: Validator.required,
                                    onChanged: (value) {
                                      print("value: $value");
                                    },
                                  ),
                                  QDatePicker(
                                    label: "To",
                                    hint: "",
                                    validator: Validator.required,
                                    onChanged: (value) {
                                      print("value: $value");
                                    },
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueGrey,
                                            shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Filter"),
                                        ),
                                      )
                                    ],
                                  ),
                                  //! 1. Buat datepicker:
                                  //? datepicker: "From"
                                  //? datepicker: "To"
                                  //! 2. Buat tombol dengan label "FILTER"
                                  //! 3. Ketika di klik, panggil Navigator.pop(context)
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmFilterBottomSheetView> createState() =>
      LtfmFilterBottomSheetController();
}
