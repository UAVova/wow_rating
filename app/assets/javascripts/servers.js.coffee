jQuery ->
  $('form').on 'click', '.add-realm-btn', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
  $('form').on 'click', '.remove-realm-btn', (event) ->
    $(this).closest('fieldset').remove()
    event.preventDefault()
  $(document).on 'click', '.show-more', 'click', (event) ->
    if $('.server-story').height() < 200
      $('.server-story .text').data('text-old', $('.server-story .text').html())
      $('.server-story .text').html($('.server-story .text').data('text'))
      viewDescription($('.server-story .text').height())
    else
      $('.server-story .text').html($('.server-story .text').data('text-old'))
      viewDescription(100, "expanded")
    event.preventDefault()

  viewDescription = (size, state = "collapsed") ->
    if state == "collapsed"
      img = 'url(/assets/show_more_expanded.png'
      buttonText = 'Hide full description'
    else
      img = 'url(/assets/show_more.png'
      buttonText = 'Show full description'
    $('.server-story').height(size)
    $('.show-more').css('background-image', img)
    $('.show-more').html(buttonText)

  $(document).on 'click', '.add-review-btn', (event) ->
    if $('.new_review').length > 0
      if $('.new_review').is(':visible')
        $('.new_review').slideUp()
      else
        $('.new_review').slideDown()
    else
      $('.review-buttons').after($('.add-review-btn').data('form'))
      $('.star').rating()
      $('.new_review').hide().slideDown()
    event.preventDefault()