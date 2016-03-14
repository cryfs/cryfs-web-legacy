# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $.ajaxSetup
    dataType: 'json'

setup_ajax_form = (selector) ->
  $(selector)
  .bind "ajax:before", () -> # TODO In newer rails this is probably ajax:beforeSend
    window.ga 'send', 'event', selector, 'click'
    $(selector).removeClass("has-error").removeClass("has-success")
    $(selector+' .form-success').hide()
    $(selector+' .form-error-400').hide()
    $(selector+' .form-error-500').hide()
    $(selector+' .form-spinner').show()
    $(selector+' .form-notification-area').show()
  .bind "ajax:success", (data, status, xhr) ->
    window.ga 'send', 'event', selector, 'success'
    $(selector).removeClass("has-error").addClass("has-success")
    $(selector+' .form-spinner').hide()
    $(selector+' .form-error-400').hide()
    $(selector+' .form-error-500').hide()
    $(selector+' .form-success').show()
    $(selector+' .form-notification-area').show()
  .bind "ajax:error", (xhr, status, error) ->
    window.ga 'send', 'event', selector, 'error'
    $(selector).removeClass("has-success").addClass("has-error")
    $(selector+' .form-spinner').hide()
    $(selector+' .form-success').hide()
    $(selector+' .form-error-400').hide()
    $(selector+' .form-error-500').hide()
    if (status.status >= 400 && status.status < 500)
      $(selector+' .form-error-400').show()
    else
      $(selector+' .form-error-500').show()
    $(selector+' .form-notification-area').show()

if window.setup_ajax_forms?
  for selector in window.setup_ajax_forms
    setup_ajax_form(selector)

$ ->
  $("#download-btn").click ->
    window.ga 'send', 'event', 'download', 'click_download_button'

  $("#downloadModal").on 'show.bs.modal', ->
    window.ga 'send', 'event', 'download', 'show_download_dialog'

  $("#downloadModal").on 'hide.bs.modal', ->
    window.ga 'send', 'event', 'download', 'hide_download_dialog'
    window.location.hash = ""

  $("#tablink-ubuntu").click ->
    window.ga 'send', 'event', 'download', 'click_ubuntu_tab'

  $("#tablink-debian").click ->
    window.ga 'send', 'event', 'download', 'click_debian_tab'

  $("#tablink-other").click ->
    window.ga 'send', 'event', 'download', 'click_other_tab'

  $(".download-package-link").click ->
    window.ga 'send', 'event', 'download', 'download_package'

  $(".easyinstall").on 'copy', ->
    window.ga 'send', 'event', 'download', 'copy_easyinstall_cmd'

  if (window.location.hash == "#download")
    $("#downloadModal").modal()

  $(window).on 'hashchange', ->
    if (window.location.hash == "#download")
      $("#downloadModal").modal()
