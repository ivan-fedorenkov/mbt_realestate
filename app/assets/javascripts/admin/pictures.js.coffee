$(->
  $('#pictures-list > .picture').each(->
    $(this).click(->
      $(this).children('img').toggleClass('selected-picture')
      $checkbox = $(this).children('input[type="checkbox"]') 
      $checkbox.prop("checked", !$checkbox.prop("checked"))
    )
    $(this).children('input[type="checkbox"]').prop("checked", false)
  )
)