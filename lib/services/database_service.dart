import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_faq/models/answer/answer_model.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/models/student_info/student_info.dart';
import 'package:word_generator/word_generator.dart';

import '../models/group/group_model.dart';
import '../models/question/question_model.dart';

class DatabaseService {
  static final db = FirebaseFirestore.instance; // TODO: Add Database
  static const String groups = "groups";
  static const String students = "students"; // TODO: Change to 'users' field
  static const String meetings = "meetings";
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
    } on FirebaseException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
  
  static Future<Iterable<Group>> getGroups() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw FirebaseAuthException(code: "User is not logged in!");
      }
      var userGroups = await db.collection(groups).doc(currentUser.uid).get();
     return userGroups.data()!["groups"];
    }
    on FirebaseException catch (e) {
      rethrow;
    }
    on Exception catch (e){
      rethrow;
    }
  }

  // static assignGroupToUser() async {
  //   try {
  //     await db.collection()
  //   }
  // }

  // static createMeeting(Group group, Meeting meeting) async {
  //   if (group.groupId != null) {
  //     DocumentReference doc = await db
  //         .collection(groups)
  //         .doc(group.groupId)
  //         .collection(meetings)
  //         .add(meeting.toJson())
  //         .then((DocumentReference doc) {
  //       print('DocumentSnapshot added with ID: ${doc.id}');
  //       return doc;
  //     });
  //   }
  // }

  static Meeting getSession(String sessionId) {
    return Meeting(
        sessionName: "sessionName",
        questions: [],
        sessionId: '',
        likes: 0); // TODO: Add Session Fetching
  }

  // static addAnswer(
  //     Group group, Meeting meeting, Question question, Answer answer) async {
  //   if (group.groupId != null && meeting.meetingId != null) {
  //     await db
  //         .collection(groups)
  //         .doc(group.groupId)
  //         .collection(meetings)
  //         .doc(meeting.meetingId)
  //         .collection(questions)
  //         .doc(question.questionId)
  //         .collection(answers)
  //         .add(answer.toJson())
  //         .then((DocumentReference doc) {
  //       print('DocumentSnapshot added with ID: ${doc.id}');
  //     });
  //   }
  //   return true; //TODO:
  // }

  static bool addQuestion(Meeting meeting, Question question) {
    return true; //TODO:
  }

  static createUserData(User user) async {
    try {
      await db.collection("users").doc(user.uid).set(StudentInfo(
          name:
              WordGenerator().randomVerb() + " " + WordGenerator().randomNoun(),
          groups: [],
          meetings: []).toJson());
    } catch (e) {
      rethrow;
    }
  }
}
