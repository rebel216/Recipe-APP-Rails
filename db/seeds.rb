# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
u1 = User.create(name: 'User1', email: 'email1@mail.com', password: 'aaaaaa')
u2 = User.create(name: 'User2', email: 'email2@mail.com', password: 'aaaaaa')
u3 = User.create(name: 'User3', email: 'email3@mail.com', password: 'aaaaaa')
u4 = User.create(name: 'User4', email: 'email4@mail.com', password: 'aaaaaa')
u5 = User.create(name: 'User5', email: 'email5@mail.com', password: 'aaaaaa')

food1 = Food.create(name: 'Food1', measurement_unit: 'g', price: 10.5, quantity: 10, user_id: u1.id)
food2 = Food.create(name: 'Food2', measurement_unit: 'kg', price: 20.5, quantity: 20, user_id: u2.id)
food3 = Food.create(name: 'Food3', measurement_unit: 'g', price: 30, quantity: 30, user_id: u3.id)
food4 = Food.create(name: 'Food4', measurement_unit: 'kg', price: 40, quantity: 40, user_id: u4.id)
food5 = Food.create(name: 'Food5', measurement_unit: 'g', price: 50, quantity: 50, user_id: u5.id)