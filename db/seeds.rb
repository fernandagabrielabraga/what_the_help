# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
User.create!(
  email: 'angela.hawerroth@gmail.com',
  password: '123456',
  first_name: 'Angela',
  last_name: 'hawerroth Amaral',
  photo: 'cl_image_tag /images/Angela.png'
)
User.create!(
  email: 'santiles87@gmail.com',
  password: '123456',
  first_name: 'Fernando',
  last_name: 'Santos',
  photo: 'cl_image_tag /images/Fernando.png'
)
User.create!(
  email: 'fernanda.gabriela.braga@gmail.com',
  password: '123456',
  first_name: 'Fernanda Gabriela',
  last_name: 'Braga',
  photo: 'cl_image_tag /images/Gabi.png'
)
User.create!(
  email: 'fernandaquetcia@gmail.com',
  password: '123456',
  first_name: 'Fernanda',
  last_name: 'Chagas',
  photo: 'cl_image_tag current_user.avatar.key'
)
