require 'pry'
require_relative '../lib/skim'

RSpec.describe Skim do
  context 'is under-complicated' do
    it 'lives in ~/bin' do
      raise unless `skim`
    end

    it 'takes plain words as arguments' do
      raise unless `skim eloquent ruby`
    end
  end

  # umm, now just unit test TDD it
  context 'already knows shit' do
    it 'finds the book shelf' do
      raise unless Dir.exist? Skim::BookShelf
    end

    it 'knows my categories' do
      categories = Skim.categories

      raise unless Skim.categories.include? 'ruby'
      expect(categories).to include('ruby', 'linux', 'misc')
    end

    it 'knows how many books are in there' do
      raise unless Skim.books.count > 100
    end
  end

  context 'finds books' do
    it 'given a string' do
      found = Skim.find 'eloquent ruby'

      expect(found).to end_with('pdf')
    end
  end
  # at this point, i don't know how to test it: cli interaction.  
  # have inklings, but just write it
end
