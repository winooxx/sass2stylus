require "sass2stylus/version"
require "sass2stylus/stylus"
require "sass"

module Sass2stylus

  class Utilities

    def write_file(raw, sass_path, styl_path)

      FileUtils.mkdir_p styl_path.to_s + File.dirname(raw).to_s
      full_path = styl_path.to_s + raw.to_s + '.styl'

      File.open(full_path, 'w+') { |f|
        f.puts(ToStylus::convert(sass_path))
      }
    end

    # Accepts a sass file and returns a stylus file
    def s2s(directory, filename, styl_dir)

      Dir.mkdir(styl_dir) unless File.exists?(styl_dir)

      raw_filename = filename.gsub(directory.to_s, '').gsub('.scss', '')
      sass_file = filename.gsub '.scss', '.sass'

      if filename.include? ".scss"
        `sass-convert #{filename} #{sass_file}`
        write_file(raw_filename, sass_file, styl_dir)
        File.delete(sass_file)
      elsif filename.include? ".sass"
        write_file(raw_filename, sass_file, styl_dir)
      else
        puts "You passed some files that aren't .sass or .scss files."
        puts "You can specify that in your glob: sass2stylus *.scss"
      end

    end

    # Accepts a base file path, a glob pattern, and a folder name (relative) for output
    def batch(base, pattern, styl)

      glob = Dir.glob(base + pattern)

      if glob.empty?
        puts "The pattern '#{pattern}' didn't match any sass files."
        puts "Use globs like: sass2stylus **/*.scss styl"
      else
        glob.each do |file|
          s2s(base, file, base + styl)
        end;
      end

    end

  end

end
