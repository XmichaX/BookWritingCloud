module ApplicationHelper


	def user_books
		current_user.books
	end

	def username
		user.email
	end

	def book_user (book)
		book.users
	end

	def users
		User.all
	end


	def render_chunks(chunks, context)
		render(partial: "shared/chunks",
					 locals: {
							 caption: "All Chunks",
							 chunks: chunks,
							 context: context
					 }
		)
	end

	def get_edit_path(context, chunk)
		if Book == context
			edit_book_chunk_path(context, chunk)
		else
			edit_chapter_chunk_path(context, chunk)
		end
	end

	def get_path(context, chunk)
		if context.instance_of? Book
			book_chunk_path(context, chunk)
		else
			chapter_chunk_path(context, chunk)
		end
	end

end
