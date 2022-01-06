import 'package:flutter/material.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

enum Skillevel {junior,middle, senior}

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  bool _checked = false;
  bool _confirmAgreement = true;
  Skillevel? _skillevel = Skillevel.junior;

  void _onCheckedChange(bool? val) {
    setState(() {
      _checked= ! _checked;
    });
  }
  void _onSkillevelChanged(Skillevel? value) {
    setState(() {
       _skillevel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
            body: Center(
                child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(value: _checked, onChanged: _onCheckedChange),
                          const Text('Выбор'),
                        ],
                      ), // состояние виджета- нажат, не нажат
                      CheckboxListTile(
                          title: const Text('Принять условие соглашения'),
                          value: _confirmAgreement , onChanged: (val) {
                            setState(() {
                              _confirmAgreement = ! _confirmAgreement;
                            });
                      }),
                      Row(
                        children: [
                          Switch(value: _checked, onChanged: _onCheckedChange),
                          const Text('Включить')
                        ],
                      ),
                      SwitchListTile(
                        title: const Text('Включить'),
                          value: _checked,
                          onChanged: _onCheckedChange),
                      const Text('Уровень навыков: '),
                      RadioListTile<Skillevel>(
                        title: const Text('junior'),
                        value: Skillevel.junior,
                        groupValue: _skillevel,
                        onChanged: _onSkillevelChanged ,
                      ),
                      RadioListTile<Skillevel>(
                        title: const Text('middle'),
                        value: Skillevel.middle,
                        groupValue: _skillevel,
                        onChanged: _onSkillevelChanged,
                      ),
                      RadioListTile<Skillevel>(
                        title: const Text('senior'),
                        value: Skillevel.senior,
                        groupValue: _skillevel,
                        onChanged: _onSkillevelChanged,
                      ),
                    ]))));
  }
}
