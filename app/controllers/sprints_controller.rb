class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]
 skip_before_filter  :verify_authenticity_token
 
  # GET /sprints
  # GET /sprints.json
  def index
    @sprints = Sprint.where('project_id = ?', session[:current_project])
    session[:current_sprint] = nil
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
    session[:current_sprint] = @sprint.id
    
    @sprinttaskscanadd = Task.where(user_story_id: UserStory.select("id").where(project_id: Project.select("id").where('id = ?',session[:current_project
])), sprint_id: nil )
    @sprinttasks = Task.where('sprint_id = ?', session[:current_sprint])
  end

  def addnewtasktosprint
    a = Task.find_by id: params['tasktoadd']
    a.sprint_id = session[:current_sprint]
    a.save
    redirect_to(:controller => 'sprints', :action => 'show',:id =>session[:current_sprint])
  end


  def sprintbacklog
    @usertaskstodo = Task.where('status = ? AND sprint_id = ?', 'to do', session[:current_sprint])
    @usertasksdoing = Task.where('status = ? AND sprint_id = ?', 'doing', session[:current_sprint])
    @usertasksdone = Task.where('status = ? AND sprint_id = ?', 'done', session[:current_sprint])
  end
  
  

  def backlogChangeToDo
    a = Task.find_by id: params['taskid']
    a.status = 'to do'
    a.save
    redirect_to(:action => 'sprintbacklog',:id =>session[:current_sprint])
  end

  def backlogChangeToDoing
    a = Task.find_by id: params['taskid']
    a.status = 'doing'
    a.save
    redirect_to(:action => 'sprintbacklog',:id =>session[:current_sprint])
  end

  def backlogChangeToDone
    a = Task.find_by id: params['taskid']
    a.status = 'done'
    a.save
    redirect_to(:action => "sprintbacklog",:id =>session[:current_sprint])
  end


def removeTask
a = Task.find_by id: params['taskId']
    a.sprint_id = nil
a.save
redirect_to(:action => 'show',:id =>session[:current_sprint])
end







  # GET /sprints/new
  def new
    @sprint = Sprint.new
  end

  # GET /sprints/1/edit
  def edit
  end

  # POST /sprints
  # POST /sprints.json
  def create

@projct=Project.find(session[:current_project])
#user_stories.create
    @sprint = @projct.sprints.create(sprint_params)
#UserStory.new(user_story_params)


    respond_to do |format|
      if @sprint.save
        format.html { redirect_to @sprint, notice: 'Sprint was successfully created.' }
        format.json { render :show, status: :created, location: @sprint }
      else
        format.html { render :new }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/1
  # PATCH/PUT /sprints/1.json
  def update
    respond_to do |format|
      if @sprint.update(sprint_params)
        format.html { redirect_to @sprint, notice: 'Sprint was successfully updated.' }
        format.json { render :show, status: :ok, location: @sprint }
      else
        format.html { render :edit }
        format.json { render json: @sprint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint.destroy
    respond_to do |format|
      format.html { redirect_to sprints_url, notice: 'Sprint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:name, :duration, :start_date, :end_date)
    end
end
