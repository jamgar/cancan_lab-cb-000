class NotesController < ApplicationController
  before_action :require_login, only: [:create]
  load_and_authorize_resource only: [:edit, :show, :update]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to root_path
    end
  end

  private
    def note_params
      params.require(:note).permit(:content, :visible_to)
    end

end
