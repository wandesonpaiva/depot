class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  has_many :line_items, depedent: :destroy
end
