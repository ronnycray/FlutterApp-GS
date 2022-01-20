String registrationUserMutation = """
mutation registrationUser(
  \$email: String!
  \$password: String!
  \$uid: String!
  \$deviceId: String!
  \$displayName: String = null
  \$profilePicture: String = null
  \$accountStatus: StatusUserAccount = null
) {
  registrationUser(inputData: {
    email: \$email
    password: \$password
    uid: \$uid
    deviceId: \$deviceId
    displayName: \$displayName
    profilePicture: \$profilePicture
    accountStatus: \$accountStatus
  }) {
    registrationSuccess
    token
    refreshToken
    error {
      code
      message
    }
    user {
      id
      email
      firstName
      secondName
      middleName
      phone
      birthday
      accountStatus
      createdAt
      updatedAt
      profilePicture
    }
  }
}
""";
