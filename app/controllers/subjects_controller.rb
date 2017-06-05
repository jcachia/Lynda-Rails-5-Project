class SubjectsController < ApplicationController

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end

  def create
    # Instantiate a new object using form params
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action.
      # save always returns true or false.
      flash[:notice] = "Subject created successfully!"
      redirect_to(subjects_path)
    else
      # If the save fails, redisplay the form so the user can correct
      # Render just renders the template with fields populated.
      render('new')
    end

  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # find an object using form params
    @subject = Subject.find(params[:id])
    # Save the object
    if @subject.update_attributes(subject_params)
      # If save succeeds, redirect to the show action.
      # save always returns true or false.
      flash[:notice] = "Subject updated successfully!"
      redirect_to(subject_path(@subject))
    else
      # If the save fails, redisplay the form so the user can correct
      # Render just renders the template with fields populated.
      render('edit')
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully!"
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.required(:subject).permit(:name, :position, :visible)
  end

end