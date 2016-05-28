require 'spreadsheet'

def main
  Dir.glob('./sample_data/**/*.xls').each do |xlsfile|
    xls = Spreadsheet.open(xlsfile)
    puts xlsfile
    xls.worksheets.each do |ws|
      puts ws.name
      (0..256).each do |x|
        break unless ws[x,0]
        (0..256).each do |y|
          break unless ws[x,y]
          print "[#{ws[x,y]}] "
        end
        print "\n"
      end
      puts "----------"
    end
  end
end

def dummy
  Spreadsheet.inspect
end
