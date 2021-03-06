puts 'Cleaning DB - please wait...'

puts 'Destroying user lists...'
UserList.destroy_all

puts 'Destroying items...'
Item.destroy_all

puts 'Destroying lists...'
List.destroy_all

puts 'Destroying users...'
User.destroy_all

puts '🚀 Finished destroying DB'

puts '🚀 Playing God and creating people...'

# SEED USERS
user_first_name = Faker::Name.first_name
user_last_name = Faker::Name.last_name
user_address = Faker::Address.street_address
user_mobile_number = Faker::PhoneNumber.cell_phone

user_one = User.create!(
  first_name: 'Josh',
  last_name: 'Barnes',
  address: '140 Victoria Road, Hawthorn East',
  email: 'josh@gmail.com',
  mobile_number: user_mobile_number,
  password: '123456'
)

user_two = User.create!(
  first_name: 'Elyse',
  last_name: 'Keyser',
  address: '140 Victoria Road, Hawthorn East',
  email: 'elyse@gmail.com',
  mobile_number: user_mobile_number,
  password: '123456'
)

puts "🚀 Created #{user_first_name} #{user_last_name}."

# SEED LISTS

  list_one = List.create!(
    name: 'DIY',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "🚀 Created #{list_one.name}. Let's get shopping!"

  list_two = List.create!(
    name: 'Bobs BBQ',
    due_date: Faker::Date.forward(days: 365)
  )
  puts "🚀 Created #{list_two.name}. Let's get shopping!"

# SEED USER_LISTS

UserList.create!(
  user_id: user_one.id,
  list_id: list_one.id
)

UserList.create!(
  user_id: user_one.id,
  list_id: list_two.id
)

# SEED ITEMS

items_one = [
  'Paint',
  'Indoor plants',
  'Ceramic tiles',
  'Timber',
]

items_two = [
  'Burgers',
  'Kebabs',
  'Salad',
  'Beer',
  'Bread rolls',
  'Playing cards',
  'Cake',
]

item_categories_home = [
  'home_goods_store',
]

item_categories_bbq = [
  'supermarket',
]

###### List group ONE

items_one.each do |item|
  item_category = item_categories_home[rand(0..item_categories_home.length - 1)]
  quantity = rand(1..4)

  Item.create!(
    name: item,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true,
    list_id: list_one.id,
    user_id: UserList.find_by(list_id:list_one.id).user.id
  )
  puts "🚀 Created #{item} in #{item_category}"
end

###### List group TWO

items_two.each do |item|
  item_category = item_categories_bbq[rand(0..item_categories_bbq.length - 1)]
  quantity = rand(1..10)

  Item.create!(
    name: item,
    item_category: item_category,
    quantity: quantity,
    completed: false,
    notification: true,
    list_id: list_two.id,
    user_id: UserList.find_by(list_id:list_two.id).user.id
  )
  puts "🚀 Created #{item} in #{item_category}"
end
