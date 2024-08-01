require "open-uri"
require 'faker'

class SeedGenerator::Cv < SeedGenerator::Base
  def initialize(user)
    @user = user
    generate
  end

  private

  def generate
    generate_cv
    generate_paragraph(@cv)
    generate_image(@cv)
    rand(1..3).times {|i| generate_paragraph(@cv)}
  end

  def generate_cv
    puts "Generating cv for #{@user.email} ..."

    @cv = @user.cvs.create(
      name: Faker::Name.first_name,
      surname: Faker::Name.last_name,
      patronymic: Faker::Name.middle_name
    )

    avatar = URI.open(Faker::Avatar.image)
    @cv.avatar.attach(
      io: avatar,
      filename: 'default_avatar.png',
      content_type: 'image/png'
    )
  end

  def generate_paragraph(cv)
    puts "Generating paragraph for cv #{@cv.id} ..."

    ActiveRecord::Base.transaction do
      paragraph = Paragraph.create!(text: Faker::Lorem.paragraph(sentence_count: 30))
      ContentBlock.create!(content: paragraph, cv_id: cv.id, position: count_position(cv))
    end
  end

  def generate_image(cv)
    puts "Generating image for cv #{@cv.id} ..."

    file = URI.open(Faker::LoremFlickr.image)

    ActiveRecord::Base.transaction do
      image = Image.create!
      image.file.attach(
        io: file,
        filename: 'default_image.png',
        content_type: 'image/png'
      )
      ContentBlock.create!(content: image, cv_id: cv.id, position: count_position(cv))
    end
  end

  def count_position(cv)
    cv.content_blocks.maximum(:position).to_i + 1
  end
end
