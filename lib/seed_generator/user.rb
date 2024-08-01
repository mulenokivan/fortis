require 'faker'
class SeedGenerator::User < SeedGenerator::Base
  def initialize
    generate
  end

  private

  def generate
    password = Faker::Internet.password(min_length: 6)

    User.create!(
      email: Faker::Internet.email,
      password: password,
      password_confirmation: password
    )
  end
end