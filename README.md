# dgfr-tabular-metadata

Describing tabular data published on data.gouv.fr with [CSVW](http://www.w3.org/TR/csv2rdf/) metadata in [JSON-LD](http://www.w3.org/TR/json-ld/) serialization.

Each CSV file (or tabular TXT) has a companion JSON file (JSON-LD syntax) that describes the CSV file as table.

Certain properties apply to the whole table:

- `dcterms:title`: a title, as defined in [the Dublin Core vocabulary](http://dublincore.org/documents/dcmi-terms/#terms-title)
- `csvw:url`: where CSV can usually be downloaded from
- `@id`: an identifier for the data table, in the form of a [URI](https://en.wikipedia.org/wiki/Uniform_Resource_Identifier) (a JSON-LD feature).
- `@context`: mapping information that enables the resolution of the terms of the schema to unambiguous URIs (a JSON-LD feature).
- `@base`: base URI from which column @id are are resolved

Other properties apply to columns:

- `@id`: identifier of the columns (basically "col" + column number), resolve to full URI with the global @base.
- `csvw:name`: name of the column, as present in CSV header (if any). If the column header contains forbidden characters (parenthesis, periods, etc.), the forbidden characters are replaced with underscores and the actual CSV header is stored in `csvw:titles`. The value of `csvw:name` is also used to mint URIs (see `csvw:valueUrl`).
- `dcterms:description`: optional description of the content of the column. Required when the column name is not transparent.
- `csvw:titles`: can contain any text string, thus is only used when the CSV header contains forbidden characters.
- `csvw:datatype`: the datatype of the strings in the column.
- `csvw:propertyUrl`: URI of the property that express the semantics of the column to describe the object materialized by the CSV row
- `csvw:valueUrl`: The structure of the URI of the object referenced by `csvw:propertyUrl`.

TODO: add a table example

### Observations:

#### Quick ones

- INSEE codes should be treated as strings
- What column `name` do I use if the CSV doesn't have headers? (e.g. BANO)


#### `name` and `titles` for columns

Column `name` cannot contain special characters (dot, parenthesis, commas, question mark, etc.). `titles` can. But only `name` values are used to make cross-column relationships.

Solution picked: always add a `name` to columns. If the column header in the CSV has characters unallowed in `name`:

	1. Replace unallowed characters with underscores in `name`
	2. Add a `titles` property to the column, with the orginal column header from the CSV.

As a result, only columns with headers that have special characters have a `titles` property.
