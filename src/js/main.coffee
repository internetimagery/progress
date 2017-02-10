# Throw a progress bar on screen, showing progress provided by url

# Grab "GET" params from the URL
GET_Params = ()->
  return new ->
    @[a[0]] = (if a.length > 1 then decodeURIComponent(a[1]) else true) for a in (i.split("=") for i in location.search.substr(1).split("&"))
    this

# Do it!
@main = ->
  options = GET_Params()

  # Load up a fancy background image if requested
  if options.bg
    page = document.getElementById "page"
    page.style.backgroundImage = "url(#{options.bg})"

  min = if options.min? then options.min else 0
  max = if options.max? then options.max else 100
  val = if options.val? then options.val else 0

  g = new JustGage {
    id: "gauge"
    value: val
    min: min
    max: max
    # title: "Visitors"
    label: "dollars earned"
    startAnimationType: "bounce"
    startAnimationTime: 3200
    counter: true
    showInnerShadow: true
    hideMinMax: true
    levelColors: ["#ff0000", "#f9c802", "#a9d70b"]
    textRenderer: (t)-> "$#{t}"
  }
