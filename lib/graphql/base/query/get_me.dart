String getMeQuery = """
query GetMeQuery {
  getMe {
    user {
      id
      email
      phone
      businesses {
        id
        title
        description
        address
        services
        teams {
          id
          email
          description
          role {
            id
            name
            description
          }
          memberType
          member {
            email
            firstName
            middleName
            profilePicture
          }
        }
      }
      firstName
      profilePicture
      events {
        eventName
        eventDate
      }
    }
    error {
      code
      message
    }
  }
}
""";
