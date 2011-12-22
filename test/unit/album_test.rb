require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Album.new.valid?
  end
end
