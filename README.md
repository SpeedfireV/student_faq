# MeetingFAQ

**MeetingFAQ** is a cross-platform application that enhances communication between students and lecturers. It enables real-time question submission during lectures and allows lecturers and students to respond live or after meetings. All Q&A sessions are saved for later review, ensuring accessibility and continuity of discussion.

## 📲 Features

### 👩‍🏫 For Hosts
- Host and manage lecture sessions
- Answer student questions in real-time or post-lecture
- Moderate sessions: delete messages, ban or remove attendees (without knowing their identity)
- Create meetings outside of official university or work schedules
- Define session access: open via link/QR or authenticated (e.g., via Google)
- Temporarily or permanently block attendees from a group or meeting

### 🎓 For Attendees
- Submit questions live during a lecture
- Answer peer questions (clearly marked as other attendee responses)
- Like questions and answers to prioritize them
- View all questions and responses from previous sessions
- Provide feedback on sessions and specific answers

### 🛠 Meeting & Content Management
- Filter meetings by group & date
- Sort sessions by creation date
- Custom session titles and access control
- Join sessions via direct link or QR codes

## 💡 Implementation

### Tech Stack
- **Frontend**: Flutter (with `bloc`, `go_router`, `freezed`, `json_serializable`)
- **Backend**: Python with Firebase Cloud Functions
- **Services**: Firebase Firestore, Storage, Authentication & Analitycs
- **Design**: Figma

### Platforms
- ✅ iOS
- ✅ Android
- 🔜 Web
