class Prescription extends StatefulWidget {
  Prescription({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PrescriptionState createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = new GlobalKey();
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> gender = [
    {
      'value': 'male',
      'label': 'Male',
    },
    {
      'value': 'female',
      'label': 'Female',

      /*'icon': Icon(Icons.fiber_manual_record),
      'textStyle': TextStyle(color: Colors.red),*/
    },
  ];

  final List<String> _dropdownValues = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five"
  ];

  int genderValue;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBackgroundColor,
            toolbarHeight: 55.0,
            elevation: 0.0,
            bottom: TabBar(
                unselectedLabelColor: kBaseColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [kDashBoxColor, kDashBoxColor]),
                    borderRadius: BorderRadius.circular(50),
                    color: kDashBoxColor),
                tabs: [
                  Tab(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: kDashBoxColor, width: 1.2)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("New Patient", style: TextStyle(fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: kDashBoxColor, width: 1.2)),

                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Old Patient", style: TextStyle(fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(
              children: <Widget>[
                Container(
                  color: kResendBtnColor,
                  padding: EdgeInsets.only(bottom: 300),

                ),
                Container(
                  color: kPrimaryColor,
                  padding: EdgeInsets.only(bottom: 300),

                ),
                //Icon(Icons.movie),
            ]
          ),
        ),
    );
  }
}

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'name': query + index.toString(), 'mobile': Random().nextInt(100)};
    });
  }
}

class CitiesService {
  static final List<String> cities = [
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text('What is your favorite city?'),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(labelText: 'City'),
                controller: this._typeAheadController,
              ),
              suggestionsCallback: (pattern) {
                return CitiesService.getSuggestions(pattern);
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (suggestion) {
                this._typeAheadController.text = suggestion;
              },
              validator: (value) =>
              value.isEmpty ? 'Please select a city' : null,
              onSaved: (value) => this._selectedCity = value,
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                if (this._formKey.currentState.validate()) {
                  this._formKey.currentState.save();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content:
                      Text('Your Favorite City is ${this._selectedCity}'),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class ScrollExample extends StatelessWidget {
  final List<String> items = List.generate(5, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Suggestion box will resize when scrolling"),
        ),
      ),
      SizedBox(height: 200),
      TypeAheadField<String>(
        getImmediateSuggestions: true,
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'What are you looking for?'),
        ),
        suggestionsCallback: (String pattern) async {
          return items
              .where((item) =>
              item.toLowerCase().startsWith(pattern.toLowerCase()))
              .toList();
        },
        itemBuilder: (context, String suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (String suggestion) {
          print("Suggestion selected");
        },
      ),
      SizedBox(height: 500),
    ]);
  }
}

class PatientPage extends StatelessWidget {
  final Map<String, dynamic> patient;

  PatientPage({this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text(
              this.patient['name'],
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              this.patient['mobile'],
              style: Theme.of(context).textTheme.subtitle1,
            )
          ],
        ),
      ),
    );
  }
}

class PatientModel {
  final String id;
  final DateTime createdAt;
  final String name;
  final String avatar;

  PatientModel({this.id, this.createdAt, this.name, this.avatar});

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PatientModel(
      id: json["id"],
      createdAt:
      json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<PatientModel> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => PatientModel.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return this?.createdAt?.toString()?.contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(PatientModel model) {
    return this?.id == model?.id;
  }

  @override
  String toString() => name;
}
