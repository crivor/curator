class Post < ApplicationRecord
  belongs_to :writer

  validates_presence_of :title
  validates_presence_of :pubdate
  validates :link, presence: true,
                    uniqueness: true
end
