module Codelog
  module Command
    class Bump
      CHANGELOG_RELEASES_PATH = 'changelogs/releases/'.freeze
      CHANGELOG_RELEASE_REGEXP = /^\d*\.{1}\d*\.{1}\d*$/
      VALID_VERSION_TYPES = ['major', 'minor', 'patch'].freeze

      def self.run(version_type, release_date)
        Codelog::Command::Bump.new.run version_type, release_date
      end

      def run(version_type, release_date)
        unless VALID_VERSION_TYPES.include?(version_type)
          abort(Codelog::Message::Error.invalid_version_type(version_type))
        end

        Codelog::Command::Release.run(next_version(version_type), release_date)
      end

      private

      def next_version(version_type)
        last_version = last_created_changelog.split('.').map(&:to_i)

        case version_type
        when 'major'
          last_version = [(last_version[0] + 1), 0, 0]
        when 'minor'
          last_version = [last_version.first, (last_version[1] + 1), 0]
        when 'patch'
          last_version[2] += 1
        end
        last_version.join('.')
      end

      def last_created_changelog
        released_versions = Dir.glob(File.join(CHANGELOG_RELEASES_PATH, '*.md*')).map do |file_path|
          file_path.gsub(CHANGELOG_RELEASES_PATH, '').gsub('.md', '')
        end.grep(CHANGELOG_RELEASE_REGEXP)

        released_versions.max_by { |version_string| Gem::Version.new(version_string) }
      end
    end
  end
end