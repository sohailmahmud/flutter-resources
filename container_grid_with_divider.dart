class Earnings extends StatefulWidget {
  static String tag = 'Earnings';
  @override
  EarningsState createState() => new EarningsState();
}

class EarningsState extends State<Earnings> {

  final List<List<double>> charts =
  [
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4,],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4]
  ];

  static final List<String> chartDropdownItems = [ 'Last 7 days', 'Last month', 'Last year' ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: kBaseColor,
          centerTitle: true,
          toolbarHeight: 50,
          leading: IconButton(
            color: kTitleColor,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Earnings', style: TextStyle(fontFamily: 'Segoe', color: kTitleColor)),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Total Earnings', style: TextStyle(fontSize: 15, color: Colors.lightBlue, fontWeight: FontWeight.w500)),
                          Text('৳1,50,000', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 30.0))
                        ],
                      ),
                      Material(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(Icons.timeline, color: Colors.white, size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Colors.teal,
                          shape: CircleBorder(),
                          child: Padding
                            (
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.assignment_turned_in_outlined, color: Colors.white, size: 30.0),
                          )
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('Total Received', style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w700)),
                      Text('৳13,000', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding
                (
                padding: const EdgeInsets.all(24.0),
                child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Colors.amber,
                          shape: CircleBorder(),
                          child: Padding
                            (
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.pending_actions, color: Colors.white, size: 30.0),
                          )
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('Pending Balance', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w700)),
                      Text('৳16,000', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                    ]
                ),
              ),
            ),
            _buildTile(
              Padding (
                  padding: const EdgeInsets.all(20.0),
                  child: Column
                    (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Row
                        (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Column
                            (
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>
                            [
                              Text('Revenue', style: TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.w700)),
                              Text('\৳16,000', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0)),
                            ],
                          ),
                          SizedBox(height: 50,),
                          DropdownButton
                            (
                              isDense: true,
                              value: actualDropdown,
                              onChanged: (String value) => setState(()
                              {
                                actualDropdown = value;
                                actualChart = chartDropdownItems.indexOf(value); // Refresh the chart
                              }),
                              items: chartDropdownItems.map((String title)
                              {
                                return DropdownMenuItem
                                  (
                                  value: title,
                                  child: Text(title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.0)),
                                );
                              }).toList()
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 4.0)),
                      Sparkline
                        (
                        data: charts[actualChart],
                        lineWidth: 5.0,
                        lineColor: Colors.greenAccent,
                      )
                    ],
                  )
              ),
            ),
            _buildTile(
              Padding (
                padding: const EdgeInsets.all(20.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Avg. Earning per month', style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w700)),
                          Text('৳1,300', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0))
                        ],
                      ),
                      Material
                        (
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.microwave, color: Colors.white, size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
              //onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ItemsPage())),
            )
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(2, 220.0),
            StaggeredTile.extent(2, 110.0),
          ],
        )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }
}
