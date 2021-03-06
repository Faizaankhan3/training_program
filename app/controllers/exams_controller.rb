class ExamsController < ApplicationController

  before_action :logged_in_user
  before_action :exclusive_admin, only: [:index, :show, :edit, :update, :delete, :create, :new, :associate, :destroy]

  def index
    @exams = Exam.sorted
    render('index')
  end

  def show
    @exam = Exam.find(params[:id])
  end

  def question_paper
    @exam = Exam.find(params[:id])
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(allowed_params)
    if @exam.save
      flash[:success] = 'Successfully created exam'
      redirect_to exams_path
    else
      render :new
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
        @exam = Exam.find(params[:id])
        if @exam.update_attributes(allowed_params)
          flash[:success] = "Updation Successful."
          redirect_to exams_path
        else
          render('edit')
        end
  end

  def delete
  end

  def destroy 
    @exam = Exam.find(params[:id])
    @exam.destroy
    redirect_to (exams_path)
  end

  def associate
    @candidates = User.where(admin_user: false)
    @exam = Exam.find(params[:id])
    if (@exam.questions.empty?)
      flash[:info] = "Question Paper is not yet ready"
      redirect_to exams_path
    end
  end

  private
  
    def allowed_params
      params.require(:exam).permit(:exam_name)
    end
end
