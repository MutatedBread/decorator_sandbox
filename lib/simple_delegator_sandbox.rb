require 'delegate'
require 'pry'

User = Struct.new(:first_name, :last_name)

class UserDecorator < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end
end

test_user = User.new('James', 'Bond')
test_user_decorator = UserDecorator.new(test_user)

# binding.pry
