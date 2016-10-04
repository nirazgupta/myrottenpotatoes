class CreateMovies < ActiveRecord::Migration
  def change
    create_table 'movies' do |t|
      t.string 'title'
      t.string 'rating'
      t.text 'description'
      t.datetime 'release_date'
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
    
    def self.find_by_first_letter(letter)
    find(:all, :conditions => ['title LIKE ?', "#{letter}%"], :order => 'title ASC')
    end
  end
end