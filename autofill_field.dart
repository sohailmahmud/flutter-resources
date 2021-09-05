SizedBox(
                  height: 10.0,
                ),
                TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontStyle: FontStyle.italic),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'What are you looking for?'),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await BackendService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      leading: Icon(Icons.person_add),
                      title: Text(suggestion['name']),
                      subtitle: Text('\$${suggestion['mobile']}'),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PatientPage(patient: suggestion)));
                  },
                ),
