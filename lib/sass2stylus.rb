require "sass2stylus/version"
require "sass2stylus/stylus"
require "sass"

module Sass2stylus

  class Utilities

    def write_file(raw, sass_path, styl_path)
      File.open(styl_path + raw + '.styl', 'w+') { |f|
        f.puts(ToStylus::convert(sass_path))
      }
    end

    # Accepts a sass file and returns a stylus file
    def s2s(f, styldir)

      @filename = f
      @raw_filename = @filename.gsub '.scss', ''
      @sass_file = @filename.gsub '.scss', '.sass'

      if @filename.include? ".scss"
        `sass-convert #{@filename} #{@sass_file}`
        write_file(@raw_filename, @sass_file, styldir)
        File.delete(@sass_file)
      elsif @filename.include? ".sass"
        write_file(@raw_filename, @sass_file, styldir)
      else
        puts "You passed some files that aren't .sass or .scss files."
        puts "You can specify that in your glob: sass2stylus *.scss"
      end

    end
  end

end
