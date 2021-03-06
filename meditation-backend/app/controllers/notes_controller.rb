class NotesController < ApplicationController
    def index
        note = Note.all 
        render json: note
    end

    def create
        note = Note.create(date: params[:date], meditation_id: params[:meditation_id], description: params[:description])
        render json: note
    end

    def update 
        note = Note.find(params[:id])
        note.update(note_params)
        render json: note
    end

    def destroy
        note = Note.find(params[:id])
        note.destroy
        render json: {"Message": "Note was deleted"}
    end

    private

    def note_params
        params.require(:note).permit(:date, :meditation_id, :description)
    end
end
