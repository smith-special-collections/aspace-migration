# aspace-migration
Files, tools, and plans for bringing legacy data into ArchivesSpace at Smith
## Record types to migrate
* Resource records (multilevel)
* Resource records (single-level)
* Accession records
* Name records
* Digital objects (outside the context of archival description)

### Resource records (multilevel) to-do
* Migrate from DTD -> schema (ASAP)
	* Validate against schema (ASAP)
	* Remediate schema errors (ASAP)
		* Update country code and repository code
* Validate against EAD import schematron
	* Remediate schematron errors
	* Move update <note> elements to <odd>
	* Think through references
	* Think through indices
	* Fix extent statements
* Important but not strictly necessary fixes
	* Update <subtitle>
	
### Resource records (single-level) to-do
* Map InMagic records to Resource schema
* Select records not present as multi-level