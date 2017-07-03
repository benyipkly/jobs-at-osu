# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

 $(document).on "turbolinks:load", ->
  charShow = 140
  $desc = $('#jobs tbody td:nth-child(4)')
  $desc.each (i, e) ->
    if $(e).text()?.length > charShow
      text = $(e).text().substring(0,charShow)
      moreText = $(e).text().substring(charShow)
      html = text + '<span class="moreText">' + moreText + '</span> <span class="more">Read more...</span>'
      $(e).html(html)

  $('.more').click ->
    if $(this).hasClass('l')
      $(this).removeClass('l')
      $(this).html('Read more...')
    else
      $(this).addClass('l')
      $(this).html('Read less')

    $(this).prev().toggle()


  $('#jobs').dataTable
    bJQueryUI: true
