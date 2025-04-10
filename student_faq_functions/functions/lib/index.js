
const functions = require("firebase-functions")
const admin = require("firebase-admin")

admin.initializeApp()

exports.connectUserWithGroup = functions.firestore.onDocumentCreated("groups/{group}", (event) => {
	const snapshot = event.data;
	if (!snapshot) {
	}
	console.log(snapshot.data)

})
