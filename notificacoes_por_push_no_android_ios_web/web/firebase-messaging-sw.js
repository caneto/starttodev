importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyBa12-3DjLD2g1DscFvgqTKVgfQsNEnaxg",
  authDomain: "projeto-fcn.firebaseapp.com",
  databaseURL: "https://projeto-fcn.firebaseapp.com",
  projectId: "projeto-fcn",
  storageBucket: "projeto-fcn.appspot.com",
  messagingSenderId: "197481453503",
  appId: "1:197481453503:web:7135f3ce55c2e68770b30a",
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});