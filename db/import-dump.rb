# TODO: Refactor Second to become Third

# >>> THIRD - To be a refactored version
# require 'csv'
# records = []
# species_images = []

# @columns = [:id, :scientific_name, :rank, :genus, :family, :year, :author, :bibliography, :common_name, :family_common_name,
#           :image_url, :flower_color, :flower_conspicuous, :foliage_color, :foliage_texture, :fruit_color, :fruit_conspicuous,
#           :fruit_months, :bloom_months, :ground_humidity, :growth_form, :growth_habit, :growth_months, :growth_rate, :edible_part,
#           :vegetable, :edible, :light, :soil_nutriments, :soil_salinity, :anaerobic_tolerance, :atmospheric_humidity,
#           :average_height_cm, :maximum_height_cm, :minimum_root_depth_cm, :ph_maximum, :ph_minimum, :planting_days_to_harvest,
#           :planting_description, :planting_sowing_description, :planting_row_spacing_cm, :planting_spread_cm, :synonyms,
#           :distributions, :common_names, :url_usda, :url_tropicos, :url_tela_botanica, :url_powo, :url_plantnet, :url_gbif,
#           :url_openfarm, :url_catminat, :url_wikipedia_en]

# Todo: Most species attributes are basic strings, however some are more exotic. Create a basic method and individual exotic
#       methods so the CSV.foreach loop can be cleaner and DRY
# CSV.foreach('db/species.csv', headers: true, col_sep: "\t", row_sep: :auto, liberal_parsing: true) do |r|
#   puts r.to_h
#   row = r.to_h
#   puts ""
#   s = Species.new
#   puts ""
#   print s
#   # Begin Per Column Values
#   for column in @columns do
#     if row["#{column}"] != nil
#       puts "Found Column: #{column}"
#       puts "Found Value: " + row["#{column}"]
#       case column
#       when "id"

#     end
#   end
#   binding.pry
# end
# ---------------------------------------------------------------

# >>> Reference: Select specific record row numbers
# CSV.to_enum(:foreach, 'db/species.csv', headers: true).with_index(1) do |row, rowno|
#   if rowno > 1000
#     puts "Row Number: #{rowno}"
#   end
# end
# ---------------------------------------------------------------


# >>> ORIGINAL - for reference
# values = CSV.read(Rails.root.join('db/species.csv'))

# Species.import columns, values, validate: false, on_duplicate_key_update: { conflict_target: [:id] }

# quote_chars = %w[ \\ .  [  ]  -  ^  $  ? *  +  {  }  (  )  |  #  \  \r \n \t \f \v ]

# quote_chars = %w(" | ~ ^ & *)
# begin
#   values = CSV.read('db/species.csv', headers: :first_row, quote_char: quote_chars.shift)
# rescue CSV::MalformedCSVError
#   quote_chars.empty? ? raise : retry
# end


# >>> SECOND - This is currently being used
require 'csv'

CSV.foreach('db/species.csv', headers: true, col_sep: "\t", row_sep: :auto, liberal_parsing: true) do |r|
  row = r.to_h
  puts row
  s = Species.new
  si = SpeciesImage.new
  puts s
  if row['id'] != nil
    puts "> Found Record ID: #{row['id']}"
    s.id = row['id']
    puts "+ Added id to Species: #{s.id}"
  end

  if row['scientific_name'] != nil
    puts "> Found Record scientific_name: #{row['scientific_name']}"
    s.scientific_name = row['scientific_name']
    puts "+ Added scientific_name to Species: #{s.scientific_name}"
  end

  if row['rank'] != nil
    puts "> Found Record rank: #{row['rank']}"
    s.rank = row['rank']
    puts "+ Added rank to Species: #{s.rank}"
  end

  # Genus is next, however method hooks in the Species Model handles this.

  if row['family'] != nil
    puts "> Found Record family: #{row['family']}"
    s.family_name = row['family']
    puts "+ Added family to Species: #{s.family_name}"
  end

  if row['year'] != nil
    puts "> Found Record year: #{row['year']}"
    s.year = row['year']
    puts "+ Added year to Species: #{s.year}"
  end

  if row['author'] != nil
    puts "> Found Record author: #{row['author']}"
    s.author = row['author']
    puts "+ Added author to Species #{s.author}"
  end

  if row['bibliography'] != nil
    puts "> Found Record bibliography: #{row['bibliography']}"
    s.bibliography = row['bibliography']
    puts "+ Added bibliography to Species: #{s.bibliography}"
  end

  if row['common_name'] != nil
    puts "> Found Record common_name: #{row['common_name']}"
    s.common_name = row['common_name']
    puts "+ Added common_name to Species: #{s.common_name}"
  end

  if row['family_common_name'] != nil
    puts "> Found Record family_common_name: #{row['family_common_name']}"
    s.family_common_name = row['family_common_name']
    puts "+ Added family_common_name to Species: #{s.family_common_name}"
  end

  # Confirm Species Image Saved
  if row['image_url'] != nil
    puts "> Found Record image_url: #{row['image_url']}"

    si.image_url = row['image_url']
    si.species_id = row['id']

    puts "Created SpeciesIamge with image_url to relate to Species"
  end

  # Confirm Flower Color Saved
  if row['flower_color'] != nil
    puts "> Found Record flower_color: #{row['flower_color']}"
    case row['flower_color']
    when "white"
      s.flower_color = 1
    when "red"
      s.flower_color = 2
    when "brown"
      s.flower_color = 3
    when "orange"
      s.flower_color = 4
    when "yellow"
      s.flower_color = 5
    when "lime"
      s.flower_color = 6
    when "green"
      s.flower_color = 7
    when "cyan"
      s.flower_color = 8
    when "blue"
      s.flower_color = 9
    when "purple"
      s.flower_color = 10
    when "magenta"
      s.flower_color = 11
    when "grey"
      s.flower_color = 12
    when "black"
      s.flower_color = 13
    else
      puts "Unable to utilize flower_color #{row['flower_color']}"
    end

    puts "+ Added flower_color to Species: #{s.flower_color}"
  end

  if row['flower_conspicuous'] != nil
    puts "> Found Record flower_conspicuous: #{row['flower_conspicuous']}"
    s.flower_conspicuous = row['flower_conspicuous']
    puts "+ Added flower_conspicuous to Species: #{s.flower_conspicuous}"
  end

  if row['foliage_color'] != nil
    puts "> Found Record foliage_color: #{row['foliage_color']}"
    s.foliage_color = row['foliage_color']
    puts "+ Added foliage_color to Species: #{s.foliage_color}"
  end

  if row['foliage_texture'] != nil
    puts "> Found Record foliage_texture: #{row['foliage_texture']}"
    s.foliage_texture = row['foliage_texture']
    puts "+ Added foliage_texture to Species: #{s.foliage_texture}"
  end

  if row['fruit_color'] != nil
    puts "> Found Record fruit_color: #{row['fruit_color']}"
    s.fruit_color = row['fruit_color']
    puts "+ Added fruit_color to Species: #{s.fruit_color}"
  end

  if row['fruit_conspicuous'] != nil
    puts "> Found Record fruit_conspicuous: #{row['fruit_conspicuous']}"
    s.fruit_conspicuous = row['fruit_conspicuous']
    puts "+ Added fruit_conspicuous to Species: #{s.fruit_conspicuous}"
  end

  if row['vegetable'] != nil
    puts "> Found Record vegetable: #{row['vegetable']}"
    s.vegetable = row['vegetable']
    puts "+ Added vegetable to Species: #{s.vegetable}"
  end

  if row['edible'] != nil
    puts "> Found Record edible: #{row['edible']}"
    s.edible = row['edible']
    puts "+ Added edible to Species: #{s.edible}"
  end

  if row['light'] != nil
    puts "> Found Record light: #{row['light']}"
    s.light = row['light']
    puts "+ Added light to Species: #{s.light}"
  end

  if row['soil_nutriments'] != nil
    puts "> Found Record soil_nutriments: #{row['soil_nutriments']}"
    s.soil_nutriments = row['soil_nutriments']
    puts "+ Added soil_nutriments to Species: #{s.soil_nutriments}"
  end

  if row['soil_salinity'] != nil
    puts "> Found Record soil_salinity: #{row['soil_salinity']}"
    s.soil_salinity = row['soil_salinity']
    puts "+ Added soil_salinity to Species: #{s.soil_salinity}"
  end

  if row['anaerobic_tolerance'] != nil
    puts "> Found Record anaerobic_tolerance: #{row['anaerobic_tolerance']}"
    s.anaerobic_tolerance = row['anaerobic_tolerance']
    puts "+ Added anaerobic_tolerance to Species: #{s.anaerobic_tolerance}"
  end

  if row['atmospheric_humidity'] != nil
    puts "> Found Record atmospheric_humidity: #{row['atmospheric_humidity']}"
    s.atmospheric_humidity = row['atmospheric_humidity']
    puts "+ Added atmospheric_humidity to Species: #{s.atmospheric_humidity}"
  end

  if row['average_height_cm'] != nil
    puts "> Found Record average_height_cm: #{row['average_height_cm']}"
    s.average_height_cm = row['average_height_cm']
    puts "+ Added average_height_cm to Species: #{s.average_height_cm}"
  end

  if row['maximum_height_cm'] != nil
    puts "> Found Record maximum_height_cm: #{row['maximum_height_cm']}"
    s.maximum_height_cm = row['maximum_height_cm']
    puts "+ Added maximum_height_cm to Species: #{s.maximum_height_cm}"
  end

  if row['minimum_root_depth_cm'] != nil
    puts "> Found Record minimum_root_depth_cm: #{row['minimum_root_depth_cm']}"
    s.minimum_root_depth_cm = row['minimum_root_depth_cm']
    puts "+ Added minimum_root_depth_cm to Species: #{s.minimum_root_depth_cm}"
  end

  if row['ph_maximum'] != nil
    puts "> Found Record ph_maximum: #{row['ph_maximum']}"
    s.ph_maximum = row['ph_maximum']
    puts "+ Added ph_maximum to Species: #{s.ph_maximum}"
  end

  if row['ph_minimum'] != nil
    puts "> Found Record ph_minimum: #{row['ph_minimum']}"
    s.ph_minimum = row['ph_minimum']
    puts "+ Added ph_minimum to Species: #{s.ph_minimum}"
  end

  if row['planting_days_to_harvest'] != nil
    puts "> Found Record planting_days_to_harvest: #{row['planting_days_to_harvest']}"
    s.planting_days_to_harvest = row['planting_days_to_harvest']
    puts "+ Added planting_days_to_harvest to Species: #{s.planting_days_to_harvest}"
  end

  if row['planting_description'] != nil
    puts "> Found Record planting_description: #{row['planting_description']}"
    s.planting_description = row['planting_description']
    puts "+ Added planting_description to Species: #{s.planting_description}"
  end

  if row['planting_sowing_description'] != nil
    puts "> Found Record planting_sowing_description: #{row['planting_sowing_description']}"
    s.planting_sowing_description = row['planting_sowing_description']
    puts "+ Added planting_sowing_description to Species: #{s.planting_sowing_description}"
  end

  if row['planting_row_spacing_cm'] != nil
    puts "> Found Record planting_row_spacing_cm: #{row['planting_row_spacing_cm']}"
    s.planting_row_spacing_cm = row['planting_row_spacing_cm']
    puts "+ Added planting_row_spacing_cm to Species: #{s.planting_row_spacing_cm}"
  end

  if row['planting_spread_cm'] != nil
    puts "> Found Record planting_spread_cm: #{row['planting_spread_cm']}"
    s.planting_spread_cm = row['planting_spread_cm']
    puts "+ Added planting_spread_cm to Species: #{s.planting_spread_cm}"
  end

  # Synonyms is next, the Species model handles this through nested attributes (synonyms).

  # Distributions is next, the Species model handles this through nested attributes (species_distributions).

  # Common_names is next, the Species model handles this through nested attributes (common_names).

  # Below: properties that are available but have not sourced their purpose and paths.
  # url_usda
  # url_tropicos
  # url_tela_bontanica
  # url_powo
  # url_plantnet
  # url_gibf
  # url_openfarm
  # url_catminat
  # url_wikipedia_en

  puts "Saving species #{s}..."
  if s
    s.save
  end
  puts "Species Saved!"
  puts "Saving species image #{si}..."
  if si
    if SpeciesImage.where(:image_url => si.image_url, :species_id => si.species_id)
      puts "Species Image already exists - skip saving this image."
    else
      si.save
    end
  end
  puts "Species Image Saved!"
end