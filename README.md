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
	* Fix extent statements
* Fix elements that will be wonky in ArchivesSpace
	* Update <subtitle>
	* De-duplicate series-level <c>s 
	* Think through references
	* Think through indices
	
### Resource records (single-level) to-do
* Map InMagic records to Resource schema
* Select records not present as multi-level
* Post single-level resource records (culled) to ArchivesSpace

### Accession records to-do
* Map InMagic records to Accession schema
* Map linked resource IDs from InMagic to ArchivesSpace
* Post accession records to ArchivesSpace

### Name records to-do
* Map InMagic records to Names schema
* Reconcile names to LCNAF identifiers
* Post name records to ArchivesSpace
* Merge name records already imported as part of EAD import with existing name records
* Iterate reconciliation

### Container profiles to do
* [Post to ArchivesSpace from survey data](https://github.com/smith-special-collections/aspace-migration/blob/master/container%20profiles/AddContainerProfiles.py)
