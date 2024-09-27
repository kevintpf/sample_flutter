import 'package:sample_flutter/app/di/dependencies.dart';
import 'package:sample_flutter/app/ui/view/app.dart';
import 'package:sample_flutter/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() async {
    await StagingServiceLocator().setup();
    return const App();
  });
}
