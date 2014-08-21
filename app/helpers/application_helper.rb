module ApplicationHelper
	#creates a submit button with the given name with a cancel link
	#Accepts two arguments: Form object and the cancel link name
	def submit_or_cancel(form, name='cancel')
		link_to("Back", :back, :class => 'btn btn-primary pull-right') + " " + form.submit(:class => 'btn btn-primary pull-right' ) 
	end

	
end
