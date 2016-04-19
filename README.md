# dgfr-tabular-metadata
Describing tabular data published on data.gouv.fr with [CSVW](http://www.w3.org/TR/csv2rdf/) metadata in [JSON-LD](http://www.w3.org/TR/json-ld/) serialization.

### Observations:

#### Quick ones

- INSEE codes should be treated as strings

#### `name` and `titles` for columns

Column `name` cannot contain special characters (dot, parenthesis, commas, question mark, etc.). `titles` can. But only `name` values are used to make cross-column relationships.

Solution picked: always add a `name` to columns. If the column header in the CSV has characters unallowed in `name`:
	
	1. Replace unallowed characters with underscores in `name`
	2. Add a `titles` property to the column, with the orginal column header from the CSV.

As a result, only columns with headers that have special characters have a `titles` property.

