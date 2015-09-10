module ApplicationHelper

	def flash_message
		if flash[:notice]
			"<p>#{flash[:notice]}</p>".html_safe
		elsif flash[:alert]
			"<p>#{flash[:alert]}</p>".html_safe
		end
	end

end
