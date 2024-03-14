// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: process.env.VITE_FIREBASE_API_KEY,
  authDomain: "mern-paws.firebaseapp.com",
  projectId: "mern-paws",
  storageBucket: "mern-paws.appspot.com",
  messagingSenderId: "928208419327",
  appId: "1:928208419327:web:dc7bebc6cdf61299c18fca"
};

// Initialize Firebase
export const app = initializeApp(firebaseConfig);
