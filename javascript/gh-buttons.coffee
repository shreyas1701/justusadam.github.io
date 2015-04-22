class Main

  get_data: (retry=true) =>
    if window.XMLHttpRequest  // Mozilla, Safari, IE7+ ...
        httpRequest = new XMLHttpRequest()
    else if window.ActiveXObject // IE 6 and older
        httpRequest = new ActiveXObject("Microsoft.XMLHTTP")

    httpRequest.onreadystatechange = =>
      if httpRequest.readyState == 4
        if httpRequest.status == 200
          data = JSON.parse(httpRequest.responseText)
          @update_buttons(data)
        else
          console.log("request failed")
          if retry
            get_data(false)
      else
        console.log("request not reeady")

    httpRequest.open('GET', 'url', true)

  update_buttons: (data) ->
    
