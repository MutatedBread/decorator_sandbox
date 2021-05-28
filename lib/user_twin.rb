require 'pry'
require 'disposable'
require "disposable/twin/property/hash"

Profile = Struct.new(:first_name, :last_name)

class UserTwin < Disposable::Twin
  # feature Composition
  include Property::Hash

  property :profile, field: :hash do
    property :first_name
    property :last_name
  end

  # property :first_name, on: :profile
  # property :last_name, on: :profile

  # unnest :first_name, from: :profile
  # unnest :last_name, from: :profile
end

# user = UserTwin.new(profile: Profile.new('Donald', 'Trump'))
# user = UserTwin.new(profile: { first_name: 'Donald', last_name: 'Trump'})
binding.pry

# https://trailblazer.to/2.1/docs/disposable.html#disposable-twin-api