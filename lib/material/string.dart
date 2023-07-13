import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../controllers/auth_controller.dart';

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
var authController = AuthController.instance;
const String API_KEY = "AIzaSyBHe8sBlQcgucf6kEYVf90qBWVwkxyQS8g";
