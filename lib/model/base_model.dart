abstract class BaseModel {
  BaseModel.fromJSON(Map<String, dynamic> json);
  void withError(String error);
}