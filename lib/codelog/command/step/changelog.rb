require 'fileutils'
require 'yaml'
require 'erb'

module Codelog
  module Command
    module Step
      class Changelog
        include FileUtils
        CHANGELOG_BACKUP_PATH = Codelog::Command::Setup::CHANGELOG_DESTINATION_PATH
        CHANGELOG_TEMPLATE_PATH = 'changelogs/changelog_template.md.erb'.freeze

        def self.run
          Codelog::Command::Step::Changelog.new.run
        end

        def run
          chdir Dir.pwd do
            create_file
          end
        end

        private

        def changes
          releases_files_paths = Dir['changelogs/releases/*.yml']
          releases_files_paths.sort_by! do |file_name|
            version_number = file_name.split('/').last.chomp('.yml')
            Gem::Version.new(version_number)
          end.reverse!
          releases_files_paths.map do |version_changelog|
            Codelog::Presenters::VersionDataPresenter.new(YAML.load_file(version_changelog))
          end
        end

        def create_file
          template = File.read(CHANGELOG_TEMPLATE_PATH)
          # binding will provide changes to the template
          final_changelog = ERB.new(template).result binding
          File.open(Codelog::Config.filename, 'w+') do |f|
            f.puts(final_changelog)
            f.puts(changelog_backup_if_exists)
          end
        end

        def changelog_backup_if_exists
          return unless File.file?(CHANGELOG_BACKUP_PATH)
          backup_content = File.readlines(CHANGELOG_BACKUP_PATH)
        end
      end
    end
  end
end
