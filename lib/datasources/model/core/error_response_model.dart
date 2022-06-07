class ErrorResponseModel {
  ErrorResponseModel({
      this.timestamp, 
      this.status, 
      this.error, 
      this.message, 
      this.path,});

  ErrorResponseModel.fromJson(dynamic json) {
    timestamp = json['timestamp'];
    status = json['status'];
    error = json['error'];
    message = json['message'];
    path = json['path'];
  }
  String? timestamp;
  int? status;
  String? error;
  String? message;
  String? path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = timestamp;
    map['status'] = status;
    map['error'] = error;
    map['message'] = message;
    map['path'] = path;
    return map;
  }

}