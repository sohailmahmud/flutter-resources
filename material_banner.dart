class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('The MaterialBanner is below'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Show MaterialBanner'),
            onPressed: () => ScaffoldMessenger.of(context).showMaterialBanner(
              MaterialBanner(
                content: const Text('Hello, I am a Material Banner'),
                leading: const Icon(Icons.info),
                backgroundColor: Colors.yellow,
                actions: [
                  TextButton(
                    child: const Text('Dismiss'),
                    onPressed: () => ScaffoldMessenger.of(context)
                        .hideCurrentMaterialBanner(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
