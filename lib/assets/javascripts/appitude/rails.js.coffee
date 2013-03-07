# make sure CSRF token is added to jquery ajax requests
$.ajaxSetup
    beforeSend: (xhr) ->
      token = $('meta[name="csrf-token"]').attr('content')
      xhr.setRequestHeader 'X-CSRF-Token', token