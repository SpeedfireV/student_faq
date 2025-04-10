# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`
from random import randint

from firebase_functions import https_fn, identity_fn
from firebase_admin import initialize_app, firestore
import requests

initialize_app()


@https_fn.on_request()
def on_request_example(req: https_fn.Request) -> https_fn.Response:
    return https_fn.Response("Hello world!")

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
        "name":get_random_name(),
        "groups": [],
        "meetings": []
    }
    doc_ref.set(users_data)