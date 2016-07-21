# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

selector = "#interested_user_form"

hideAll = ->
  $(selector).removeClass("has-error")
  $(selector).removeClass("has-success")
  $(selector+' .form-success').hide()
  $(selector+' .form-error-invalid-email').hide()
  $(selector+' .form-error-unsubscribed').hide()
  $(selector+' .form-error-other').hide()
  $(selector+' .form-spinner').hide()
  $(selector+' .form-notification-area').hide()

$ ->
  $(selector)
  .bind "ajax:before", () -> # TODO In newer rails this is probably ajax:beforeSend
    window.ga 'send', 'event', selector, 'click'
    hideAll()
    $(selector+' .form-spinner').show()
    $(selector+' .form-notification-area').show()
  .bind "ajax:success", (data, status, xhr) ->
    window.ga 'send', 'event', selector, 'success'
    hideAll()
    $(selector).addClass("has-success")
    $(selector+' .form-success').show()
    $(selector+' .form-notification-area').show()
  .bind "ajax:error", (event, xhr) ->
    window.ga 'send', 'event', selector, 'error'
    hideAll()
    $(selector).addClass("has-error")
    error = JSON.parse(xhr.responseText)
    if (error.reason == "unsubscribed")
      $(selector+' .form-error-unsubscribed').show()
    else if (error.reason == "invalid-email")
      $(selector+' .form-error-invalid-email').show()
    else
      $(selector+' .form-error-other').show()
    $(selector+' .form-notification-area').show()
