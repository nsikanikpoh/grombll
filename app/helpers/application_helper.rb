module ApplicationHelper
		def full_title(page_title)
		 if user_signed_in? 
		 	base_title = "Grombll"
		 	
		else
			"Grombll | not logged in "
		end
		if page_title.empty?
			base_title
		else 
			"#{base_title} | #{page_title}"
		end
	end
	def header(text)
		content_for(:header) { text.to_s }
	end
	


end
