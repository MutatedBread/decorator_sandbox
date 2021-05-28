require 'pry'
require 'disposable'
require "disposable/twin/property/hash"

User = Struct.new(:profile)
Profile = Struct.new(:first_name, :last_name)

class UserTwin < Disposable::Twin
  # NOTE: STRUCT
  # property :profile do
  #   property :first_name
  #   property :last_name
  # end

  # NOTE: HASH
  # include Property::Hash
  # property :profile, field: :hash do
  #   property :first_name
  #   property :last_name
  # end

  # NOTE: work for property which is a struct or a hash
  # unnest :first_name, from: :profile
  # unnest :last_name, from: :profile

  feature Composition
  property :first_name, on: :profile
  property :last_name, on: :profile
end

user_hash = UserTwin.new(profile: Profile.new('James', 'Bonds'))
# user_struct_struct = UserTwin.new(User.new(Profile.new('James', 'Bonds')))
# user_struct_hash = UserTwin.new(User.new({ first_name: 'James', last_name: 'Bonds'}))
binding.pry

# https://trailblazer.to/2.1/docs/disposable.html#disposable-twin-api