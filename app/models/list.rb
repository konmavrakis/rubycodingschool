class List < ApplicationRecord
  belongs_to :user
  has_many :product_lists, dependent: :destroy
  has_many :products, through: :product_lists

  def self.search(search, active = 1, page = 1, pages = 9 )
    wildcard_search = "%#{search}%"

    where("active = :active AND name LIKE :search ", active: active,  search: wildcard_search)
      .page(page)
      .per(pages)
      .order('created_at desc')
  end

end
