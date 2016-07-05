class TranslationController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :receive

  def index
    @translations = Translation.all
  end

  def new
    @translation = Translation.new
  end

  def create
    @translation = Translation.new(translation_params)

    if @translation.save
      flash[:success] = 'Translation request is sent'
      @result = Payment.new(@translation).estimate
      session[:translation] = @result
      redirect_to translation_path(@translation)
    else
      flash[:error] = 'Translation request is not sent'
      render :new
    end
  end

  def show
    @translation = Translation.find(params['id'])
    @result = session[:translation].split("\n")
    @translation.update(pid: @result[5])
  end

  def confirm
    @translation = Translation.find(params['translation_id'])

    flash[:success] = 'Translation confirmed'
    @result = Payment.new(@translation).perform
    redirect_to new_translation_path(@translation)
  end

  def receive
    translation = Translation.find(params['translation_id'])
    translation.update(output_text: params['text'])
    render nothing: true, status: :ok
  end

private

  def translation_params
    params.require(:translation).permit(:input_text, :output_text, :source_language, :target_language,
      :words, :price, :pid)
  end
end
