# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

### CREATING ADMIN

admin = { name: 'Administrador',
          email: 'admin@admin.com',
          password: '123123',
          password_confirmation: '123123',
          role: 0 }

puts "Creating administrator #{admin.slice(:email).values}" if (Admin.create(admin) unless Admin.exists?(admin.slice(:email)))

###

### CREATING CATEGORIES
categories = ['Animais e acessórios',
              'Esportes',
              'Para a sua casa',
              'Eletrônicos e celulares',
              'Música e hobbies',
              'Bebês e crianças',
              'Moda e beleza',
              'Veículos e barcos',
              'Imóveis',
              'Empregos e negócios']

categories.each do |category|
  Category.find_or_create_by(description: category) do |_w|
    puts 'Creating category ' + category + '...'
  end
end
###
