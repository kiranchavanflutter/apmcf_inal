import 'package:farmcare/DataBase/farmerbill.dart';
import 'package:farmcare/Home/FarmerPage.dart';
import 'package:flutter/material.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({super.key});

  @override
  State createState() => _BillsPageState();
}

Map<String, dynamic> product = {
  'FarmerName': '',
  'Date': '',
  'Place': '',
  'Trader': '',
  'Bill': '',
  'Product': '',
  'Quantity': '',
  'Rate': '',
  'Expences': ''
};

class _BillsPageState extends State<BillsPage> {
  DateTime selectedDate = DateTime.now();

  fetchBillData(int index) async {
    List data = await getData();

    product['FarmerName'] = data[index].farmerName;
    product['Date'] = data[index].date;
    product['Place'] = data[index].place;
    product['Trader'] = data[index].traderName;
    product['Bill'] = data[index].totalBill;
    product['Product'] = data[index].product;
    product['Quantity'] = data[index].quantity;
    product['Rate'] = data[index].rate;
    product['Expences'] = data[index].expenses;
    print(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bills'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bills:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            buildBillList(),
          ],
        ),
      ),
    );
  }

  Widget buildBillList() {
    return Expanded(
      child: ListView.builder(
        itemCount: pr.length,
        itemBuilder: (context, index) {
          // print();
          return ListTile(
            title: Text('Product: ${pr[index]}'),
            trailing: ElevatedButton(
              onPressed: () async {
                await fetchBillData(index);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const BillViewPage();
                    },
                  ),
                );
              },
              child: const Text('View'),
            ),
          );
        },
      ),
    );
  }
}

class BillViewPage extends StatefulWidget {
  const BillViewPage({super.key});
  @override
  State createState() => _BillGeneratePageState();
}

class _BillGeneratePageState extends State<BillViewPage> {
  final TextEditingController farmerNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController traderNameController = TextEditingController();
  final TextEditingController billController = TextEditingController();
  final TextEditingController cashController = TextEditingController();
  final TextEditingController expensesController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  final TextEditingController farmerSignatureController =
      TextEditingController();
  final TextEditingController traderSignatureController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bill Generation'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    child: Column(children: [
                      const Text('Farmer Name'),
                      Container(
                        height: 70,
                        width: 150,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 1.2),
                            bottom: BorderSide(color: Colors.black, width: 1.2),
                            left: BorderSide(color: Colors.black, width: 1.2),
                            right: BorderSide(color: Colors.black, width: 1.2),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          product['FarmerName'],
                          style: const TextStyle(fontSize: 25),
                        )),
                      )
                    ]),
                  ),
                  SizedBox(
                    child: Column(children: [
                      const Text('Date'),
                      Container(
                        height: 70,
                        width: 120,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 1.2),
                            bottom: BorderSide(color: Colors.black, width: 1.2),
                            left: BorderSide(color: Colors.black, width: 1.2),
                            right: BorderSide(color: Colors.black, width: 1.2),
                          ),
                        ),
                        child: Center(
                            child: Text(
                          product['Date'],
                          style: const TextStyle(fontSize: 25),
                        )),
                      )
                    ]),
                  ),
                  SizedBox(
                    child: Column(children: [
                      const Text('Place'),
                      Container(
                        height: 70,
                        width: 106,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border(
                            top: BorderSide(color: Colors.black, width: 1.2),
                            bottom: BorderSide(color: Colors.black, width: 1.2),
                            left: BorderSide(color: Colors.black, width: 1.2),
                            right: BorderSide(color: Colors.black, width: 1.2),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            product['Place'],
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  children: [
                    SizedBox(
                      child: Column(children: [
                        const Text('Trader Name'),
                        Container(
                          height: 70,
                          width: 186,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.2),
                              left: BorderSide(color: Colors.black, width: 1.2),
                              right:
                                  BorderSide(color: Colors.black, width: 1.2),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            product['Trader'],
                            style: const TextStyle(fontSize: 25),
                          )),
                        )
                      ]),
                    ),
                    SizedBox(
                      child: Column(children: [
                        const Text('Bill'),
                        Container(
                          height: 70,
                          width: 190,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.2),
                              left: BorderSide(color: Colors.black, width: 1.2),
                              right:
                                  BorderSide(color: Colors.black, width: 1.2),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            '${product['Bill']}',
                            style: const TextStyle(fontSize: 25),
                          )),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: [
                    SizedBox(
                      child: Column(children: [
                        const Text('Product Name'),
                        Container(
                          height: 70,
                          width: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.2),
                              left: BorderSide(color: Colors.black, width: 1.2),
                              right:
                                  BorderSide(color: Colors.black, width: 1.2),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            product['Product'],
                            style: const TextStyle(fontSize: 25),
                          )),
                        )
                      ]),
                    ),
                    SizedBox(
                      child: Column(children: [
                        const Text('Quantity'),
                        Container(
                          height: 70,
                          width: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.2),
                              left: BorderSide(color: Colors.black, width: 1.2),
                              right:
                                  BorderSide(color: Colors.black, width: 1.2),
                            ),
                          ),
                          child: Center(
                              child: Text(
                            product['Quantity'],
                            style: const TextStyle(fontSize: 25),
                          )),
                        )
                      ]),
                    ),
                    SizedBox(
                      child: Column(children: [
                        const Text('Rate'),
                        Container(
                          height: 70,
                          width: 106,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.2),
                              left: BorderSide(color: Colors.black, width: 1.2),
                              right:
                                  BorderSide(color: Colors.black, width: 1.2),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${product['Rate']}',
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: SizedBox(
                  child: Column(children: [
                    const Text('Expenses'),
                    Container(
                      height: 70,
                      width: 406,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border(
                          top: BorderSide(color: Colors.black, width: 1.2),
                          bottom: BorderSide(color: Colors.black, width: 1.2),
                          left: BorderSide(color: Colors.black, width: 1.2),
                          right: BorderSide(color: Colors.black, width: 1.2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '${product['Expenses']}',
                          style: const TextStyle(fontSize: 25),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: SizedBox(
                  child: Text(
                    'Total : ${product['Bill']}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    SizedBox(
                      child: Column(children: [
                        const Text('Trader Signature'),
                        Container(
                          height: 70,
                          width: 186,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.2),
                              left: BorderSide(color: Colors.black, width: 1.2),
                              right:
                                  BorderSide(color: Colors.black, width: 1.2),
                            ),
                          ),
                        )
                      ]),
                    ),
                    SizedBox(
                      child: Column(children: [
                        const Text('Farmer Signature'),
                        Container(
                          height: 70,
                          width: 190,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.2),
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.2),
                              left: BorderSide(color: Colors.black, width: 1.2),
                              right:
                                  BorderSide(color: Colors.black, width: 1.2),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )

        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         _buildInputRow(
        //           'Farmer Name',
        //           farmerNameController,
        //           'Date',
        //           dateController,
        //           'Place',
        //           placeController,
        //         ),
        //         const SizedBox(height: 16.0),
        //         _buildInputRow(
        //           'Trader Name',
        //           traderNameController,
        //           'Bill',
        //           billController,
        //         ),
        //         const SizedBox(height: 16.0),
        //         _buildInputRow(
        //           'Product',
        //           productController,
        //           'Quantity',
        //           quantityController,
        //           'Rate',
        //           rateController,
        //         ),
        //         const SizedBox(height: 1.0),
        //         _buildExpensesSection(),
        //         const SizedBox(height: 1.0),
        //         _buildTotalSection(),
        //         const SizedBox(height: 1.0),
        //         _buildSignatureBoxes(),
        //         const SizedBox(height: 16.0),
        //         // Row(
        //         //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         //   children: [
        //         // ElevatedButton(
        //         //   onPressed: _generateBill,
        //         //   child: const Text('Generate Bill'),
        //         // ),
        //         // ElevatedButton(
        //         //   onPressed: _saveBill,
        //         //   child: const Text('Save Bill'),
        //         // ),
        //         //   ],
        //         // ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }

  Widget _buildInputRow(
    String label1,
    TextEditingController controller1,
    String label2,
    TextEditingController controller2, [
    String? label3,
    TextEditingController? controller3,
  ]) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label1),
              TextField(
                controller: controller1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label2),
              TextField(
                controller: controller2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        if (label3 != null && controller3 != null)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label3),
                TextField(
                  controller: controller3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildExpensesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Expenses'),
        TextField(
          controller: expensesController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  Widget _buildTotalSection() {
    double total = 115.0; // Replace with the actual calculated total

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0),
        Text(
          'Total: $total',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSignatureBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSignatureBox('Farmer Signature', farmerSignatureController),
        _buildSignatureBox('Trader Signature', traderSignatureController),
      ],
    );
  }

  Widget _buildSignatureBox(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Container(
          width: 185.0,
          height: 80.0,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8.0),
            ),
          ),
        ),
      ],
    );
  }
}
