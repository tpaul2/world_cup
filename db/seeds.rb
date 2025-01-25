# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

# Load the match data from the CSV file
match_csv_text = File.read(Rails.root.join('lib', 'tasks', 'seeds', 'world_cup_matches.csv'))
match_csv = CSV.parse(match_csv_text, headers: true, encoding: 'utf-8')
match_csv.each do |row|
  m = Match.new
  m.home_country = row['home_country']
  m.away_country = row['away_country']
  m.home_score = row['home_score']
  m.home_penalty = row['home_penalty']
  m.away_score = row['away_score']
  m.away_penalty = row['away_penalty']
  m.attendance = row['attendance']
  m.venue = row['venue']
  m.round = row['round']
  m.date = row['date']
  m.host = row['hosts']
  m.year = row['year']
  m.save
end

# Load the teams data from the CSV file
team_csv_text = File.read(Rails.root.join('lib', 'tasks', 'seeds', 'world_cup_teams.csv'))
team_csv = CSV.parse(team_csv_text, headers: true, encoding: 'utf-8')
team_csv.each do |row|
  t = Team.new
  t.team = row['team']
  t.team_code = row['team_code']
  t.team_association = row['team_association']
  t.save
end

# Load the countries data from the CSV file
country_csv_text = File.read(Rails.root.join('lib', 'tasks', 'seeds', 'countries.csv'))
country_csv = CSV.parse(country_csv_text, headers: true, encoding: 'utf-8')
country_csv.each do |row|
  c = Country.new
  c.name = row['name']
  c.abbreviation = row['abbreviation']
  c.save
end
