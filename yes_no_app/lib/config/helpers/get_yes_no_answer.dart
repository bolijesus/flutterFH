import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/ye_no_model.dart';
import 'package:yes_no_app/presentation/entities/message.dart';

class GetYesNoAnswer {
  
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    
    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}