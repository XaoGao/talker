module CommentProxy
  class SpamFilter
    def spam?(message)
      message.each do |word|
        return true if words_dictinary.include? word
      end
    end

    private

    def words_dictinary
      %w[trump weather]
    end
  end
end
