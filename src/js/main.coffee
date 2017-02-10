# Throw a progress bar on screen, showing progress provided by url

# Grab "GET" params from the URL
GET_Params = ()->
  return new ->
    @[a[0]] = (if a.length > 1 then decodeURIComponent(a[1]) else "") for a in (i.split("=") for i in location.search.substr(1).split("&"))
    this

# Make a gauge showing progress
gauge = (val=0, min=0, max=100, label="", filter=(x)->x)->
  val = parseInt(val)
  min = parseInt(min)
  max = parseInt(max)
  if val >= max
    setTimeout ->
      confetti()
    , 2500
  return new JustGage {
    id: "gauge"
    value: val
    min: min
    max: max
    label: label
    startAnimationType: "bounce"
    startAnimationTime: 3200
    counter: true
    showInnerShadow: true
    hideMinMax: true
    levelColors: ["#ff0000", "#f9c802", "#a9d70b"]
    textRenderer: filter
    valueFontColor: "#ffffff"
    valueFontFamily: "Arial"
    # onAnimationEnd: ->
      # console.log "Done"
  }

# pop up a window
settings = ()=>
  uglipop {
    class: "popup"
    source: "div"
    content: "popup"
  }
  options = GET_Params()
  for i in document.forms[1].getElementsByTagName "input"
    if options[i.name]?
      i.value = options[i.name]
  @get_url()

@get_url = ->
  args = ("#{i.name}=#{encodeURIComponent i.value}" for i in document.forms[1].getElementsByTagName "input").join "&"
  url = "#{location.protocol}//#{location.hostname}#{location.pathname}?#{args}"
  for link in document.getElementsByClassName "url"
    link.href = url
    link.innerHTML = url

# Do it!
# val = current value
# min = least ammount shown
# max = max ammount shown
# bg = url for background image
# type = type of value (ie $ / kms / people)
# lbl = label under gauge
@main = ->
  # Set up our settings button
  document.getElementById "cog"
  .addEventListener "click", settings

  # Get our requested parameters
  options = GET_Params()

  settings() if not options.val?

  # Load up a fancy background image if requested
  if options.bg
    page = document.getElementById "page"
    page.style.backgroundImage = "url(#{options.bg})"

  # Build our progress gauge
  g = gauge options.val, options.min, options.max, options.lbl, (x)->
    if options.type == "$"
      "$#{x}"
    else if options.type == "£"
      "£#{x}"
    else if options.type?
      "#{x} #{options.type}"
    else
      x
