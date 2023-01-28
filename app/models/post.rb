class Post < ApplicationRecord
  belongs_to :writer

  validates_presence_of :title
  validates_presence_of :pubdate
  validates :link, presence: true,
                    uniqueness: true,
                    length: { maximum: 300 }

  after_commit :log_commit

  scope :recent, -> { includes(:writer).where(:pubdate => 3.days.ago..Time.now).order(pubdate: :desc) }

  private

  def log_commit
    logger.debug("#{title} by #{writer.name} was successfully saved.")
  end

end
