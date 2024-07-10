import 'package:flutter_app/Screens/home.dart';
import 'package:flutter_app/Transfer_ke_bank_lain/form_penerima(6).dart';
import 'package:flutter/material.dart';

class PilihBank extends StatefulWidget {
  final int totalPembayaran;
  final String saranaPembayaran;
  final int nomorRekeningPengirim;

  const PilihBank(
      {super.key,
      required this.totalPembayaran,
      required this.nomorRekeningPengirim,
      required this.saranaPembayaran});

  @override
  State<PilihBank> createState() => _PilihBankState();
}

class _PilihBankState extends State<PilihBank> {
  late List<String> _banks;
  late List<String> _filteredBanks;
  final TextEditingController _bank = TextEditingController();

  @override
  void initState() {
    super.initState();
    _banks = [
      'BRI',
      'CIMB',
      'DANAMON',
      'MANDIRI',
      'OCBC',
      'SEABANK',
      'BCA SYARIAH',
      'BCA DIGITAL',
      'PANIN',
      'PERMATA',
      'MUSTIKA',
      'ALLO BANK',
      'ARTHA GRAHA',
      'BNI',
      'MAYBANK (D/H BII)',
      'MEGA',
      'UOB',
    ];

    _banks.sort();
    _filteredBanks = _banks;
  }

  void _filterBanks(String keyword) {
    setState(() {
      _filteredBanks = _banks
          .where((bank) => bank.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Transfer ke Bank Lain',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.other_houses_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BcaHome()));
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: _filterBanks,
              controller: _bank,
              decoration: InputDecoration(
                labelText: 'Cari Bank',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredBanks.length,
              itemBuilder: (context, index) {
                final selectedBank = _filteredBanks[index];
                return ListTile(
                  title: Text(selectedBank),
                  onTap: () {
                    setState(() {
                      _bank.text = selectedBank;
                    });
                    int nomorRekeningPengirim = widget.nomorRekeningPengirim;
                    String saranaPembayaran = widget.saranaPembayaran;
                    int totalPembayaran = widget.totalPembayaran;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormPenerima(
                              selectedBank: selectedBank,
                              totalPembayaran: totalPembayaran,
                              nomorRekeningPengirim: nomorRekeningPengirim,
                              saranaPembayaran: saranaPembayaran),
                        ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
