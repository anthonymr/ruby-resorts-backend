require 'jwt'

module JwtToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def jwt_encode(payload, exp: 1.days.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def jwt_decode(token)
    decode = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decode
  end
end
