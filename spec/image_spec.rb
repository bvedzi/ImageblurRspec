require 'spec_helper'

RSpec.describe Image, type: :model do
  describe "blurring should work" do
    it "should blur a standard image" do
      input = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]

      expected = [
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 1, 0, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0]
      ]
     image = Image.new(input.map(&:dup))
     expect(image.blur.data).to eq expected

     expect(image.data).to eq(input)
    end
  end
end