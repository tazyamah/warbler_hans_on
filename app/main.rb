require 'spreadsheet'
require 'zip'
require 'mail'

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

  # zip生成
  zip = Zip::OutputStream.write_buffer(
      ::StringIO.new(''),
      Zip::TraditionalEncrypter.new('test1234')
    ) do |buf|
      buf.put_next_entry('./sample_data/book.xls')
#      buf.put_next_entry('./sample_data/testcontent.txt')
      #buf.write(open('./sample_data/book.xls'){|f|f.read})
      #buf.put_next_entry('./sample_data/testcontent.txt')
    end.string
#  zip = Zip::Archive.open_buffer(Zip::CREATE)
#  zip.add_buffer('./sample_data/book.xls', 'contents')
#  zip.add_buffer('./sample_data/testcontent.txt', 'contents')
#  zip.encrypt('test1234')
#  zzz =  zip.read
#  zip.close

  # emlファイル生成テスト
  body = <<-EOB
    これはテストメール本文です。
    改行や

    空行が
    あっても問題なく出力されるはずです。
  EOB
  mail = Mail.new do
    from      'from@example.com'
    to        'to@example.com'
    subject   'これはテストメールです'
    body      body
    #add_file  filename: '添付ファイル.zip', content: zip.string
    add_file  filename: '添付ファイル.zip', content: zip
  end

  #File.open("result.zip", "wb:UTF-8:UTF-8"){|io| io.write(zip.string)}
  File.open("result.zip", "wb"){|io| io.write(zip)}
  File.open("result.eml", "wb"){|io| io.write(mail.encoded)}
end

def dummy
  Spreadsheet.inspect
end
