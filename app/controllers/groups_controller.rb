class GroupsController < ApplicationController
  # GET /groups
  def index
    @groups = Group.all(:order => 'name')
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups
  def create
    @group = Group.new(params[:group])

    if @group.save
      redirect_to groups_url
    else
      render :action => 'new'
    end
  end

  # GET /groups/:id/edit
  # Note: @group is set in require_existing_group
  def edit
  end

  # PUT /groups/:id
  # Note: @group is set in require_existing_group
  def update
    if @group.update_attributes(params[:group])
      redirect_to edit_group_url(@group), :notice => 'Your changes were saved successfully.'
    else
      render :action => 'edit'
    end
  end

  # DELETE /group/:id
  # Note: @group is set in require_existing_group
  def destroy
    @group.destroy
    redirect_to groups_url
  end
end

