class TranslationController < ApplicationController
  def new
    @translation = Translation.new
  end

  def create
    if @translation.save
      flash[:success] = 'Translation request is sent'
      Estimates.perform(@translation)
      redirect_to new_translation_path
    else
      flash[:error] = 'Translation request is not sent'
      render :new
    end
  end

  def receive
    # translations.save params
  end

private

  def translation_params
    params.require(:translation).permit(:input_text, :output_text, :source_language, :target_language,
      :words, :price, :pid)
  end
end
