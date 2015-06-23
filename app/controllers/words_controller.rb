class WordsController < ApplicationController
  before_action :set_word, except: [:new, :index, :create]

  def index
    if params[:search].present?
      @words = Word.filter_category(params[:category_id].to_i).send params[:learn].downcase, current_user
      @words = @words.order_by_alphabet if "alphabet" == params[:sort_by]
      @words = @words.filter_content params[:word_search] if params[:word_search].present?
    else
      @words = Word.all
    end
    @words = @words.paginate page: params[:page], per_page: Settings.words_paginate
  end

  def show
  end

  def new
    @word = Word.new
    @word.answers.build
  end

  def edit
    @word.answers.build
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = I18n.t :word_success_created
      redirect_to @word
    else
      render "new"
    end
  end

  def update
    if @word.update word_params
      flash[:success] = I18n.t :word_success_updated
      redirect_to @word
    else
      render "edit"
    end
  end

  def destroy
    @word.destroy
    flash[:success] = I18n.t :word_success_destroy
    redirect_to words_path
  end

  private
  def set_word
    @word = Word.find params[:id]
  end

  def word_params
    params.require(:word).permit :content, :category_id, answers_attributes: [:id, :content, :correct, :_destroy]
  end
end
