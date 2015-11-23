# dgfr-tabular-metadata
Describing tabular data published on data.gouv.fr with [CSVW](http://www.w3.org/TR/csv2rdf/) metadata in [JSON-LD](http://www.w3.org/TR/json-ld/) serialization.

- custom-context.json is the standard CSVW context, with extra prefix declarations (`locn:`, etc.)
- bano-04.csv is a sample BANO file
- bano-04.json is the metadata of bano-04.csv in JSON-LD serialization (it still uses the standard context for CSVW)

### Explanation of the CSV metadata

The CSVW vocabulary is used to describe the structure of tabular files, mainly CSV files.

Walkthrough for 2_MH_2015.json:

- The `@context` is used to resolve the URIs of the properties, classes and entities present in the JSON-LD file. Without a context, they are all meaningless strings, like normal JSON. In this case, a remote context is referenced.
- Here the standard CSVW context is supercharged with a @base URI used to resolve all relative URIs, and an extra prefix for properties from the dgfr vocabulary.
- `url` is the URL of the CSV being described
- Some metadata can be added here too about the CSV, such as its title, some keywords,etc.
- The `tableSchema` describes the structure of the CSV
- Columns are described, starting with column A
- each column is given an @id so that we can make statements about them
- `name` is the label of the column header in the CSV
- Descriptions are empty here, but could contain documentation about the content of the column
- `datatype` supports XML schemas datatypes (string, double, float, integer, dateTime, etc.)
- `propertyUrl` is the URI of the property/predicate that would be used to connect the subject (here, an address, materialized by the row) and the value of the cell (the object of the triple). When we use our custom context, short URIs will be used (`locn:addressId` instead of `http://www.w3.org/ns/locn#addressId`).
- When no `propertyUrl` is mentioned, it means no property was created for it. Mostly because it's quite a specific property, or not used often. In this case, the `dénomination` is a concept that is quite specific to the dataset.
- `primaryKey` is a property of the `tableSchema`. It indicated the `name` of the column that contains the primary key of the table
- `aboutUrl` defines a template that determines the URI of the object described in each row. Here, it's based on the URL of the CSV. If reference URLs for monuments were set up by Ministère de la Culture, we should use these.
