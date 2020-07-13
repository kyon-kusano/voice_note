class NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  
  def new
    @note = Note.new
  end
  
	def create
		@note = Note.new(note_params)
		if @note.save
      redirect_to note_path(@note)
		else
			flash.now[:alert] = '保存できませんでした'
      render :new
    end
    # Note.create(note_params)
    # redirect_to new_note_path

  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    note.update(note_params)
    redirect_to note_path(note.id)
  end

  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to root_path
  end

  private
  def note_params
    params.require(:note).permit(:title, :content).merge(user_id: current_user.id)
  end
end
