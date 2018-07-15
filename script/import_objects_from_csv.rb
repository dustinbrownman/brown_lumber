klass, path_to_csv = ARGV

klass = klass.constantize

successes = 0
errors = []

def import_record(klass, attributes)
  klass.create! attributes
rescue => e
  error = <<~ERROR
    Failed to create `#{klass}` record from #{attributes}
    Error message: #{e.message}
  ERROR

  OpenStruct.new(errors: [error])
end

def filter_nils_from_row(row)
  row.each do |key, value|
    row[key] = nil if value == "\\N"
  end
end

CSV.foreach(path_to_csv, headers: true) do |row|
  filter_nils_from_row(row)
  record = import_record(klass, row.to_hash)

  if record.errors.any?
    errors += record.errors
  else
    successes += 1
  end
end

puts "#{successes} successes"
puts "#{errors.count} errors"
puts errors
