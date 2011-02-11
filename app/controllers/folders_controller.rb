class FoldersController < ApplicationController
  # GET /folder
  def index
    redirect_to folder_url(Folder.root)
  end

  # GET /folders/:id
  # Note: @folder is set in require_existing_folder
  def show
  end

  # GET /folders/:id/folders/new
  # Note: @parent_folder is set in require_existing_parent_folder
  def new
    @folder = @parent_folder.children.build
  end

  # POST /folders/:id/folders
  # Note: @parent_folder is set in require_existing_parent_folder
  def create
    @folder = @parent_folder.children.build(params[:folder])

    if @folder.save
      redirect_to folder_url(@parent_folder)
    else
      render :action => 'new'
    end
  end

  # GET /folders/:id/edit
  # Note: @folder is set in require_existing_folder
  def edit
  end

  # PUT /folders/:id
  # Note: @folder is set in require_existing_folder
  def update
    if @folder.update_attributes(params[:folder])
      redirect_to edit_folder_url(@folder), :notice => 'Your changes were saved successfully.'
    else
      render :action => 'edit'
    end
  end

  # DELETE /folder/:id
  # Note: @folder is set in require_existing_folder
  def destroy
    parent_folder = @folder.parent
    @folder.destroy
    redirect_to folder_url(parent_folder)
  end
end

