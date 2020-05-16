class NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  
  def new
    @note = Note.new
  end
  
  def create
    Note.create(note_params)
  end

  def show
    @note = Note.find(params[:id])
  end

  private
  def note_params
    params.require(:note).permit(:title, :content).merge(user_id: current_user.id)
  end
end
