import 'package:flutter/material.dart';

class FormScreen6 extends StatefulWidget {
  const FormScreen6({super.key});

  @override
  State<FormScreen6> createState() => _FormScreen6State();
}

class _FormScreen6State extends State<FormScreen6> {
  bool switchValue = false;
  bool olahraga = false;
  bool seni = false;
  String selectedRadio = '';
  String nama = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Tampilan Form",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (String value) {
                setState(() {
                  nama = value;
                });
              },
              controller: textEditingController,
              decoration: InputDecoration(
                  labelText: 'Masukan nama',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  )),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Jenis Kelamin :'),
                Radio(
                    value: 'Laki-laki',
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value.toString();
                      });
                    }),
                Text('Laki-laki'),
                Radio(
                    value: 'Perempuan',
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value.toString();
                      });
                    }),
                Text('Perempuan'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CheckboxListTile(
                title: Text('Olahraga'),
                value: olahraga,
                onChanged: (value) {
                  setState(() {
                    olahraga = value!;
                  });
                }),
            CheckboxListTile(
                title: Text('Seni'),
                value: seni,
                onChanged: (value) {
                  setState(() {
                    seni = value!;
                  });
                }),
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
                title: Text('Lulus'),
                value: switchValue,
                onChanged: (value) {
                  switchValue = value;
                }),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade400,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}