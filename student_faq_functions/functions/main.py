# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`
import uuid
from random import randint

import firebase_admin.db
from firebase_functions import https_fn, identity_fn, firestore_fn
from firebase_admin import initialize_app, firestore, auth
import requests

initialize_app()

@https_fn.on_call()
def create_group(req: https_fn.CallableRequest):
    db = firestore.client()
    try:
        user_uid = req.auth.uid
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.UNAUTHENTICATED, message="User not logged in!")

    meeting_uid = uuid.uuid4()

    # Create group
    try:
        doc = {
            "name": req.data["name"],
            "description": req.data["description"] if req.data.get("description") else "",
            "black_list": req.data["black_list"] if req.data.get("black_list") else [],
            "description": req.data["description"] if req.data.get("description") else "",
            "members": {
                user_uid: "SuperModerator"
            },
            "sessions": req.data["sessions"] if req.data.get("sessions") else []
        }
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INVALID_ARGUMENT, message="Invalid request data!")

    try:
        db.collection('groups').add(doc, str(meeting_uid))
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INTERNAL, message="Error creating group!")

    # Attach group to user
    try:
        user_groups_snapshot: list[str] = db.collection('users').document(user_uid).get(["groups"]).to_dict()["groups"]
    except Exception as e:
        if e is TypeError:
            raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INVALID_ARGUMENT, message="Groups type doesn't match list[str]!")
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INTERNAL, message="Error getting user groups!")
    user_groups_snapshot.append(str(meeting_uid))
    try:
        db.collection('users').document(user_uid).update({"groups": user_groups_snapshot})
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INTERNAL, message="Error updating user groups!")

@https_fn.on_call()
def delete_group(req: https_fn.CallableRequest):
    db = firestore.client()
    try:
        user_uid = req.auth.uid
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.UNAUTHENTICATED, message="User not logged in!")

    meeting_uid = uuid.uuid4()

    # Create group
    try:
        doc = {
            "name": req.data["name"],
            "description": req.data["description"] if req.data.get("description") else "",
            "black_list": req.data["black_list"] if req.data.get("black_list") else [],
            "description": req.data["description"] if req.data.get("description") else "",
            "members": {
                user_uid: "SuperModerator"
            },
            "sessions": req.data["sessions"] if req.data.get("sessions") else []
        }
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INVALID_ARGUMENT, message="Invalid request data!")

    try:
        db.collection('groups').add(doc, str(meeting_uid))
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INTERNAL, message="Error creating group!")

    # Attach group to user
    try:
        user_groups_snapshot: list[str] = db.collection('users').document(user_uid).get(["groups"]).to_dict()["groups"]
    except Exception as e:
        if e is TypeError:
            raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INVALID_ARGUMENT, message="Groups type doesn't match list[str]!")
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INTERNAL, message="Error getting user groups!")
    user_groups_snapshot.append(str(meeting_uid))
    try:
        db.collection('users').document(user_uid).update({"groups": user_groups_snapshot})
    except Exception as e:
        raise https_fn.HttpsError(code=https_fn.FunctionsErrorCode.INTERNAL, message="Error updating user groups!")





@identity_fn.before_user_created()
def on_user_created(before_user: identity_fn.AuthBlockingEvent) -> identity_fn.BeforeCreateResponse | None:
    def get_random_name() -> str:
        word_site = "https://www.mit.edu/~ecprice/wordlist.10000"
        response = requests.get(word_site)

        WORDS: list[str] = response.content.decode('utf-8').splitlines()
        name = ''
        for i in range(2):
            name += (WORDS[randint(0, len(WORDS)-1)] + " ")
        return name

    db = firestore.client()
    doc_ref = db.collection('users').document(before_user.data.uid)
    users_data = {
        "name": get_random_name(),
        "groups": [],
        "meetings": []
    }
    doc_ref.set(users_data)