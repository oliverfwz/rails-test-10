class Comment < ActiveRecord::Base
  default_scope { order(id: :desc) }

  belongs_to :user
  belongs_to :parent, class_name: "Comment"
  has_many :children, class_name: "Comment", foreign_key: "parent_id", inverse_of:  :parent

  validates :message, presence: true

  private

  def self.roots
    where(parent_id: nil)
  end
end