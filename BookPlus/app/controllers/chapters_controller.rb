class ChaptersController < ApplicationController

	before_filter :authenticate_user!
	before_filter :find_book

	def show
		@chapter = Chapter.find(params[:id])
		respond_to do |format|
			format.html { render_check_template }
			format.json { render json: @chapter }
		end

	end

	def edit
		@chapter = Chapter.find(params[:id])

		render_check_template

	end

	def new
		@chapter = Chapter.new

		respond_to do |format|
			format.html { render_check_template }
			format.json { render json: @chapter }
		end
	end

	def create
		@chapter = Chapter.new(params[:chapter])
		@chapter.book = @book

		respond_to do |format|
			if @chapter.save
				format.html { redirect_to @book, notice: I18n.t('views.chapter.flash_messages.book_was_successfully_created') }
				format.json { render json: @chapter, status: :created, location: @chapter }
			else
				format.html { render action: "new" }
				format.json { render json: @chapter.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@chapter = Chapter.find(params[:id])

		respond_to do |format|
			if (@chapter.update_attributes(params[:chapter]))
				format.html { redirect_to @book, notice: I18n.t('views.chapter.flash_messages.book_was_successfully_updated') }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @chapter.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@chapter = Chapter.find(params[:id])
		@chapter.destroy

		respond_to do |format|
			format.html { redirect_to @book }
			format.json { head :no_content }
		end
	end

	private # all public methods are actions
	def find_book
		@book = Chapter.find(params[:id]).book
	end
end