require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
  when 'development'

  # when 'test'
  # test-specific seeds ...
  # (Consider having your tests set up the data they need
  # themselves instead of seeding it here!)

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

    create_user(
      'https://res.cloudinary.com/dykf9cult/image/upload/v1661298268/development/16pihv2ddf2qj1p55mdnsq4n6036.jpg',
      { email: 'angela.hawerroth@gmail.com', password: '123456', first_name: 'Angela', last_name: 'Hawerroth Amaral' })

    create_user(
      'https://res.cloudinary.com/dykf9cult/image/upload/v1661394371/development/31vrgo5cq8x842r3fhuqer8mwoik.jpg',

      {  email: 'santiles87@gmail.com', password: '123456', first_name: 'Fernando', last_name: 'Santos'})

    create_user(
      'https://res.cloudinary.com/dykf9cult/image/upload/v1661610450/development/WhatsApp_Image_2022-08-27_at_8.25.27_AM_wwv9fx.jpg',

      { email: 'fernanda.gabriela.braga@gmail.com', password: '123456', first_name: 'Fernanda Gabriela',last_name: 'Braga' })

    create_user(
      'https://res.cloudinary.com/dykf9cult/image/upload/v1661049962/development/7k7sn47ac1qwpp8d1q916g04a2te.jpg',

      { email: 'fernandaquetcia@gmail.com', password: '123456', first_name: 'Fernanda', last_name: 'Chagas'})

    create_user(
      'https://res.cloudinary.com/dykf9cult/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1662079910/development/WhatsApp_Image_2022-09-01_at_6.36.58_PM_hkp2is.jpg',

      { email: 'maria@gmail.com', password: '123456', first_name: 'Maria', last_name: 'Santos'})

    create_user(
      'https://res.cloudinary.com/dykf9cult/image/upload/v1662080002/development/WhatsApp_Image_2022-09-01_at_6.44.43_PM_c78g0g.jpg',

      { email: 'cmb_blumenau@cmb.com', password: '123456', first_name: 'Maria', last_name: 'Cavalcanti'})

    create_user(
      'https://res.cloudinary.com/dykf9cult/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1662079988/development/WhatsApp_Image_2022-09-01_at_6.34.18_PM_qxcvtr.jpg',

      { email: 'anthony.watts@gmail.com', password: '123456', first_name: 'Anthony ', last_name: 'Watts'})


    def create_donation(url, content, user)
      file = URI.open(url)
      donation = Donation.new(content)
      donation.image.attach(io: file, filename: 'donation.png', content_type: 'image/png')
      donation.user = user
      donation.save
    end

    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Blood Type O-', description: " My friend had an accident and urgently needs type O Negative blood donation.",
        category: Category.find_by(name: "Medical"), quantity: 12, location: " Galway, Connacht, Ireland" },
        User.find_by(email:"angela.hawerroth@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Agasalho Infantil', description: "Preciso de agasalhos para meu filho de 8 anos e  minhas filhas de 4 anos. Estou desempregada e o salário do meu esposo só é suficiente para pagar as despesas mensais da casa.",
        category: Category.find_by(name: "Charity"), quantity: 40, location: "Curitiba, Paraná, Brasil" },
        User.find_by(email:"maria@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Brinquedos', description: "Brinquedos educativos que ajudam no aprendizado e na imaginação. Brinquedos voltados para crianças do pré-escolar de uma escola que perdeu todo o seu material em uma catástrofe natural.",
        category: Category.find_by(name: "Education"), quantity: 120, location: " Blumenau, Santa Catarina, Brasil" },
        User.find_by(email:"cmb_blumenau@cmb.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Books', description: "Portuguese and English Books to teach and incentive children and youth in the Casa Vida to read. To know well who are you going to help, Casa Vida is an organization that gives support for children and   youth. Casa Vida focuses its care on restoring the health, well-being and self-esteem of girls victims of violence and sexual abuse in Timor-Leste.",
        category: Category.find_by(name: "Education"), quantity: 200, location: " Lecidere, Dili, East Timor " },
        User.find_by(email:"anthony.watts@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Back to Home', description: "My friend discover that her is with a serious illness. She needs $1200 and you can help with one click to donate $20. ",
        category: Category.find_by(name: "Medical"), quantity:60, location: " Delta, Dili, East Timor " },
        User.find_by(email:"anthony.watts@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Voluntários', description: "Eles receberão  a doação do material do Le Wagon, mas não tem orçamento para concluir as obras. ",
        category: Category.find_by(name: "Volunteer"), quantity: 32, location: " Vila Madalena, São Paulo, Brasil " },
        User.find_by(email:"santiles87@gmail.com"))

  when 'production'
    # production seeds (if any) ...
    Category.create!(name: 'Medical')
    Category.create!(name: 'Emergency')
    Category.create!(name: 'Education')
    Category.create!(name: 'Animals')
    Category.create!(name: 'Volunteer')
    Category.create!(name: 'Charity')
    Category.create!(name: 'Memorial')

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

    create_user('https://res.cloudinary.com/dykf9cult/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1662079910/development/WhatsApp_Image_2022-09-01_at_6.36.58_PM_hkp2is.jpg', { email: 'maria@gmail.com', password: '123456', first_name: 'Maria', last_name: 'Santos'})

    create_user('https://res.cloudinary.com/dykf9cult/image/upload/v1662080002/development/WhatsApp_Image_2022-09-01_at_6.44.43_PM_c78g0g.jpg', { email: 'cmb_blumenau@cmb.com', password: '123456', first_name: 'Maria', last_name: 'Cavalcanti'})

    create_user('https://res.cloudinary.com/dykf9cult/image/upload/w_1000,c_fill,ar_1:1,g_auto,r_max,bo_5px_solid_red,b_rgb:262c35/v1662079988/development/WhatsApp_Image_2022-09-01_at_6.34.18_PM_qxcvtr.jpg', { email: 'anthony.watts@gmail.com', password: '123456', first_name: 'Anthony ', last_name: 'Watts'})


    def create_donation(url, content, user)
      file = URI.open(url)
      donation = Donation.new(content)
      donation.image.attach(io: file, filename: 'donation.png', content_type: 'image/png')
      donation.user = user
      donation.save
    end

    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Blood Type O-', description: " My friend had an accident and urgently needs type O Negative blood donation.",
        category: Category.find_by(name: "Medical"), quantity: 12, location: " Galway, Connacht, Ireland" },
        User.find_by(email:"angela.hawerroth@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Agasalho Infantil', description: "Preciso de agasalhos para meu filho de 8 anos e  minhas filhas de 4 anos. Estou desempregada e o salário do meu esposo só é suficiente para pagar as despesas mensais da casa.",
        category: Category.find_by(name: "Charity"), quantity: 40, location: "Curitiba, Paraná, Brasil" },
        User.find_by(email:"maria@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Brinquedos', description: "Brinquedos educativos que ajudam no aprendizado e na imaginação. Brinquedos voltados para crianças do pré-escolar de uma escola que perdeu todo o seu material em uma catástrofe natural.",
        category: Category.find_by(name: "Education"), quantity: 120, location: " Blumenau, Santa Catarina, Brasil" },
        User.find_by(email:"cmb_blumenau@cmb.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Books', description: "Portuguese and English Books to teach and incentive children and youth in the Casa Vida to read. To know well who are you going to help, Casa Vida is an organization that gives support for children and   youth. Casa Vida focuses its care on restoring the health, well-being and self-esteem of girls victims of violence and sexual abuse in Timor-Leste.",
        category: Category.find_by(name: "Education"), quantity: 200, location: " Lecidere, Dili, East Timor " },
        User.find_by(email:"anthony.watts@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Back to Home', description: "My friend discover that her is with a serious illness. She needs $1200 and you can help with one click to donate $20. ",
        category: Category.find_by(name: "Medical"), quantity:60, location: " Delta, Dili, East Timor " },
        User.find_by(email:"anthony.watts@gmail.com"))
    create_donation(
      "https://res.cloudinary.com/dykf9cult/image/upload/w_1000,ar_1:1,c_fill,g_auto,e_art:hokusai/v1661870543/development/2cmijurh005fhrpaxq39nkumifnk.jpg",
      { donation_name: 'Voluntários', description: "Eles receberão  a doação do material do Le Wagon, mas não tem orçamento para concluir as obras. ",
        category: Category.find_by(name: "Volunteer"), quantity: 32, location: " Vila Madalena, São Paulo, Brasil " },
        User.find_by(email:"santiles87@gmail.com"))
end
