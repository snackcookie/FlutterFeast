import 'package:flutter/material.dart';

int key = 0;
int mommugae = 0;

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  List<String> name = ['이름', '나이', '키', '몸무게'];
  double h = 0;
  double w = 0;
  double bmi = 0;

  void _updateBMI(double height, double weight) {
    double heightInMeters = height / 100.0;
    print(height);

    // BMI 계산식
    double result = weight / (heightInMeters * heightInMeters);

    setState(() {
      bmi = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            NameBox(boxname: name, updateBMI: _updateBMI),
            SexCheckbox(),
            BMIresult(bmi: bmi),
          ],
        ),
      ),
    );
  }
}

// InputBox
class NameBox extends StatelessWidget {
  List<String> boxname = [];
  List<String> result = [];
  final void Function(double, double) updateBMI;

  NameBox({super.key, required this.boxname, required this.updateBMI});

  List<Column> getBoxName() {
    List<TextEditingController> controllers = [];
    List<Column> boxColumn = [];
    final textStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );

    for (var i = 0; i < boxname.length; i++) {
      var name = boxname[i];
      controllers.add(TextEditingController());

      boxColumn.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                '$name *',
                style: textStyle,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(
                    hintText: '$name을 입력하세요.',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ]));
    }

    boxColumn.add(Column(
      children: [
        ElevatedButton(
            onPressed: () {
              updateBMI(double.parse('${result[2]}'), double.parse('${result[3]}'));
            },
            child: Text("입력완료"))
      ],
    ));

    return boxColumn;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getBoxName(),
    );
  }
}

// checkbox
class SexCheckbox extends StatefulWidget {
  const SexCheckbox({super.key});

  @override
  State<SexCheckbox> createState() => _SexCheckboxState();
}

class _SexCheckboxState extends State<SexCheckbox> {
  bool maleChecked = false;
  bool femaleChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '성별',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                title: Text(
                  '남성',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                value: maleChecked,
                onChanged: (value) {
                  setState(() {
                    maleChecked = value!;
                    if (value!) {
                      femaleChecked = false;
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            Expanded(
              child: CheckboxListTile(
                title: Text('여성',
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                value: femaleChecked,
                onChanged: (value) {
                  setState(() {
                    femaleChecked = value!;
                    if (value!) {
                      maleChecked = false;
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}

// BMI 결과 값
class BMIresult extends StatelessWidget {
  // VoidCallback result;
  double bmi ;

  BMIresult({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'BMI지수 결과',
            style: textStyle,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
            width: double.infinity,
            height: 40.0,
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Text("$bmi")
      ],
    );
  }
}