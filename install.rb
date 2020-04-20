puts "what's the root dir of your pdf library?"
book_shelf = gets.strip
fail "book shelf isn't a directory" unless File.directory? book_shelf

puts "what's your preferred pdf reader(default: zathura)?"
pdf_reader = gets.strip
pdf_reader = 'zathura' if pdf_reader.empty?

src = File.open('lib/skim.rb', 'r'){|f|f.read}

src = src.sub('__BOOK_SHELF__', book_shelf)
         .sub('__PDF_READER__', pdf_reader)

where = File.expand_path('~/bin/skim')

File.open(where, 'w'){|f|f.write(src)}
File.chmod(0700, where)

puts "installed. try:\n\t$ skim ruby microscope"
