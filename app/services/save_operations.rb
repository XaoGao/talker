module SaveOperations
  def transaction(&block)
    begin
      yield
    rescue StandardError => e
      Rails.logger.error e.message
      Rails.logger.error backtrace.join("\n")
    end
  end
end
