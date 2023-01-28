require "test_helper"

class PostTest < ActiveSupport::TestCase

  def setup
    @writer = Writer.second
    @post = @writer.posts.build(title: "Test Post", pubdate: Time.now, link: "https://stevenfoster.substack.com/p/test")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "post should have writer_id" do
    @post.writer_id = nil
    assert_not @post.valid?
  end

end
