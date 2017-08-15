namespace :listwatch do
  task import: :environment do
    directory = Rails.root.join('lib', 'data')

    Dir.foreach(directory) do |filename|
      next if filename == '.' || filename == '..'

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

      title = row['Nominee']
      year = row['Year'].to_i

      search = Tmdb::Search.new
      search.query("#{title}")
      search.year(year)
      results = search.fetch

      if results.present?
        movie = Movie.find_or_import_from_tmdb(results.first['id'])
        list.positions.create(movie: movie, value: year)
        Rails.logger.info "Successfully imported #{title} (#{year})"
        next
      end

      search.primary_release_year(year)
      results = search.fetch

      if results.present?
        movie = Movie.find_or_import_from_tmdb(results.first['id'])
        list.positions.create(movie: movie, value: year)
        Rails.logger.info "Successfully imported #{title} (#{year})"
        next
      end

      puts "Couldn't find movie #{title} (#{year})"
    end
  end
end
