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
  static final db = FirebaseFirestore.instance; // TODO: Add Database
  static const String groups = "groups";
  static const String users = "users"; // TODO: Change to 'users' field
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

  static Future<List<String>> getGroupsUids() async {
    try {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var doc = await db.collection(users).doc(uid).get();
      return List<String>.from(doc.data()!['groups'] ?? []);

    }
    on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
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
     return Group.fromJson(userGroups.data()!);
    }
    on FirebaseException catch (e) {
      rethrow;
    }
    on Exception catch (e){
      rethrow;
    }
  }

  static Future<List<Meeting>> getMeetings(String groupId, Meeting? lastFetchedMeeting) async {
    try {
      var group = db.collection(groups).doc(groupId);

      var orderedMeetings = group.collection(meetings).orderBy("creation_date", descending: true);

      if (lastFetchedMeeting != null) {

        orderedMeetings = orderedMeetings.startAfter([lastFetchedMeeting.creationDate]);

      }
        orderedMeetings.limit(10);

        return (await orderedMeetings.get()).docs.map((v) {
          return Meeting.fromJson(v.data());
        }).toList();

    } on FirebaseException catch (e) {
      rethrow;
    } on Exception catch (e) {
      rethrow;
    }
  }

  static Future<Meeting> getMeeting(String groupId, String meetingId) async {
    try {
      var group = db.collection(groups).doc(groupId);
      var meeting = group.collection(meetings).doc(meetingId);
      return Meeting.fromJson((await meeting.get()).data()!);
    }
    on FirebaseException catch (e) {
      rethrow;
    } on Exception catch (e) {
      rethrow;
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
