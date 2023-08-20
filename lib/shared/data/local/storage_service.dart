/// Storage service interface
abstract class StorageService {
  void init();

  bool get hasInitialized;

  Future<bool> set(String key, String data);

  Future<Object?> get(String key);

  Future<bool> remove(String key);

  Future<void> clear();

  Future<bool> has(String key);
}
