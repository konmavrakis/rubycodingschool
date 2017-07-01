FavoriteList.delete_all
ProductList.delete_all
List.delete_all
User.delete_all
Product.delete_all

skus_id = {
  1 => "8864706",
  2 => "9672674",
  3 => "3783654",
  4 => "5308163",
  5 => "7426369",
  6 => "10784537",
  7 => "10120744",
  8 => "8901265",
  9 => "10967388",
  10 => "10019099",
  11 => "12005147",
  12 => "10441059",
  13 => "9094925",
  14 => "6929813",
  15 => "5168038",
  16 => "7697410",
  17 => "10991680",
  18 => "3364182",
  19 => "4575334",
  20 => "4575334",
  21 => "5580679",
  22 => "3721",
  23 => "419897",
  24 => "9183094",
  25 => "9526691"
}

users = {
  1 => "giannis",
  2 => "vassilis",
  3 => "epistimi",
  4 => "thanos",
  5 => "ntinos"
}

# Create Products
skus_id.each {|key, value| Product.create(skroutz_id: value) }

# Create Users
users.each do |key, value|
  name = value
  User.create(name: name, email: "#{name}@mail.com", password: "password")
end

# Create Lists
(1..20).each do |x|
  random_user_name = users[rand(users.size).next]
  List.create(name: "List No#{x}",
              user_id: User.find_by(name: random_user_name).id,
              active: true)
end

# Create Product Lists
100.times do
  random_list_id = rand(List.count).next
  random_list = List.find_by(name: "List No#{random_list_id}")
  random_sku_key = rand(skus_id.size).next
  random_sku_value = skus_id[random_sku_key]

  product_list = ProductList.find_by(list_id:  random_list.id, sku_id: random_sku_value)
  unless product_list
    ProductList.create(list_id: random_list.id, sku_id: random_sku_value, quantity: 1)
  else
    product_list.quantity += 1
    product_list.save
  end
end

# Create Favorite Lists
User.all.each do |user|
  rand(7).next.times do
    random_list_id = rand(List.count).next
    random_list = List.find_by(name: "List No#{random_list_id}")
    fav_list = FavoriteList.find_by(list_id: random_list.id, user_id: user.id)
    FavoriteList.create(list_id: random_list.id, user_id: user.id) if fav_list.nil?
  end
end
