require 'csvlint'

schema = Csvlint::Schema.load_from_json("bano-04.json")
validator = Csvlint::Validator.new( File.new("bano-04.csv" ))

validate.validate
