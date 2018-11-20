# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#currency seed
puts 'Seeding currencies'
currencies = ['ATS', 'AUD', 'AUP', 'BEF', 'BGL', 'BGN', 'BRL', 'CAD', 'CHF', 'CNY', 'CYN', 'CZK', 'CSD', 'CSK', 'DDM', 'DEM', 'DKK', 'EEK', 'EGP', 'ESP', 'EUR', 'FIM', 'FRF', 'GBP', 'GHP', 'GRD', 'HKD', 'HRK', 'HUF', 'IDR', 'IEP', 'ILS', 'INR', 'ISK', 'ITL', 'JPY', 'KPW', 'KRW', 'KWD', 'LBP', 'LTL', 'LUF', 'LVL', 'MNT', 'MXN', 'MYR', 'NLG', 'NOK', 'NZD', 'OAL', 'OBL', 'OFR', 'ORB', 'PHP', 'PKR', 'PLN', 'PTE', 'ROL', 'RON', 'RSD', 'RUB', 'SDP', 'SEK', 'SGD', 'SIT', 'SKK', 'SUR', 'THB', 'TRY', 'UAH', 'USD', 'VND', 'XEU', 'XTR', 'YUD', 'ZAR']
currencies.each{|currency| Currency.create(iso_code: currency)}
puts 'Currency seeding finished.'

#category seed
puts 'Seeding categories'
food_and_drinks = ['food_and_drinks_others', 'bar_cafe', 'groceries', 'restaurant_fast_food'];
shopping = ['shopping_others', 'clothes_and_shoes', 'drug_store_chemist', 'electronics_accessories', 'free_time', 'gifts_joy', 'health_and_beauty', 'home_garden', 'jewels_accessories', 'kids', 'pets_animals', 'stationery_tools']
housing = ['housing_others', 'energy_utilities', 'maintenance_repairs', 'mortgage', 'property_insurance', 'rent', 'services']
transportation = ['transportation_others', 'business_trips', 'long_distance', 'public_transport', 'taxi']
vehicle = ['vehicle_others', 'fuel', 'leasing', 'parking', 'rentals','vehicle_insurance', 'vehicle_maintenance']
life_and_entertainment = ['life_and_entertainment_others', 'active_sport_fitness', 'alcohol_tobacco', 'books_audio_subscriptions', 'charity_gifts', 'culture_sport_events', 'education_development', 'health_care_doctor', 'hobbies', 'holiday_trips_hotels', 'life_events', 'lottery_gambling', 'tv_streaming', 'wellness_beauty']
communication_pc = ['communication_pc_others', 'internet', 'phone', 'postal_services', 'software_apps_games']
financial_expenses = ['financial_expenses_others', 'advisory', 'charges_fees', 'child_support', 'fines', 'insurances', 'loan_interests', 'taxes']
investments = ['investments_others', 'collections', 'financial_investments', 'realty', 'savings', 'vehicles_chattels']
income = ['income_others', 'checks_coupons', 'child_support', 'dues_and_grants', 'gifts', 'interests_dividends', 'lending_renting', 'lottery_gambling', 'refunds_tax_purchase', 'rental_income', 'sale', 'wage_invoices']
#others..

food_and_drinks_category = Category.create(label: 'food_and_drinks')
food_and_drinks.each{|sub_category_label| Category.create(label: sub_category_label, parent: food_and_drinks_category)}
shopping_category = Category.create(label: 'shopping')
shopping.each{|sub_category_label| Category.create(label: sub_category_label, parent: shopping_category)}
housing_category = Category.create(label: 'housing')
housing.each{|sub_category_label| Category.create(label: sub_category_label, parent: housing_category)}
transportation_category = Category.create(label: 'transportation')
transportation.each{|sub_category_label| Category.create(label: sub_category_label, parent: transportation_category)}
vehicle_category = Category.create(label: 'vehicle')
vehicle.each{|sub_category_label| Category.create(label: sub_category_label, parent: vehicle_category)}
life_and_entertainment_category = Category.create(label: 'life_and_entertainment')
life_and_entertainment.each{|sub_category_label| Category.create(label: sub_category_label, parent: life_and_entertainment_category)}
communication_pc_category = Category.create(label: 'communication_pc')
communication_pc.each{|sub_category_label| Category.create(label: sub_category_label, parent: communication_pc_category)}
financial_expenses_category = Category.create(label: 'financial_expenses')
financial_expenses.each{|sub_category_label| Category.create(label: sub_category_label, parent: financial_expenses_category)}
investments_category = Category.create(label: 'investments')
investments.each{|sub_category_label| Category.create(label: sub_category_label, parent: investments_category)}
income_category = Category.create(label: 'income')
income.each{|sub_category_label| Category.create(label: sub_category_label, parent: income_category)}
Category.create(label: 'others')
puts 'Category seeding finished.'