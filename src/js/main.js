(function() {
  var GET_Params;

  GET_Params = function() {
    return new function() {
      var a, i, j, len, ref;
      ref = (function() {
        var k, len, ref, results;
        ref = location.search.substr(1).split("&");
        results = [];
        for (k = 0, len = ref.length; k < len; k++) {
          i = ref[k];
          results.push(i.split("="));
        }
        return results;
      })();
      for (j = 0, len = ref.length; j < len; j++) {
        a = ref[j];
        this[a[0]] = (a.length > 1 ? a[1] : true);
      }
      return this;
    };
  };

  this.main = function() {
    var bg, page;
    bg = "https://4.bp.blogspot.com/-147DKI9BGEg/TjvBbOJ5m9I/AAAAAAAAA1U/dXTzKCyBdqk/s1600/Landscape-Wallpaper.jpg";
    page = document.getElementById("page");
    return page.style.backgroundImage = "url(" + bg + ")";
  };

}).call(this);
