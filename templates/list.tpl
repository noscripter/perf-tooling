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

            <!-- <form action="" class="form">

              <h3>Sort</h3>

              <div class="form-field">

                <div class="radio-container">

                  <label>
                    <input type="radio">A-Z
                  </label>


                </div>

                <div class="radio-container">

                  <label>
                    <input type="radio">Z-A
                  </label>

                </div>

              </div>

            </form> -->

            <form action="" class="form">

              <h3>Filter</h3>

<!--               <fieldset>

                <legend>Price</legend>

                <ul class="form-field">

                  <div class="checkbox-container">

                    <label>Free</label>
                    <input type="checkbox">

                  </div>

                  <div class="checkbox-container">

                    <label>Paid</label>
                    <input type="checkbox">

                  </div>

                </ul>

              </fieldset> -->

              <fieldset>

                <legend>Platform</legend>

                <div class="form-field">


                  <% _.each( platforms, function( platform ) { %>
                    <div class="checkbox-container">

                      <label for="input-platform-<%= platform %>"><%= platform %></label>
                      <input id ="input-platform-<%= platform %>" type="checkbox" value="<%= platform %>">

                    </div>

                  <% } ) %>

                </div>

              </fieldset>

              <fieldset>

                <legend>Category</legend>

                <div id="tags-filter" class="list-unstyled">

                <% _.each( tags, function( tag ) { %>

                  <div class="checkbox-container">

                    <label for="input-tag-<%= tag %>"><%= tag %></label>
                    <input id ="input-tag-<%= tag %>" type="checkbox" value="<%= tag %>">

                  </div>

                <% } ) %>

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
            name  : entry.name.toLowerCase().replace( /[\s\.,:'"#\(\)|]/g, '-' ),
            tags  : entry.tags
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

