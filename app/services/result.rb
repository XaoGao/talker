class Result
  attr_reader :status, :data, :error

  def initialize(status, data = '', error = '')
    @status = status
    @data = data
    @error = error
  end

  def success?
    @status
  end

  def error?
    !@status
  end
end
