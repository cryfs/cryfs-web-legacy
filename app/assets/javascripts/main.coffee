# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $.ajaxSetup
    dataType: 'json'

selector = "#contact_form"

hideAll = ->
  $(selector).removeClass("has-error")
  $(selector).removeClass("has-success")
  $(selector+' .form-success').hide()
  $(selector+' .form-error-400').hide()
  $(selector+' .form-error-500').hide()
  $(selector+' .form-spinner').hide()
  $(selector+' .form-notification-area').hide()

$ ->
  $(document)
  .on "ajax:before", selector, () -> # TODO In newer rails this is probably ajax:beforeSend
    window.ga 'send', 'event', selector, 'click'
    hideAll()
    $(selector+' .form-spinner').show()
    $(selector+' .form-notification-area').show()
  .on "ajax:success", selector, (data, status, xhr) ->
    window.ga 'send', 'event', selector, 'success'
    hideAll()
    $(selector).addClass("has-success")
    $(selector+' .form-success').show()
    $(selector+' .form-notification-area').show()
  .on "ajax:error", selector, (event, status, error) ->
    window.ga 'send', 'event', selector, 'error'
    hideAll()
    $(selector).addClass("has-error")
    if (status.status >= 400 && status.status < 500)
      $(selector+' .form-error-400').show()
    else
      $(selector+' .form-error-500').show()
    $(selector+' .form-notification-area').show()


$ ->
  $(document).on 'click', "#download-btn", ->
    window.ga 'send', 'event', 'download', 'click_download_button'

  $(document).on 'show.bs.modal', "#downloadModal", ->
    window.ga 'send', 'event', 'download', 'show_download_dialog'

  $(document).on 'hide.bs.modal', "#downloadModal", ->
    window.ga 'send', 'event', 'download', 'hide_download_dialog'
    window.location.hash = ""

  $(document).on 'click', "#tablink-ubuntu", ->
    window.ga 'send', 'event', 'download', 'click_ubuntu_tab'

  $(document).on 'click', "#tablink-debian", ->
    window.ga 'send', 'event', 'download', 'click_debian_tab'

  $(document).on 'click', "#tablink-other", ->
    window.ga 'send', 'event', 'download', 'click_other_tab'

  $(document).on 'click', ".download-package-link", ->
    window.ga 'send', 'event', 'download', 'download_package'

  $(document).on 'copy', ".easyinstall", ->
    window.ga 'send', 'event', 'download', 'copy_easyinstall_cmd'

  if (window.location.hash == "#download")
    $("#downloadModal").modal()

  $(window).on 'hashchange', ->
    if (window.location.hash == "#download")
      $("#downloadModal").modal()
