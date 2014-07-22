class Product < ActiveRecord::Base

  before_destroy :ensure_not_referenced_by_any_line_item

  validates_presence_of :title, :description, :image_url, :price
  validates_uniqueness_of :title
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates_length_of :title, :minimum => 10
  validates :image_url, allow_blank: true, format: {
      with:
          %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

  has_many :line_items

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line items present')
    end
  end
end
