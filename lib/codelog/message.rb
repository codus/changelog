module Codelog
  class Message
    class Error
      class << self
        def prefix
          'ERROR'
        end

        def missing_version_number
          "#{prefix}: Please enter a version number"
        end

        def invalid_date_format
          "#{prefix}: Invalid date format. Check the input date format on:\n\n" \
          'changelogs/codelog.yml'
        end

        def already_existing_version(version)
          "#{prefix}: Could not create release #{version}. Release #{version} already exists"
        end

        def no_detected_changes(version)
          "#{prefix}: Could not create release #{version}. You must create a change first.\n" \
          "Run the following command to create a new change file:\n\n" \
          "codelog new\n\n" \
          "Then describe your changes on the file generated at:\n\n" \
          'changelog/unreleased'
        end

        def missing_config_file
          "#{prefix}: Could not find a config file.\n" \
          "Run the following command to create the missing file:\n\n" \
          'codelog setup'
        end

        def could_not_parse_yaml(error)
          "#{prefix}: #{error.problem.capitalize} in #{error.file}:#{error.line}"
        end

        def invalid_version_type(version_type)
          "#{version_type} is not a valid version type."
        end
      end
    end

    class Warning
      class << self
        def prefix
          'WARNING'
        end

        def maintain_versioning_of_existing_changelog?
          "#{prefix}: There is already a file named CHANGELOG.md within " \
          'your project. Do you wish to maintain its versioning? (Y/N)'
        end

        def delete_existing_changelog?
          "#{prefix}: When generating a release for the first " \
          'time, CHANGELOG.md will be erased. Do you wish to erase it now? (Y/N)'
        end
      end
    end
  end
end
