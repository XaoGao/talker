module ArticlePolicy
  class ArticleCreatePolicy
    def initialize(user)
      @user = user
    end

    def self.create?(user)
      new(user).create?
    end

    def create?
      active?
    end

    def active?
      @user.lock == false
    end
  end
end
