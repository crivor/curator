class Post < ApplicationRecord
  belongs_to :writer

  validates_presence_of :title
  validates_presence_of :pubdate
  VALID_LINK_REGEX = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/\/=]*)/
  validates :link, presence: true,
                    uniqueness: true,
                    length: { maximum: 300 },
                    format: { with: VALID_LINK_REGEX }

  after_commit :log_commit

  scope :recent, -> { includes(:writer).where(:pubdate => 3.days.ago..Time.now).order(pubdate: :desc) }

  private

  def log_commit
    logger.debug("#{title} by #{writer.name} was successfully saved.")
  end

end
