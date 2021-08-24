module CommentProxy
  class SpamFilter
    def spam?(message)
      words_dictinary.each do |word|
        return true if message.include? word
      end
      false
    end

    private

    def words_dictinary
      %w[trump weather]
    end
  end
end
