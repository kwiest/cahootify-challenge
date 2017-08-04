require 'csv'

class CSVImporter
  attr_reader :filename, :records

  def initialize(filename)
    raise ArgumentError.new("Filename is required") unless filename
    @filename = filename
    @records = parse_csv
  end

  def assign_records_to(klass)
    records.map { |r|
      begin
        klass.new(r)
      rescue ArgumentError => e
        $stdout.puts "Cannot save record: #{e.message}"
      end
    }.compact
  end


  private

  def parse_csv
    parameterize_keys CSV.open(filename, "r", headers: true).map(&:to_h)
  end

  def parameterize_keys(csv_rows)
    csv_rows.map do |row|
      parameterize_row row
    end
  end

  def parameterize_row(row)
    row.each_with_object({}) do |(key,value), new_row|
      new_key = key.downcase.gsub(" ", "_").to_sym
      new_row[new_key] = value
    end
  end
end
