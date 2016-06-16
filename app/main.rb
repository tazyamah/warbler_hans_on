require 'spreadsheet'

require 'lib/sample.jar'
java_import org.tazyamah.sample.SampleClass

def main
  # jar読み込みテスト
  SampleClass.hello()
  puts SampleClass.string()
  # ここまで
  result = ""
  Dir.glob('./sample_data/**/*.xls').each do |xlsfile|
    xls = Spreadsheet.open(xlsfile)
    result << "#{xlsfile}\n"
    xls.worksheets.each do |ws|
      result << "#{ws.name}\n"
      (0..256).each do |x|
        break unless ws[x,0]
        (0..256).each do |y|
          break unless ws[x,y]
          result << "[#{ws[x,y]}] "
        end
        result << "\n"
      end
      result << "----------\n"
    end
  end
  puts result
  File.open("./result.txt","w"){|io| io.write(result)}
end

def dummy
  Spreadsheet.inspect
end
