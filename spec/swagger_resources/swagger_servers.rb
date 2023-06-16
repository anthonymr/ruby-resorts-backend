SWAGGER_SERVERS = [
  {
    url: 'http://{defaultHost}',
    variables: {
      defaultHost: {
        default: 'localhost:3000'
      }
    }
  },
  {
    url: 'https://{defaultHost}',
    variables: {
      defaultHost: {
        default: 'localhost:3000'
      }
    }
  }
].freeze
