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

  test "name should be at least two characters" do
    @writer.name = "a"
    assert_not @writer.valid?
  end

  test "name should not be longer than fifty five chacaters" do
    @writer.name = "a" * 56
    assert_not @writer.valid?
  end
end
