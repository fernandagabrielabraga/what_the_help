require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Donation.destroy_all
Category.destroy_all
Category.create!(name: 'Medical')
Category.create!(name: 'Emergency')
Category.create!(name: 'Education')
Category.create!(name: 'Animals')
Category.create!(name: 'Volunteer')
Category.create!(name: 'Charity')
Category.create!(name: 'Memorial')

# Caso queira adicionar uma categoria nova realizar pelo rails c no Heroku ou criar uma condição
User.destroy_all

def create_user(url, content)
  file = URI.open(url)
  user = User.new(content)
  user.avatar.attach(io: file, filename: 'user.png', content_type: 'image/png')
  user.save
end

create_user('https://res.cloudinary.com/dykf9cult/image/upload/v1661298268/development/16pihv2ddf2qj1p55mdnsq4n6036.jpg', { email: 'angela.hawerroth@gmail.com', password: '123456', first_name: 'Angela', last_name: 'hawerroth Amaral' })

create_user('https://res.cloudinary.com/dykf9cult/image/upload/v1661394371/development/31vrgo5cq8x842r3fhuqer8mwoik.jpg', {  email: 'santiles87@gmail.com', password: '123456', first_name: 'Fernando', last_name: 'Santos'})

create_user('https://res.cloudinary.com/dykf9cult/image/upload/v1661610450/development/WhatsApp_Image_2022-08-27_at_8.25.27_AM_wwv9fx.jpg',{ email: 'fernanda.gabriela.braga@gmail.com', password: '123456', first_name: 'Fernanda Gabriela',last_name: 'Braga' })

create_user('https://res.cloudinary.com/dykf9cult/image/upload/v1661049962/development/7k7sn47ac1qwpp8d1q916g04a2te.jpg', { email: 'fernandaquetcia@gmail.com', password: '123456', first_name: 'Fernanda', last_name: 'Chagas'})


def create_donation(url, content, user)
  file = URI.open(url)
  donation = Donation.new(content)
  donation.image.attach(io: file, filename: 'donation.png', content_type: 'image/png')
  donation.user = user
  donation.save
end

create_donation("https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",{ donation_name: 'Blood Type O-', description: " My friend had an accident and urgently needs type O Negative blood donation.", category: Category.find_by(name: "Medical"), quantity: 12, location: " Galway, Connacht, Ireland" }, User.find(1))
create_donation("https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",{ donation_name: 'Blood Type O-', description: " My friend had an accident and urgently needs type O Negative blood donation.", category: Category.find_by(name: "Medical"), quantity: 12, location: " Galway, Connacht, Ireland" }, User.find(2))
