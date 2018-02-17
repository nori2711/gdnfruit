# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"

#governmentsテーブルへのCSV取り込み
# CSV.foreach('db/government.csv', encoding: 'Shift_JIS:UTF-8') do |row|
#   Government.create(organ_id: row[0], prefecture: row[1], hall: row[2], hall_email: row[3])
# end

#treesテーブルへのCSV取り込み
CSV.foreach('db/tree.csv', encoding: 'Shift_JIS:UTF-8') do |row|
  Tree.create(organ_id: row[0], tree_type: row[1], tree_name: row[2], tree_address1: row[3], tree_address2: row[4], tree_lat: row[5], tree_lon: row[6])
end
