import 'package:dio/dio.dart';
import 'package:yes_no_ejemplo/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();
  Future<Message> getAnswer() async {
    final resultSet = await _dio.get('http://yesno.wtf/api');

    return Message(
        text: resultSet.data['answer'],
        imageUrl: resultSet.data['image'],
        fromWho: FromWho.hers);
  }
}
