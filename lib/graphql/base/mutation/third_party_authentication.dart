String thirdPartyAuthenticationMutation = """
mutation AuthenticationUser(
  \$email: String!
  \$uid: String!
  \$deviceId: String!
  \$displayName: String = null
  \$profilePicture: String = null
  \$accountStatus: StatusUserAccount = null
) {
  authenticationUser(inputData: {
    email: \$email
    uid: \$uid
    deviceId: \$deviceId
    displayName: \$displayName
    profilePicture: \$profilePicture
    accountStatus: \$accountStatus
  }) {
    status
    token
    tokenRefresh
    error {
      message
      code
    }
  }
}
""";
