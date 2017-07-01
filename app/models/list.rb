class List < ApplicationRecord
  belongs_to :user
  has_many :product_lists, dependent: :destroy
  has_many :products, through: :product_lists
  has_many :favorite_lists

  #Rating
  ratyrate_rateable "name"
  
  #General search
  def self.search(search, options = {} )
    
    @whereString = "1=1"
    @whereOptions = {}
    # user_id validateion
    unless options[:active].nil?
      @whereString.concat(" AND active = :active ") 
      @whereOptions[:active] = options[:active]
    end

    # user_id validateion
    unless options[:user_id].nil?
      @whereString.concat(" AND user_id = :user_id ") 
      @whereOptions[:user_id] = options[:user_id]
    end

    unless search.nil?
      # trim string
      search = search.strip

      # add to where if available
      unless search.empty?
        wildcard_search = "%#{search}%"

        @whereString.concat(" AND name LIKE :search ") 
        @whereOptions[:search] = wildcard_search

      end
    end
    
    includes(:user)
      .where( @whereString, @whereOptions)
      .page(options[:page])
      .per(options[:pages])
      .order('created_at desc')
  end

end
