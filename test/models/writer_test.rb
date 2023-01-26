require "test_helper"

class WriterTest < ActiveSupport::TestCase

  def setup
    @writer = Writer.new(name: "Testy McTest")
  end

  test "should be valid" do
    assert @writer.valid?
  end

  test "name should be present" do
    @writer.name = " "
    assert_not @writer.valid?
  end
end
