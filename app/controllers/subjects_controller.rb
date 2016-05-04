class SubjectsController < ApplicationController
  
  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
  end

  def create
    # 1.-Instantiate a new object using an instance variable pulling attributes using the params methods "require" and "permit"
    @subject = Subject.new(subject_params)
    # 2.-Save created object
    if @subject.save
      # 3.-If save meets params criteria redirect to desired action=> in this case scenario to the index action
      redirect_to(:action => 'index')
    else
    # 4.-If save fails, redisplay form so user can retry (UI-UX) 
    render('new')
    end 
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    # find an existing object using the params method
    if @subject.update_attributes(subject_params)
    # After I find my object update_attributes updates the features
    # The private method subject_params filters my attributes
      redirect_to(:action => 'show', :id => @subject.id)
    # If the params criteria is met redirect to show
    else
    # if the update fails, redisplay the form 'edit'
      render('edit')
    end    
  end  

  def delete
  end

  private

    def subject_params
        # same as using "params[:subject]", except
        # - raises an error if :subject is not present
        # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible)
    end  
end
