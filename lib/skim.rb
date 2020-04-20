#!/usr/bin/env ruby

class Skim
  BookShelf = '__BOOK_SHELF__'
  class << self
    def categories
      @categories ||= Dir.children(BookShelf).select do |child|
        File.directory?(BookShelf + "/#{child}")
      end
    end

    def books
      @books ||= `find #{BookShelf} -iname '*pdf'`.lines.map(&:strip)
    end

    def find(words)
      re = /#{words.split.permutation.map{|a|a.join('.*')}.join('|')}/i
      books.select do |book|
        book.match(re)
      end.first
    end
  end
end

if __FILE__ == $0
  words = ARGV.join(' ')
  found = Skim.find(words).shellescape
  exec("__PDF_READER__ #{found} &")
end
