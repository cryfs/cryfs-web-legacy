# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $.ajaxSetup
    dataType: 'json'

setup_ajax_form = (selector) ->
  $(selector)
  .bind "ajax:before", () -> # TODO In newer rails this is probably ajax:beforeSend
    $(selector).removeClass("has-error").removeClass("has-success")
    $(selector+' .form-success').hide()
    $(selector+' .form-error').hide()
    $(selector+' .form-spinner').show()
  .bind "ajax:success", (data, status, xhr) ->
    $(selector+' .form-spinner').hide()
    $(selector+' .form-error').hide()
    $(selector+' .form-success').show()
    $(selector).removeClass("has-error").addClass("has-success")
  .bind "ajax:error", (xhr, status, error) ->
    $(selector+' .form-spinner').hide()
    $(selector+' .form-success').hide()
    $(selector+' .form-error').show()
    $(selector).removeClass("has-success").addClass("has-error")

if window.setup_ajax_forms?
  for selector in window.setup_ajax_forms
    setup_ajax_form(selector)