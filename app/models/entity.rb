class Entity < ApplicationRecord
  belongs_to :parent, class_name: 'Entity', optional: true
  has_many :children, class_name: 'Entity', foreign_key: 'parent_id'

  enum entity_type: {
    network: 'Network',
    school: 'School',
    class: 'Class'
  }

  validates :name, presence: true
  validates :entity_type, presence: true
  validate :class_must_have_parent

  def subtree_ids
    children.pluck(:id)
  end

  private

  def class_must_have_parent
    if class? && parent.nil?
      errors.add(:parent_id, "Class must have a parent (Network or School)")
    end
  end
end
