class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: "Comment"

  validates :message, presence: true
end