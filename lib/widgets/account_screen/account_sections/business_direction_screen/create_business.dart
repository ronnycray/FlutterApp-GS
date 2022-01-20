import 'package:GainSystemsApp/graphql/base/mutation/create_business.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CreateBusinessScreenWidget extends StatefulWidget {
  CreateBusinessScreenWidget({Key? key, required this.updateCurrentTub})
      : super(key: key);

  final Function updateCurrentTub;

  @override
  _CreateBusinessScreenWidgetState createState() =>
      _CreateBusinessScreenWidgetState();
}

class _CreateBusinessScreenWidgetState
    extends State<CreateBusinessScreenWidget> {
  final nameBusinessTextController = TextEditingController();
  final descriptionBusinessController = TextEditingController();
  final servicesBusinessController = TextEditingController();
  final addressBusinessTextController = TextEditingController();
  final addressRegistrationBusinessController = TextEditingController();
  var dateFounderController = TextEditingController(
      text:
          "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}");
  String? nameBusinessError = null;
  String? descriptionBusinessError = null;
  String? servicesBusinessError = null;
  String? addressBusinessError = null;
  String defaultValue = 'Не выбран';
  var listTypesBusinessItems = [
    'Не выбран',
    'ООО',
    'Индивидуальный предприниматель',
    'Самозанятый',
  ];
  var boxSelectionDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(color: Color.fromRGBO(229, 228, 228, 1), width: 0.80),
  );

  TextStyle _errorStyleText() =>
      TextStyle(color: Colors.red, fontSize: 16, fontFamily: 'Gilroy');

  InputDecoration getInputDecoration(String? errorText) {
    return InputDecoration(
        enabled: true,
        errorText: errorText,
        errorStyle: _errorStyleText(),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: Color.fromRGBO(229, 228, 228, 1), width: 2)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromRGBO(229, 228, 228, 1),
              width: 2,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Color.fromRGBO(229, 228, 228, 1),
              width: 2,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: Color.fromRGBO(229, 228, 228, 1), width: 2)));
  }

  void changeSelectValueTypeBusiness(String? newValue) {
    print("newValue ${newValue}");
    setState(() {
      defaultValue = newValue!;
    });
  }

  var colorText = Color.fromRGBO(110, 110, 110, 1);

  ButtonStyle _buttonStyleWidget() {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(111, 207, 151, 1)),
        shadowColor: MaterialStateProperty.all(Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _HeaderCreateBusiness(updateCurrentTub: widget.updateCurrentTub),
          _ImageBusinessWidget(),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Container(
              child: Column(
                children: [
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Название бизнеса',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(70, 70, 70, 1))),
                        SizedBox(height: 10),
                        SizedBox(
                          height: nameBusinessError == null ? 40 : 60,
                          child: TextField(
                              controller: nameBusinessTextController,
                              decoration:
                                  getInputDecoration(nameBusinessError)),
                        )
                      ])),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Тип бизнеса',
                            style: TextStyle(fontSize: 13, color: colorText)),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          decoration: boxSelectionDecoration,
                          height: 39,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                value: defaultValue,
                                isExpanded: false,
                                onChanged: changeSelectValueTypeBusiness,
                                items: listTypesBusinessItems
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(value),
                                    ),
                                  );
                                }).toList()),
                          ),
                        )
                      ])),
                  SizedBox(height: 20),
                  _TitleSectionWidget(
                      colorText: colorText, titleText: 'Информация о бизнесе'),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Описание',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(70, 70, 70, 1))),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLength: 2000,
                              maxLines: null,
                              controller: descriptionBusinessController,
                              decoration:
                                  getInputDecoration(descriptionBusinessError)),
                        )
                      ])),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Услуги',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(70, 70, 70, 1))),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLength: 2000,
                              maxLines: null,
                              controller: servicesBusinessController,
                              decoration:
                                  getInputDecoration(servicesBusinessError)),
                        )
                      ])),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Дата основания',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(70, 70, 70, 1))),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: TextField(
                            controller: dateFounderController,
                            decoration: getInputDecoration(null),
                            onTap: () => pickDate(context),
                          ),
                        )
                      ])),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Адресс',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(70, 70, 70, 1))),
                        SizedBox(height: 10),
                        SizedBox(
                          height: addressBusinessError == null ? 40 : 60,
                          child: TextField(
                              controller: addressBusinessTextController,
                              decoration:
                                  getInputDecoration(addressBusinessError)),
                        )
                      ])),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('Адресс регистрации',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(70, 70, 70, 1))),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLength: 300,
                              maxLines: null,
                              controller: addressRegistrationBusinessController,
                              decoration: getInputDecoration(null)),
                        )
                      ])),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Mutation(
                options: MutationOptions(
                    document: gql(createBusinessMutation),
                    // or do something with the result.data on completion
                    onCompleted: (dynamic resultData) => {
                          if (resultData != null)
                            {
                              print('resultData ${resultData}'),
                              setState(() {
                                widget.updateCurrentTub('myBusinessesScreen');
                              })
                            }
                        }),
                builder: (
                  RunMutation runMutation,
                  QueryResult? result,
                ) =>
                    ElevatedButton(
                        onPressed: () => {
                              if (nameBusinessTextController.text.isEmpty)
                                {
                                  setState(() {
                                    nameBusinessError =
                                        'Название бизнеса отсутствует';
                                    descriptionBusinessError = '';
                                    servicesBusinessError = '';
                                    addressBusinessError = '';
                                  })
                                }
                              else if (descriptionBusinessController
                                  .text.isEmpty)
                                {
                                  setState(() => {
                                        descriptionBusinessError =
                                            'Описание бизнеса отсутствует',
                                        nameBusinessError = '',
                                        servicesBusinessError = '',
                                        addressBusinessError = ''
                                      })
                                }
                              else if (servicesBusinessController.text.isEmpty)
                                {
                                  setState(() => {
                                        servicesBusinessError =
                                            'Описание услуг отсутствует',
                                        nameBusinessError = '',
                                        descriptionBusinessError = '',
                                        addressBusinessError = ''
                                      })
                                }
                              else if (addressBusinessTextController
                                  .text.isEmpty)
                                {
                                  setState(() => {
                                        addressBusinessError =
                                            'Адресс бизнеса отсутствует',
                                        nameBusinessError = '',
                                        descriptionBusinessError = '',
                                        servicesBusinessError = ''
                                      })
                                }
                              else
                                {
                                  print("run!!!"),
                                  runMutation(<String, String>{
                                    'title': nameBusinessTextController.text,
                                    'description':
                                        descriptionBusinessController.text,
                                    'services':
                                        "${servicesBusinessController.text}",
                                    'address':
                                        "${addressRegistrationBusinessController.text}"
                                  })
                                },
                            },
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 30, right: 30, bottom: 15, top: 15),
                          child: Text(
                            'Добавить бизнесс',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Gilroy',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        style: _buttonStyleWidget()),
              ),
            ),
          )
        ],
      )),
    );
  }

  void pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (picked.toString() != dateFounderController)
      setState(() {
        dateFounderController = TextEditingController(
            text: "${picked!.day}.${picked.month}.${picked.year}");
      });
  }
}

class _TitleSectionWidget extends StatelessWidget {
  const _TitleSectionWidget({
    Key? key,
    required this.colorText,
    required this.titleText,
  }) : super(key: key);

  final Color colorText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Container(
              height: 1,
              width: double.infinity,
              color: colorText,
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(titleText,
                    style: TextStyle(
                        fontSize: 13, color: Color.fromRGBO(20, 20, 20, 1))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageBusinessWidget extends StatelessWidget {
  const _ImageBusinessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(196, 196, 196, 1),
                    borderRadius: BorderRadius.all(Radius.circular(100)))),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: 'Изменить',
                    style: const TextStyle(
                        color: Color.fromRGBO(68, 168, 110, 1),
                        fontSize: 14,
                        fontStyle: FontStyle.normal))
              ],
              //   recognizer: ()
              // ..onTap = _pushButtonRegistration,
            )),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class _HeaderCreateBusiness extends StatefulWidget {
  const _HeaderCreateBusiness({
    Key? key,
    required this.updateCurrentTub,
  }) : super(key: key);

  final Function updateCurrentTub;

  @override
  State<_HeaderCreateBusiness> createState() => _HeaderCreateBusinessState();
}

class _HeaderCreateBusinessState extends State<_HeaderCreateBusiness> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        color: Color.fromRGBO(70, 59, 82, 1),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15, top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  widget.updateCurrentTub('myBusinessesScreen');
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.arrow_back_sharp, color: Colors.white),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Добавление бизнеса',
                style: TextStyle(
                    color: Colors.white, fontSize: 19, fontFamily: 'Gilroy'),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
