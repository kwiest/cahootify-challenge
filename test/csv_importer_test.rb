require 'test_helper'
require 'csv_importer'

class CSVImporterTest < Minitest::Test
  def setup
    @importer = CSVImporter.new "people.csv"
  end

  def test_initialize_with_filename
    assert_equal "people.csv", @importer.filename
  end

  def test_filename_required
    assert_raises ArgumentError do
      importer = CSVImporter.new
    end
  end

  def test_loading_csv_records
    records = @importer.records
    assert_instance_of Array, records
  end

  def test_keys_are_parameterized
    first_record = @importer.records.first
    keys = [:name, :email_address, :telephone_number, :website]
    assert_equal keys, first_record.keys
  end

  def test_assigning_users
    collection = @importer.assign_records_to User
    assert_instance_of User, collection.first
  end
end
