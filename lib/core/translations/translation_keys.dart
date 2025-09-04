import 'package:flutter/material.dart';

import '../cache/cache_key.dart';

abstract class TranslationKeys {
  static const Locale localeEN = Locale(CacheKeys.keyEN);
  static const Locale localeAR = Locale(CacheKeys.keyAR);

  // Welcome screen
  static const String skip = "Skip";
  static const String next = "Next";
  static const String prev = "Prev";
  static const String getStarted = "Get Started";
  static const String chooseProducts = "Choose Products";
  static const String chooseProductsDesc =
      "Browse a wide range of high-quality items tailored to your needs. Whether you're shopping for daily essentials or special treats, we've made it simple to explore, compare, and pick what you love all in just a few taps.";
  static const String makePayment = "Make Payment";
  static const String makePaymentDesc =
      "Pay securely with your preferred method credit card, wallet, or cash on delivery. Fast, encrypted, and hassle-free, so you can complete your order with total peace of mind.";
  static const String getYourOrder = "Get Your Order";
  static const String getYourOrderDesc =
      "Track your order in real-time and get it delivered straight to your doorstep. Fast delivery, real-time updates, and satisfaction guaranteed.";

  // get started screen
  static const String title = "You want\nAuthentic, here\nyou go!";
  static const String description = "Find it here, buy it now!";
  static const String login = "Login";
  static const String register = "Register";

  // login screen
  static const String welcomeLogin = "Welcome\nback!";
  static const String email = "Email";
  static const String password = "Password";

  // register screen
  static const String welcomeRegister = "Create an\naccount";
  static const String name = "Full Name";
  static const String phone = "Phone";
  static const String confirmPassword = "Confirm Password";
  static const String politics =
      "By clicking the Register button, you agree\nto the public offer";

  // validators
  static const String nameRequired = 'Name is required';
  static const String nameLength = 'Name must be at least 3 characters long';
  static const String emailRequired = 'Email is required';
  static const String emailValid = 'Enter a valid email address';
  static const String passwordRequired = 'Password is required';
  static const String passwordLength =
      'Password must be at least 6 characters long';
  static const String confirmPasswordRequired = 'Confirm password is required';
  static const String passwordNotMatch = 'Passwords do not match';
  static const String phoneRequired = 'Phone number is required';
  static const String phoneValid = 'Enter a valid 11-digit phone number';
  static const String fillAllFields = 'Please fill all fields';

  // home screen
  static const String home = "Home";
  static const String items = "Items";
  static const String person = "Person";
  static const String searchHint = "Search any Product..";
  static const String allFeatured = "All Featured";
  static const String recommended = "Recommended";

  // items screen

  // profile screen
  static const String profile = "Profile";
  static const String myProfile = "My Profile";
  static const String save = "Save";
  static const String deleteAccount = "Delete Account";
  static const String myOrders = "My Orders";
  static const String myFavorites = "My Favorites";
  static const String settings = "Settings";
  static const String logout = "Log Out";
  static const String deleteAccountMessage =
      "Are you sure you want to delete account?";
  static const String cancel = "Cancel";
  static const String confirm = "Confirm";
  static const String language = "Language";
  static const String en = "EN";

  static const String ar = "AR";
}
