<!DOCTYPE html>
<html lang="en">
  <%=
    partial(
      'templates/partials/head.tpl',
      {
        cdn  : cdn,
        css  : css,
        site : site,
        svg  : svg
      }
    )
  %>

  <body>

      <div class="svgIcons"><%= svg %></div>

      <%=
        partial(
          'templates/partials/header.tpl',
          {
            active           : type,
            cdn              : cdn,
            site             : site
          }
        )
      %>

      <div class="container">

        <%=
          partial(
            'templates/partials/fuzzy.tpl',
            {
              list      : list,
              platforms : platforms,
              query     : query,
              type      : type,
              tags      : _.reduce( list, function( tags, entry ) {
                if ( entry.tags && entry.tags.length ) {
                  for ( var i = 0; i < entry.tags.length; ++i ) {
                    if ( _.indexOf( tags, entry.tags[ i ] ) === -1 ) {
                      tags.push( entry.tags[ i ] );
                    }
                  }
                }

                return tags;
              }, [] ).sort()
            }
          )
        %>

        <div class="row">

          <main class="main col col-9" role="main">

              <%=
                partial(
                  'templates/partials/lists/' + type + '.tpl',
                  {
                    list    : list,
                    partial : partial,
                    people  : people,
                    cdn     : cdn
                  }
                )
              %>
              <div id="noResultMsg" class="<%= ( _.filter( list, function( entry ) { return !entry.hidden; } ).length ) ? 'is-hidden' : '' %>">No results found</div>

          </main>

          <aside class="sidebar col col-3">

            <form action="" class="form">

              <h3>Sort</h3>

              <div class="form-field">

                <div class="radio-container">

                  <label>A-Z</label>
                  <input type="radio">

                </div>

                <div class="radio-container">

                  <label>Z-A</label>
                  <input type="radio">

                </div>

                <div class="radio-container">

                  <label>last Updated</label>
                  <input type="radio">

                </div>

              </div>

            </form>

            <form action="" class="form">

              <h3>Filter</h3>

              <fieldset>

                <legend>Price</legend>

                <div class="form-field">

                  <div class="checkbox-container">

                    <label>Free</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Paid</label>
                    <input type="checkbox">

                  </div>

                </div>

              </fieldset>

              <fieldset>

                <legend>Platform</legend>

                <div class="form-field">

                  <div class="checkbox-container">

                    <label>Grunt</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Gulp</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>CLI</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Node</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>PHP</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>JavaScript</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Angular</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Wordpress</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Chrome</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Firefox</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Service</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Bookmarklet</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Mac</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Windows</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Linux</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Illustrator</label>
                    <input type="checkbox">

                  </div>

                </div>

              </fieldset>

              <fieldset>

                <legend>Category</legend>

                <div class="form-field">

                  <select>
                    <option>images</option>
                  </select>

                </div>

              </fieldset>

            </form>

          </aside>

        </div>

      </div>

      <%=
        partial(
          'templates/partials/footer.tpl',
          {}
        )
      %>

    <script>
      window.list = <%= JSON.stringify(
        _.map( list, function( entry ) {
          return {
            fuzzy : entry.fuzzy,
            name  : entry.name.toLowerCase().replace( /[\s\.,:'"#\(\)|]/g, '-' )
          }
        } )
      ) %>;
    </script>
    <script src="<%= cdn %>/tooling.js?<%= hash.js %>" async></script>
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-53831300-1', 'auto');
      ga('send', 'pageview');
    </script>

  </body>

</html>

