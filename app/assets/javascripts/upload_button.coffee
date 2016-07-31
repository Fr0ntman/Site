$(document).on 'turbolinks:load', ->

  wrapper = $('.file_upload')
  inp = wrapper.find('input')
  btn = wrapper.find('button')
  lbl = wrapper.find('div')
  # Crutches for the :focus style:
  btn.focus(->
    wrapper.addClass 'focus'
    return
  ).blur ->
    wrapper.removeClass 'focus'
    return
  # Yep, it works!
  btn.add(lbl).click ->
    inp.click()
    return
  file_api = if window.File and window.FileReader and window.FileList and window.Blob then true else false
  inp.change(->
    file_name = undefined
    if file_api and inp[0].files[0]
      file_name = inp[0].files[0].name
    else
      file_name = inp.val().replace('C:\\fakepath\\', '')
    if !file_name.length
      return
    if lbl.is(':visible')
      lbl.text file_name
      btn.text '•••'
    else
      btn.text file_name
    return
  ).change()