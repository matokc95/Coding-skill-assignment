enum StatusCodes{
  email_does_not_exist,
  device_already_assigned,
  device_share_request_is_pending,
  device_is_already_shared_to_user
}

extension StatusCodesExtension on StatusCodes {
  String get value {
    switch (this) {
      case StatusCodes.email_does_not_exist:
        return "email_does_not_exist";
      case StatusCodes.device_already_assigned:
        return "device_already_assigned";
      case StatusCodes.device_share_request_is_pending:
        return "Device share request is pending.";
      case StatusCodes.device_is_already_shared_to_user:
        return "Device is already shared to user.";
    }
  }
}