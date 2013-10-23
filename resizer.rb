# encoding: UTF-8
 
require 'rubygems'
require 'rmagick'

def traverse( path )
  Dir.glob(["#{path}/**/*.jpg", "#{path}/**/*.JPG", "#{path}/**/*.png", "#{path}/**/*.PNG"]).each do |name|
    unless File.directory?( name )
      process_file( name )
    end
  end
end

def process_file( fname )
  scale = 0.4	  # 元サイズを1.0として、変換後の画像サイズをパーセントで指定
  
  img = Magick::Image.read( fname ).first
  img.resize!( scale )
  img.write( "#{fname}" )
  puts fname + " 変換しました。"
end

traverse( Dir.pwd )
