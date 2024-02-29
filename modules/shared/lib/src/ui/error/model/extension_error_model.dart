import 'error_model.dart';

extension ToModel on Object {
  ErrorModel toModel() {
    return ErrorModel(title: "Something went wrong", body: "Please try again");
  }
}
