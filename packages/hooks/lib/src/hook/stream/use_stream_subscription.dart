import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:utopia_hooks/src/hook/misc/use_value_wrapper.dart';

void useStreamSubscription<T>(Stream<T>? stream, Function(T) block) {
  final wrappedBlock = useValueWrapper(block);
  useEffect(() {
    final subscription = stream?.listen((it) => wrappedBlock.value(it));
    return () => subscription?.cancel();
  }, [stream]);
}
