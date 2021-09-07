module RequestHelper
  def self.response_body
    JSON.parse(response.body)
  end

  def self.authenticated_header(user)
    token = JwtService.encode({ id: user.id, email: user.email})
    { 'Authorization': "Bearer #{token}" }
  end
end
