module ControllerMacros
  def login_user(role: nil)
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user =  if role.nil?
                FactoryBot.create(:user, role: User.roles[:user])
              else
                FactoryBot.create(:user, role: User.roles[role])
              end
      sign_in user
    end
  end
end
