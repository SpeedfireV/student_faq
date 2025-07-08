import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_faq/models/answer/answer_model.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/models/student_info/student_info.dart';
import 'package:word_generator/word_generator.dart';

import '../models/group/group_model.dart';
import '../models/question/question_model.dart';

class DatabaseService {
  static final db = FirebaseFirestore.instance;
  static const String groups = "groups";
  static const String users = "users";
  static const String meetings =
      "sessions"; // TODO: Change to meetings + change create_session in Firebase Functions
  static const String questions = "questions";
  static const String answers = "answers";
  static createGroup(Group group) async {
    try {
      group = group.copyWith(members: {
        FirebaseAuth.instance.currentUser!.uid: Access.SuperModerator
      });
      await db
          .collection(groups)
          .add(group.toJson())
          .then((DocumentReference doc) {
        print('DocumentSnapshot added with ID: ${doc.id}');
      });
    } on FirebaseException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>> getGroupsUids() async {
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var doc = await db.collection(users).doc(uid).get();
      return List<String>.from(doc.data()!['groups'] ?? []);
    } on FirebaseAuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future<Group> getGroup(String uid) async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw FirebaseAuthException(code: "User is not logged in!");
      }
      var userGroups = await db.collection(groups).doc(uid).get();
      if (userGroups.data() == null) {
        throw Exception("Group doesn't exist!");
      }
      return Group.fromJson(userGroups.data()!).copyWith(uid: uid);
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future<List<Meeting>> getMeetings(
      String groupId, Meeting? lastFetchedMeeting) async {
    try {
      var group = db.collection(groups).doc(groupId);

      var orderedMeetings =
          group.collection(meetings).orderBy("creationDate", descending: true);

      if (lastFetchedMeeting != null) {
        orderedMeetings =
            orderedMeetings.startAfter([lastFetchedMeeting.creationDate]);
      }
      orderedMeetings.limit(10);

      return (await orderedMeetings.get()).docs.map((v) {
        var meeting = Meeting.fromJson(v.data());
        meeting = meeting.copyWith(uid: v.id, groupUid: groupId);
        return meeting;
      }).toList();
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future<Meeting> getMeeting(String groupId, String meetingId) async {
    try {
      var group = db.collection(groups).doc(groupId);
      var meeting = group.collection(meetings).doc(meetingId);
      return Meeting.fromJson((await meeting.get()).data()!)
          .copyWith(groupUid: groupId, meetingId: meetingId);
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future addMeeting(String groupId, Meeting meeting) async {
    try {
      var meetingsCollection =
          db.collection(groups).doc(groupId).collection(meetings);
      await meetingsCollection.add(meeting.toJson());
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future<List<Question>> getQuestions(
      String groupId, String meetingId, Question? lastFetchedQuestion) async {
    try {
      var questionsCollection = db
          .collection(groups)
          .doc(groupId)
          .collection(meetings)
          .doc(meetingId)
          .collection(questions);
      return (await questionsCollection.get()).docs.map((v) {
        var question = Question.fromJson(v.data());
        question = question.copyWith(
            groupUid: groupId, meetingUid: meetingId, questionId: v.id);
        return question;
      }).toList();
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future<Question> getQuestion(
      String groupId, String meetingId, String questionId) async {
    try {
      var group = db.collection(groups).doc(groupId);
      var meeting = group.collection(meetings).doc(meetingId);
      var question = meeting.collection(questions).doc(questionId);
      return Question.fromJson((await question.get()).data()!).copyWith(
          groupUid: groupId, meetingUid: meetingId, questionId: questionId);
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future addQuestion(
      String groupId, String meetingId, Question question) async {
    try {
      var questionsCollection = db
          .collection(groups)
          .doc(groupId)
          .collection(meetings)
          .doc(meetingId)
          .collection(questions);
      await questionsCollection.add(question.toJson());
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future<List<Answer>> getAnswers(
      String groupId, String meetingId, String questionId) async {
    try {
      var answersCollection = db
          .collection(groups)
          .doc(groupId)
          .collection(meetings)
          .doc(meetingId)
          .collection(questions)
          .doc(questionId)
          .collection(answers);
      return (await answersCollection.get()).docs.map((v) {
        var answer = Answer.fromJson(v.data());
        answer = answer.copyWith(
            groupUid: groupId,
            meetingUid: meetingId,
            questionUid: questionId,
            answerId: v.id);
        return answer;
      }).toList();
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future<Answer> getAnswer(String groupId, String meetingId,
      String questionId, String answerId) async {
    try {
      var group = db.collection(groups).doc(groupId);
      var meeting = group.collection(meetings).doc(meetingId);
      var question = meeting.collection(questions).doc(questionId);
      var answer = question.collection(answers).doc(answerId);
      return Answer.fromJson((await answer.get()).data()!).copyWith(
          groupUid: groupId,
          meetingUid: meetingId,
          questionUid: questionId,
          answerId: answerId);
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  static Future addAnswer(String groupId, String meetingId, String questionId,
      Answer answer) async {
    try {
      var answersCollection = db
          .collection(groups)
          .doc(groupId)
          .collection(meetings)
          .doc(meetingId)
          .collection(questions)
          .doc(questionId)
          .collection(answers);
      await answersCollection.add(answer.toJson());
    } on FirebaseException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  // static addAnswer(
  //     Group group, Meeting meeting, Question question, Answer answers) async {
  //   if (group.groupId != null && meeting.meetingId != null) {
  //     await db
  //         .collection(groups)
  //         .doc(group.groupId)
  //         .collection(meetings)
  //         .doc(meeting.meetingId)
  //         .collection(questions)
  //         .doc(question.questionId)
  //         .collection(answers)
  //         .add(answers.toJson())
  //         .then((DocumentReference doc) {
  //       print('DocumentSnapshot added with ID: ${doc.id}');
  //     });
  //   }
  //   return true; //TODO:
  // }

  static createUserData(User user) async {
    try {
      await db.collection("users").doc(user.uid).set(StudentInfo(
          name:
              "${WordGenerator().randomVerb()} ${WordGenerator().randomNoun()}",
          groups: [],
          meetings: []).toJson());
    } catch (e) {
      rethrow;
    }
  }
}
