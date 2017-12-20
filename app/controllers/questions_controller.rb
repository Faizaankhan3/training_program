class QuestionsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.create(question_params)
    redirect_to exam_path(@exam)
  end
  # def new
  #   @exam_id = params[:exam_id]
  #   @exam_name = params[:exam_name]
  #   @question = Question.new
  # end

  # def create
  #   @question = Question.new(question_params)
  #   if @question.save
  #     flash[:notice] = "Question Added Successfully"
  #     redirect_to new_question_path({ exam_id: @question.exam.id })
  #   else
  #     redirect_to(exams_path)
  #   end
  # end

  def edit
  end

  def delete
  end

  def destroy 
    @exam = Exam.find(params[:exam_id])
    @question = @exam.questions.find(params[:id])
    @question.destroy
    redirect_to exam_path(@exam)
  end

  private

    def question_params
      params.require(:question).permit(:question_description, :exam_id)
    end
end
