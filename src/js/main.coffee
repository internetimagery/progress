# Throw a progress bar on screen, showing progress provided by url

# Grab "GET" params from the URL
GET_Params = ()->
  return new ->
    @[a[0]] = (if a.length > 1 then decodeURIComponent(a[1]) else true) for a in (i.split("=") for i in location.search.substr(1).split("&"))
    this

gauge = (val=0, min=0, max=100, label="", filter=(x)->x)->
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

# Do it!
# val = current value
# min = least ammount shown
# max = max ammount shown
# bg = url for background image
# type = type of value (ie $ / kms / people)
# lbl = label under gauge
@main = ->
  options = GET_Params()

  # Load up a fancy background image if requested
  if options.bg
    page = document.getElementById "page"
    page.style.backgroundImage = "url(#{options.bg})"

  g = gauge options.val, options.min, options.max, options.lbl, (x)->
    if options.type == "$"
      "$#{x}"
    else if options.type?
      "#{x} #{options.type}"
    else
      x
