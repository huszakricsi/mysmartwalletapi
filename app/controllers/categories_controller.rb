class CategoriesController < ApplicationController
  before_action :authenticate_user!
    def getCategories
      categories = Category.where(parent_category_id: nil).map{|category|{ :id => category.id, :label => category.label, :childs => category.childs.map{|childs|{ :id => childs.id, :label => childs.label}}}}
      render json: { 'categories': categories}
    end
  end