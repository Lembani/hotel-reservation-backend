# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
  categories = Category.create!([{ name: 'The Unrated', description: 'Hotels under this category have not been rated yet' }, { name: 'Platinum Ultra', description: 'The highest rated category', rating: 5 }, { name: 'Diamond Ultra', description: 'The second highest category', rating: 4 }, { name: 'Gold Ultra', description: 'The third highest rated category', rating: 3 }, { name: 'Silver Ultra', description: 'The second lowest rated category', rating: 2 }, { name: 'Bronze Ultra', description: 'The lowest rated category', rating: 1 }])
