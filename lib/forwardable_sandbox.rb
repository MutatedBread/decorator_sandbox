require 'forwardable'
require 'pry'

User = Struct.new(:first_name, :last_name)

class UserDecorator
  extend Forwardable

  def self.delegate_to_hash(accessor, methods)
    binding.pry
  end

  def_delegators :@user, :first_name, :last_name

  delegate_to_hash :@user, :lala

  def initialize(user)
    @user = if user.is_a? Hash
      User.new(*user.values_at(:first_name, :last_name))
    else
      user
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

test_user = User.new('James', 'Bond')
test_user_decorator = UserDecorator.new(test_user)

test_user_2 = { first_name: 'Smoke', last_name: 'Bomb'}
test_user_decorator_2 = UserDecorator.new(test_user_2)

binding.pry
