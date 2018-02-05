<!-- Old changelog starts here -->

# Title

Header 


## 0.3.1 - 05/02/2018

### Fixed 
- Non-default input date fomat
### Added 
- ERB changelog template file
### Changed 
- template.yml name to release_template.yml
- Releases are now .yml files
- Releases will have Date format base on date_input_format from codelog.yml
### Removed 
- codelog.yml unecessary variables
- All relations with header file
### Deploy notes 
- When updating the gem, a new setup will be required. It's advised to back-up the current CHANGELOG.md, because it will be deleted on the next release.
- From now on, all .md files from releases will be ignored when creating CHANGELOG.md.
---

<!-- Old changelog starts here -->

# Changelog
All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## 0.3.0
### Changed
- Human-readable timestamp for the change files
- Altered setup to print message instead of aborting when creating files
- Changelog header is now configurable through 'changelogs/header.txt'
- Insulated abort messages within Codelog::Messages
- Blocked attempt to release a changelog with no changes
- Blocked attempt to release repeated versions from a changelog

### Added
- Configurable filename
- Configurable input and output date formats
- Enable/Disable 'datestamps' within version tag
- Version prefix, version suffix and date prefix within version tag
- Previous existing changelog can now be merged upon 'codelog setup'
- Message after the release command
- Datestamps along with version tag (synthax codelog release [x.y.z] <DATE>)

---
## 0.2.3
### Changed
- Setup command now creates a .gitkeep file on /changelogs/releases folder

---
## 0.2.2
### Changed
- Setup command copies a template.yml with an example data.
- Required files to gemspec
- Setup generates a gitkeep file

---
## 0.2.1
### Removed
- Unnecessary code on bin

---
## 0.2.0
### Added
- Command Line Interface (CLI) through Thor
- Rubocop
- Changelog
- Contributing guide
- License
- Code of conduct
- CodeClimate
- CI through Travis

### Changed
- All commands now are called by `codelog` command
- Updated README.md

### Removed
- Separated command to create release without deleting unreleased files
- Separated command to delete unreleased files
- Separated command to update changelog without releasing new version

---
## 0.1.0
### Added
- Automated setup to create folder structure and template
- Automated Changelog generator
- Automated Release file generator
- Automated Change file generator
- Automated unreleased files deletion
- Command to full Changelog generation flow

---
