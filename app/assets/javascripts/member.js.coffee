# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(document).on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

$(document).ready ->
  $("#load-junior").show()
  $("#save-junior").hide()
  $("#load-senior").show()
  $("#save-senior").hide()
  $("#sticker").sticky topSpacing: 0
  $("#save-junior").on "click", (e) ->
    formData = $("#new_junior").serialize()
    alert $("#new_junior").valid()
    if $("#new_junior").valid()
      $.ajax "<%= juniors_create_path %>",
        type: "POST"
        dataType: "JSON"
        data: formData
        success: (data, textStatus, jqXHR) ->
          $("#load-junior").show()
          $("#save-junior").hide()
          alert "success" #data: return data from server
          return

        error: (jqXHR, textStatus, errorThrown) ->
          alert "failure" #if fails
          return

    e.preventDefault()
    false

  $("#load-junior").on "click", (e) ->
    data = undefined
    $.ajax
      type: "GET"
      url: "/juniors/new_form"
      dataType: "JSON"
      success: (data) ->
        console.log "success"
        $("#save-junior").show()
        $("#load-junior").hide()
        $("#new-junior").append data
        return

      error: (data) ->
        $("#save-junior").show()
        $("#load-junior").hide()
        $("#new-junior").append data.responseText
        $("#new_junior").validate
          debug: true
          rules:
            "junior[first_name]":
              required: true
              maxlength: 20

            "junior[last_name]":
              required: true
              maxlength: 20

            "junior[address]":
              required: true

            "junior[email]":
              email: true

            "junior[age]":
              required: true

        return

    e.preventDefault()
    false

  $("#save-senior").on "click", (e) ->
    formData = $("#new_senior").serialize()
    alert $("#new_senior").valid()
    if $("#new_senior").valid()
      $.ajax "/senior/create",
        type: "POST"
        dataType: "JSON"
        data: formData
        success: (data, textStatus, jqXHR) ->
          $("#load-senior").show()
          $("#save-senior").hide()
          alert "success" #data: return data from server
          return

        error: (jqXHR, textStatus, errorThrown) ->
          alert "failure" #if fails
          return

    e.preventDefault()
    false

  $("#load-senior").on "click", (e) ->
    data = undefined
    $.ajax
      type: "GET"
      url: "/senior/new_form"
      dataType: "JSON"
      success: (data) ->
        console.log "success"
        $("#save-senior").show()
        $("#load-senior").hide()
        $("#new-senior").append data
        return

      error: (data) ->
        $("#save-senior").show()
        $("#load-senior").hide()
        $("#new-senior").append data.responseText
        $("#new_senior").validate
          debug: true
          rules:
            "senior[position]":
              required: true
              maxlength: 10

            "senior[grade]":
              required: true

        return

    e.preventDefault()
    false

  return

  
