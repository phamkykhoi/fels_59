class WordsController < ApplicationController
  def index
    @words = Word.all.paginate page: params[:page], per_page: Settings.words_paginate
  end

  def show
    @word = Word.find params[:id]
  end

  def new
    @word = Word.new
    @word.answers.build
  end

  def edit
    @word = Word.find params[:id]
    @word.answers.build
    puts @word.answers
  end

  def create
    @word = Word.new word_params
    if  @word.save
      flash[:success] = I18n.t(:word_success_created)
      redirect_to @word
    else
      render "new"
    end
  end

  def update
    @word = Word.find params[:id]
    if @word.update word_params
      flash[:success] = I18n.t(:word_success_updated)
      redirect_to @word
    else
      render "edit"
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = I18n.t(:word_success_destroy)
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