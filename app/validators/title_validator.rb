# class TitleValidator < ActiveModel::Validator
#     def validate(record)
#         @artist_songs = Song.all.select {|song| song.artist_name == record.artist_name}
        
#         @all_titles_and_years_hash = Hash.new
#         @artist_songs.each {|artist_song| @all_titles_and_years_hash[artist_song.title] = @artist_song.release_year}
        
#         @record_title_and_years_hash = Hash.new
#         @titles_and_years_hash.keys.select {|title| @record_title_and_years_hash[title] = record.title}
        
#         @uniq_year = @record_title_and_years_hash.values.uniq == @record_title_and_years_hash.values

#       if  @record_title_and_years_hash.size > 1 && !@uniq_year
#         record.errors[:title] << "Cannot be repeated by the same artist in the same year."
#       end

#     end
#   end