class Service
  protected

  def success(data)
    Result.new(true, data, nil)
  end

  def error(error, data = '')
    Result.new(false, data, error)
  end
end
