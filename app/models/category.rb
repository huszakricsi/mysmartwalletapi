class Category < ApplicationRecord
    belongs_to :parent, :class_name => "Category", :foreign_key => "parent_category_id", optional: true
    has_many :childs, :class_name => "Category", :foreign_key => "parent_category_id"
end
