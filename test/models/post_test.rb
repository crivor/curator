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

  test "post link should be unique" do
    other_post = Writer.first.posts.first
    @post.link = other_post.link
    assert_not @post.valid?
  end

  test "post link should not be more than 300 characters" do
    @post.link = "https:test.substack.com/p/" + "a" * 300
    assert_not @post.valid?
  end

end
