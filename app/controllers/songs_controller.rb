class SongsController < ApplicationController

    before_action :set_song!, only: [:show, :edit, :update]

    def index
        @songs = Song.all
    end 

    def new
        @song = Song.new
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

    def show
        if !@song
            redirect_to songs_path
        end
    end

    def edit

    end

    def update
        @song.update(song_params)
        if @song.valid? 
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        Song.find_by_id(params[:id]).destroy
        redirect_to songs_path
    end
    
    private

    def set_song!
        @song = Song.find_by_id(params[:id])
    end
    
    def song_params
        params.require(:song).permit(:title, :release_year, :released, :genre, :artist_name)
    end

end
