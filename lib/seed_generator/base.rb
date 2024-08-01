class SeedGenerator::Base
  def initialize
  end

  def generate
    raise NotImplementedError
  end
end