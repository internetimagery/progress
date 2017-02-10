# Throw a progress bar on screen, showing progress provided by url

# Grab "GET" params from the URL
GET_Params = ()->
  return new ->
    @[a[0]] = (if a.length > 1 then a[1] else true) for a in (i.split("=") for i in location.search.substr(1).split("&"))
    this

# Do it!
@main = ->
  bg = "https://4.bp.blogspot.com/-147DKI9BGEg/TjvBbOJ5m9I/AAAAAAAAA1U/dXTzKCyBdqk/s1600/Landscape-Wallpaper.jpg"
  page = document.getElementById "page"
  page.style.backgroundImage = "url(#{bg})"

  # background = document.querySelector "#background"
  # background.src = "https://i.imgur.com/dW3UWaP.jpg"
