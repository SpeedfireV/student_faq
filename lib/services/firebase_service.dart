
import '../models/answer_model.dart';
import '../models/question_model.dart';
import '../models/session_model.dart';

class FirebaseServices {
  static final db = ""; // TODO: Add Database


  static Session getSession(String sessionId) {
    return Session(sessionName: "sessionName", questions: [], sessionId: ''); // TODO: Add Session Fetching
  }

  static bool addAnswer(Session session, Question question, Answer answer) {
    return true; //TODO:
  }

  static bool addQuestion(Session session, Question question) {
    return true; //TODO:
  }


}