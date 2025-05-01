import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseChatService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Send a message
  Future<void> sendMessage(String receiverId, String message) async {
    final sender = _auth.currentUser;
    if (sender == null) return;

    final chatId = getChatId(sender.uid, receiverId);
    final newMessageRef = _database.ref().child('chats/$chatId/messages').push();
    
    await newMessageRef.set({
      'senderId': sender.uid,
      'message': message,
      'timestamp': ServerValue.timestamp,
    });
  }

  // Get chat messages stream
  Stream<DatabaseEvent> getChatMessages(String otherUserId) {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw Exception('User not authenticated');
    }

    final chatId = getChatId(currentUser.uid, otherUserId);
    return _database
        .ref()
        .child('chats/$chatId/messages')
        .orderByChild('timestamp')
        .onValue;
  }

  // Generate a unique chat ID for two users
  String getChatId(String uid1, String uid2) {
    List<String> ids = [uid1, uid2];
    ids.sort(); // Sort to ensure same chat ID regardless of order
    return '${ids[0]}_${ids[1]}';
  }

  // Get user details
  Future<Map<String, dynamic>?> getUserDetails(String uid) async {
    final snapshot = await _database.ref().child('users/$uid').get();
    if (snapshot.exists) {
      return Map<String, dynamic>.from(snapshot.value as Map);
    }
    return null;
  }
} 