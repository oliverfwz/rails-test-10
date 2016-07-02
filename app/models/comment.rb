class Comment < ActiveRecord::Base
  default_scope { order(id: :desc) }

  belongs_to :user
  belongs_to :parent, class_name: "Comment"
  has_many :children, class_name: "Comment", foreign_key: "parent_id", inverse_of:  :parent

  validates :message, presence: true

  def descendants
    children.each_with_object(children.to_a) {|child, arr|
      arr.concat child.descendants
    }.uniq
  end

  def self_and_descendants
    [self] + descendants
  end

  private

  def self.roots
    where(parent_id: nil)
  end
end