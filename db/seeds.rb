# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Offer.destroy_all
Order.destroy_all
Business.destroy_all
Supplier.destroy_all
Comment.destroy_all


lara = User.new({
  first_name: 'Lara',
  last_name: "Keen",
  email: "lara@bulkers.com",
  password: "lara@bulkers.com",
  admin: true;
})
lara.save

laura = User.new({
  first_name: 'Laura',
  last_name: "Gil",
  email: "laura@bulkers.com",
  password: "laura@bulkers.com",
  admin: true;
})
laura.save

david = User.new({
  first_name: 'David',
  last_name: "Mendoza",
  email: "david@bulkers.com",
  password: "david@bulkers.com",
  admin: true;
})
david.save

judith = User.new({
  first_name: 'Judith',
  last_name: "van Leersum",
  email: "judith@bulkers.com",
  password: "judith@bulkers.com",
  admin: true;
})
judith.save


supplier1 = Supplier.create(name: "Ikea")
supplier2 = Supplier.create(name: "Amaia Polanco")
supplier3 = Supplier.create(name: "Fusteria Joan & Maria")
supplier4 = Supplier.create(name: "Gaia artisans")
supplier5 = Supplier.create(name: "Flower's and smiles")
    
    
CATEGORIES = %w(furniture textiles decoration kitchenware\ &\ dinnerware take\ away pots\ &\ plants outdoor)

offer_1 = Offer.new(
  name: "Organic take-away cups",
  initial_price: 1.89,
  target_price: 0.99,
  target_volume: 1000,
  supplier_offer_id: "www.lewagon.com",
  status: "active",
  description: "Beautiful take-away cups that are created in an organic way and only uses recycled news papers that were collected from schools.",
  category: CATEGORIES[4],
)
offer_1.user = User.all.sample
offer_1.supplier = Supplier.all.sample
offer_1.save

offer_2 = Offer.new(
  name: "Wooden bar stools",
  initial_price: 16.99,
  target_price: 14.89,
  target_volume: 200,
  supplier_offer_id: "www.lewagon.com",
  status: "active",
  description: "Steady and nice wooden bar stools made from mahogany wood. ",
  category: CATEGORIES[0],
)
offer_2.user = User.all.sample
offer_2.supplier = Supplier.all.sample
offer_2.save

offer_3 = Offer.new(
  name: "Blue/red table cloths",
  initial_price: 4.39,
  target_price: 3.99,
  target_volume: 300,
  supplier_offer_id: "www.lewagon.com",
  status: "active",
  description: "Table cloths for square tables of 80x80cm. They can also be used for outside tables.",
  category: CATEGORIES[1],
)
offer_3.user = User.all.sample
offer_3.supplier = Supplier.all.sample
offer_3.save

offer_4 = Offer.new(
  name: "Golden candle holders",
  initial_price: 8.89,
  target_price: 5.99,
  target_volume: 2000,
  supplier_offer_id: "www.lewagon.com",
  status: "active",
  description: "Candle holders with monkeys on the side, gold plated but very long lasting",
  category: CATEGORIES[2],
)
offer_4.user = User.all.sample
offer_4.supplier = Supplier.all.sample
offer_4.save

offer_5 = Offer.new(
  name: "Ceramic plates and bowls",
  initial_price: 5.89,
  target_price: 3.99,
  target_volume: 750,
  supplier_offer_id: "www.lewagon.com",
  status: "active",
  description: "Ceramic plats and matching bowls, 2-for-1 pack, with a black/white marble pattern",
  category: CATEGORIES[3],
)
offer_5.user = User.all.sample
offer_5.supplier = Supplier.all.sample
offer_5.save

offer_6 = Offer.new(
  name: "Plant pots with green and yellow pattern",
  initial_price: 7.89,
  target_price: 6.29,
  target_volume: 420,
  supplier_offer_id: "www.lewagon.com",
  status: "active",
  description: "These plant pots are 30 cm high and 15cm wide. They are for outside, but also look beatiful inside.",
  category: CATEGORIES[5],
)
offer_6.user = User.all.sample
offer_6.supplier = Supplier.all.sample
offer_6.save

offer_7 = Offer.new(
  name: "Garden Gnomes",
  initial_price: 5.89,
  target_price: 3.99,
  target_volume: 100,
  supplier_offer_id: "www.lewagon.com",
  status: "active",
  description: "These happy gnomes are perfect for welcoming your guests at the entrance",
  category: CATEGORIES[6]
)
offer_7.user = User.all.sample
offer_7.supplier = Supplier.all.sample
offer_7.save



15.times do {
  order = Order.new(
  amount: rand(10..300))
  order.user = User.all.sample
  order.offer = Offer.all.sample
  order.save
}


  comment = Comment.new(content: "They are the best cups ever, and if you plant them dandillions grow out of them <3 ")
  comment.offer = Offer.find(1)
  comment.user = User.all.sample
  comment2 = Comment.new(content: "Best wooden stools in the world, I feel save now")
  comment.offer = Offer.find(2)
  comment.user = User.all.sample
  comment3 = Comment.new(content: "Soft and nice, not that modern but it is nice")
  comment.offer = Offer.find(3)
  comment.user = User.all.sample
  comment4 = Comment.new(content: "Are you sure it is going to be delivered on Sunday?")
  comment.offer = Offer.find(4)
  comment.user = User.all.sample
  comment5 = Comment.new(content: "Do you maybe know the size? i tried to buy some before but I always struggle")
  comment.offer = Offer.find(5)
  comment.user = User.all.sample
  comment6 = Comment.new(content: "Are you sure it is going to be delivered on Sunday?")
  comment.offer = Offer.find(6)
  comment.user = User.all.sample
  comment7 = Comment.new(content: "Do you maybe know the size? i tried to buy some before but I always struggle")
  comment.offer = Offer.find(7)
  comment.user = User.all.sample