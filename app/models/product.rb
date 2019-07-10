class Product < ApplicationRecord
belongs_to :supplier
has_many :images

  validates :name, presence: true
  validates :price, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { in: 10..500 }
  validates :image_url, length: { maximum: 255 }
  validates :price, numericality: { greater_than: 0 }
  
  def is_discounted?
    if  price < 10
      return true
    else
      return false
    end
  end
  def tax
    price * 0.09
  end
  def total
    price + tax
  end
  
end

# def supplier
#   Supplier.find_by(id: supplier_id)
# end
# def tax
#     tax_rate = 0.09
#     price * tax_rate
#   end
#   def total
#     price + tax_rate
