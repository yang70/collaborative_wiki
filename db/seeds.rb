# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

titles = ['Rods', 'Reels', 'Lines', 'Flies', 'Dry Fly', 'Nymphing', 'Salt', 'River', 'Lakes']

lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe maiores blanditiis cupiditate voluptatem, repellat illum obcaecati error suscipit praesentium, quisquam optio nam soluta quod molestias eveniet alias? Ipsam et, minima cupiditate maiores provident culpa quae molestias maxime tempora commodi expedita dolorum necessitatibus id magnam eius facere veniam, voluptate mollitia! Saepe sint eligendi numquam debitis consequatur accusantium, a, natus tenetur delectus ut culpa illum dolores reprehenderit, necessitatibus ex et sunt nostrum fugit omnis veniam asperiores. Nihil vel alias error, earum aliquam, ad quo voluptatibus, quam, ducimus exercitationem necessitatibus facere inventore. Eligendi dolorum, eum ducimus dolorem, perspiciatis minima distinctio aut explicabo nemo, fugiat alias dolor ab laboriosam aliquam veritatis sit itaque quibusdam pariatur omnis reiciendis consequuntur sapiente quisquam! Aspernatur perferendis hic blanditiis ad, distinctio, ab voluptatibus ipsa adipisci dolores delectus ea, nemo eligendi ut tempore tempora nihil doloremque, saepe eos natus incidunt minus voluptatum. Earum, voluptates. Eum ab quibusdam assumenda, nobis libero iure facilis cupiditate, neque expedita consequuntur, culpa velit et dolorum suscipit ullam delectus reiciendis. Beatae ipsa ullam architecto iste repudiandae minus totam eos recusandae assumenda, quia eius pariatur asperiores ut eveniet nulla adipisci magnam nesciunt sapiente incidunt, repellat cumque ratione est animi! Facilis magni corporis, cupiditate, dolores quam alias odit."

topics = []

titles.each do |topic|
  topics << Topic.create(title: topic, body: lorem)
end

users = []

(0..8).each do |number|
  user = User.create(email: "example#{number}@example.com", password: "password", password_confirmation: "password")
  user.topics << topics[number]
  users << user
end

5.times do
  users.each do |user|
    user.topics << topics[rand(9)]
  end
end
