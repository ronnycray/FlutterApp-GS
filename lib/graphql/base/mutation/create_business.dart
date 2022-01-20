String createBusinessMutation = """
mutation CreateBusiness(
  \$title: String!
  \$description: String
  \$services: String
  \$address: String
) {
  createBusiness(inputData: {
    title: \$title
    scopeTypeId: 1,
    typeBusiness: INDIVIDUAL,
    description: \$description,
    services: \$services,
    address: \$address,
  }) {
    created
    business {
      id
      title
      address
    }
    error {
      code
      message
    }
  }
}
""";
