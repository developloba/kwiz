class Errormanager {
  String getMessageFromErrorCode(exception) {
    switch (exception) {
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "wrong-password":
        return "Wrong email/password combination.";
      case "user-not-found":
        return "No user found with this email.";
      case "user-disabled":
        return "User disabled.";
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, please try again later.";

      case "invalid-email":
        return "Email address is invalid.";
      default:
        return "Login failed. Please try again.";
    }
  }
}
