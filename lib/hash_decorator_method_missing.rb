require 'delegate'
require 'pry'

class HashDecorator < SimpleDelegator
  def initialize(params)
    __setobj__(params)
  end

  def method_missing(m, *args, &blk)
    __getobj__[m]
  end
end

a = HashDecorator.new(a: 1, b: 2)

binding.pry
