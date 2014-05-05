class BooksController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  # GET /books
  # GET /books.json
  def index
    @books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        current_user.books<<@book
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /books
  # POST /books.json
  def addMe
    @book = Book.find(params[:id])
    respond_to do |format|
      if !@book.users.find_by_id(current_user.id)
        current_user.books<<@book
        format.html { redirect_to @book, notice: 'You were successfully added.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { redirect_to @book, notice: 'You are already an author of this book' }
      end
    end
  end

  # POST /books
  # POST /books.json
  def deleteMe
    @book = Book.find(params[:id])
    current_user.books.delete(@book)
    respond_to do |format|
      @book.users.delete(current_user)
      format.html { redirect_to @book, notice: 'You were successfully deleted.' }
      format.json { render json: @book, status: :created, location: @book }
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if !@book.users.find_by_id(current_user.id)
        format.html { redirect_to @book, notice: 'You are not an author of this book' }
      else
        if @book.update_attributes(params[:book])
          format.html { redirect_to @book, notice: 'Book was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @book.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])

    respond_to do |format|
      if (@book.users.find_by_id(current_user.id) && @book.users.count == 1)
        @book.destroy
        format.html { redirect_to books_url, notice: 'Book ' + '"' + @book.title + '"' + ' was successfully destroyed.' }
        format.json { head :no_content }
      else
        @books = Book.all
        format.html { redirect_to @book, notice: 'You are not the only author. Destroying is not possible ' }
      end
    end
  end
end
