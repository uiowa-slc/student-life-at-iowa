<!DOCTYPE html>
<!--[if lt IE 9]>         <html lang="en" class="lt-ie9 no-js"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="en" class="no-js demo-1"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home | Student Life Marketing &amp; Design.</title>
<% base_tag %>
<% include Ascii %>
<!-- Typekit -->
<% include TypeKit %>

<!-- CSS -->
<link rel="stylesheet" href="{$ThemeDir}/css/master.css">

<!-- IE FIXES -->
<!--[if lt IE 9]>
    <script src="{$ThemeDir}/js/ie/html5shiv.js"></script>
    <script src="{$ThemeDir}/js/ie/respond.min.js"></script>
<![endif]-->

</head>

<body>
  <% include DivisionBar %>
  <% include Header %>


  <section id="collage">
    <div class="collage-top"></div>
    <div class="photos"></div>
    <div class="photos2"></div>
    <div class="photos3"></div>
    <div class="photos4"></div>
    <div class="collage-desc">
      <div class="inner">
        <h1>Student Life @ Iowa</h1>
        <p>The Division of Student Life fosters student success by creating and promoting inclusive educationally purposeful services and activities within and beyond the classroom.</p>
      </div>
    </div>
    <!-- <span class="scrollarrow"></span> -->
  </section>

  <% include MainNav %>

  $Layout


  <footer class="footer" role="contentinfo" style="z-index: 105;">

  </footer>

  <!-- JS -->
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="{$ThemeDir}/js/build/production.min.js"></script>
  <script type="text/javascript">
    skrollr.init({
    forceHeight: false
  });
  </script>
  <script>
      (function() {

        function init() {
          var speed = 250,
            easing = mina.easeinout;

          [].slice.call ( document.querySelectorAll( '#grid > a' ) ).forEach( function( el ) {
            var s = Snap( el.querySelector( 'svg' ) ), path = s.select( 'path' ),
              pathConfig = {
                from : path.attr( 'd' ),
                to : el.getAttribute( 'data-path-hover' )
              };

            el.addEventListener( 'mouseenter', function() {
              path.animate( { 'path' : pathConfig.to }, speed, easing );
            } );

            el.addEventListener( 'mouseleave', function() {
              path.animate( { 'path' : pathConfig.from }, speed, easing );
            } );
          } );
        }

        init();

      })();
    </script>

</body>
</html>
