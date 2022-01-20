String authenticationUserMutation = """
mutation authenticationUser(
  \$email: String!
  \$password: String!
) {
  authenticationUser(inputData: {
    email: \$email
    password: \$password
  }) {
    authenticationStatus
    token
    tokenRefresh
    error {
      code
      message
    }
  }
}
""";
