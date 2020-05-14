class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else   
            render :new
        end
    end

    def new
        @song = Song.new
    end

    def edit
        current_song
    end
    
    def show
        current_song
    end

    def update
        current_song
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        current_song
        @song.destroy
        redirect_to songs_path
    end

    private

    def current_song
        @song ||= Song.find_by_id(params[:id])
    end

    def song_params
        params.require(:song).permit(:title,:released,:release_year,:artist_name,:genre)
    end

end
