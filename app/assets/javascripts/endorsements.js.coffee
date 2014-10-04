# // # Place all the behaviors and hooks related to the matching controller here.
# // # All this logic will automatically be available in application.js.
# // # You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).ready(function(){

# 	$('.endorsements-link').on('click', function(event){
# 		event.preventDefault()
		# $.post(this.href)
# 	});

# });


$(document).ready ->

	$('.endorsements-link').on 'click', ->
		endorsementCount = $(@).siblings('.endorsements-count')
		event.preventDefault()
		$.post @href, (response) ->
			endorsementCount.text(response.new_endorsement_count)