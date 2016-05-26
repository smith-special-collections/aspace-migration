# aspace-migration
Files, tools, and plans for bringing legacy data into ArchivesSpace at Smith
## Record types to migrate
* Resource records (multilevel)
* Resource records (single-level)
* Accession records
* Name records
* Digital objects (outside the context of archival description)

### Resource records (multilevel) to-do
* [Migrate from DTD -> schema (ASAP)](https://github.com/smith-special-collections/aspace-migration/blob/master/resources/EAD%20fixes%20now/dtd2schema.xsl) - WRITTEN
	* Validate against schema (ASAP)
	* Remediate schema errors (ASAP)
		* [Update country code, language code and repository code](https://github.com/smith-special-collections/aspace-migration/blob/master/resources/EAD%20fixes%20now/SchemaCompliance.xsl) - WRITTEN
		* [Add level attributes](https://github.com/smith-special-collections/aspace-migration/blob/master/resources/EAD%20fixes%20now/AddLevelIfNotPresent.xsl) - WRITTEN
* [Validate against EAD import schematron] (https://raw.githubusercontent.com/tcatapano/EAD_Archivespace_Import/master/archivesSpace_consolidated.sch)
	* Remediate schematron errors
* [Fix elements that ArchivesSpace barfs on] (https://github.com/tcatapano/EAD_Archivespace_Import/blob/master/ead_import_issues.md)
	* change did/note to did/odd -- WRITTEN
	* check for nested note elements (i.e., bioghist/bioghist/p)
	* put @ids and @parents on containers - WRITTEN
	* check publish status / force publish upon import
	* currently, title and ref elements of the same indexentry element are imported as separate index records
	* ead / did / physdesc / dimension or physfacet element is loaded twice, once as a Note w/Type=Physical Description and again as a Note with Type=Dimensions. Check and de-dupe.
	* in the case of multiple unittitles or unitids, behavior is “last wins” rather than “multiple unittitles.” Esp problematic for records with names in multiple languages. Diagnose pre-migration, fix post-migration.
	* langmaterial/language elements stripped during import. Diagnose pre-migration, fix post-migration.
	* Can’t have notes over 65k. Diagnose pre-migration, fix post-migration.
	* Extents that don't start with a numeric character -- WRITTEN
* Fix elements that will be wonky in ArchivesSpace
	* Update subtitle - WRITTEN
	* De-duplicate series-level cs 
* Fix stuff that looks bad
	* Update circa and undated
	* Change from all-caps to title case
* Fix problems
	* Update copyright statement to CC0
	* DACS capitalization for C/collection, P/papers, R/records
	* Get rid of descgrp -- WRITTEN
	* Get rid of head -- WRITTEN
* Stuff to test
	* Tables
	* Which files have
		* chronlist
		* indexentry
		* duplicate unittitle, unitid
		* check for langmaterial/language
		* tables
		* indices
		* DACS single-level minimum
	
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
