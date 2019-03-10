require 'jwt'

module JSONWebToken
  class HMACToken < Token
    IAT_LEEWAY = 60
    JWT_ALGORITHM = 'HS256'
    JWT_APP_SECRET = 'abrfhifvgcynlpowazefbheydveitmbhgqrwfxk'

    def initialize(secret = JWT_APP_SECRET)
      super()

      @secret = secret
    end

    def self.decode(token, secret = JWT_APP_SECRET, leeway: IAT_LEEWAY, verify_iat: true)
      JWT.decode(token, secret, true, leeway: leeway, verify_iat: verify_iat, algorithm: JWT_ALGORITHM)
    end

    def encoded
      JWT.encode(payload, secret, JWT_ALGORITHM, { typ: 'JWT' })
    end

    private

    attr_reader :secret
  end
end
