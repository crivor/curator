class Post < ApplicationRecord
  belongs_to :writer

  validates_presence_of :title
  validates_presence_of :pubdate
  validates :link, presence: true,
                    uniqueness: true

  scope :recent, -> { where(:pubdate => 2.days.ago..Time.now).order(pubdate: :desc) }

end
