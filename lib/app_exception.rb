class AppException < StandardError
  attr_accessor :code, :msg

  def initialize(code = nil, msg)
    code ||= "0x00#{rand(100000000)}"
    @code = code
    @msg = msg
  end
end
