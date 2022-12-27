# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



5.times do |i|
	product  = Product.create!(name: "Face Masks",
													 	 price: 120,
														 discount_percentage: 10,
														 quantity_sold: 0,
														 company: "AVC",
														 categories: ["Everyday Essentials", "Cleaning Essentials"],
														 product_types: [],
														 description: "1",
														 return_policy: "1",
														 citizen_policy: "1")
	
	product.product_photos.create(photo: File.open('app/assets/images/Product_img.png'))
end

Admin.create!(email: 'thang@gmail.com', password: '123456', password_confirmation: '123456')