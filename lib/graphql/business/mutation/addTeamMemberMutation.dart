String addTeamMemberMutation = """
mutation CreateBusiness(
  \$email: String!
  \$businessId: Int!
  \$roleId: Int!
  \$description: String
  \$dateFrom: DateTime
  \$dateTo: DateTime
) {
  addTeamMember(inputData: {
    email: \$email,
    description: \$description,
    businessId: \$businessId,
    roleId: \$roleId,
    dateFrom: \$dateFrom,
    dateTo: \$dateTo
  }) {
    added
    teamMember {
      id
      role {
        id
        name
        description
      }
      memberType
      memberStatus
      email
      member {
        birthday
        email
        firstName
        secondName
        phone
        profilePicture
      }
      dateFrom
      dateTo
      description
    }
    error {
      message
      code
    }
  }
}
""";
