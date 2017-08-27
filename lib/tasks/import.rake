namespace :listwatch do
  task import: :environment do
    directory = Rails.root.join('lib', 'data')

    Dir.foreach(directory) do |filename|
      next if filename == '.' || filename == '..'
      next if filename.last(3) != 'csv'

      process_csv(filename)
    end
  end

  def process_csv(filename)
    # Use filename as a name for the list: "Oscars.csv" => "Oscars"
    list_name = filename.split('.').first
    list = List.create(name: list_name)

    path = Rails.root.join('lib', 'data', filename)
    CSV.foreach(path, headers: true) do |row|
      sleep(0.25)

      title = row['title']
      featured = (row['won'] == 'yes')
      # year = row['year'].to_i

      movie = Movie.find_or_import_from_tmdb(row['id'])
      list.positions.create(movie: movie, featured: featured)
    end

    list.update_posters_cache
  end
end
