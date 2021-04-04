module CommentProxy
  class CommentAntySpam
    def initialize(comment)
      @comment = comment
    end

    def method_missing(name, *args)
      answer = @comment.send(name, *args)
      check_spam if need_spam_check? name, answer
      answer
    end

    def respond_to_missing?(method, include_private = false)
      methods.include?(method) || super
    end

    private

    def check_spam
      return unless SpamFilter.new.spam? @comment.body

      @comment.update(spam: true)
    end

    def need_spam_check?(name, answer)
      answer == true && (['save', 'update']).include?(name.to_s)
    end
  end
end
