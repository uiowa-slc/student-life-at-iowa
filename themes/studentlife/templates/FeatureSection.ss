<section class="fixed bg{$Pos}" data-bottom-top="background-position: 50% 100%"  data-top-bottom="background-position: 50% 0%" <% if BackgroundImage %>style="background-image: url('$BackgroundImage.URL');" <% end_if %>>
    <div class="photo-text" data-bottom-top="background-color:rgba(0,0,0,0);" data-top-bottom="background-color:rgba(0,0,0,1);">
      <div class="inner">
        <h1 class="section-title">$Title</h1>
        <div class="section-desc">$Content</div>
        <section id="grid" class="grid clearfix">
          <% loop Features.Limit(4) %>
          <a href="$Link" data-path-hover="m 180,54.57627 -180,0 L 0,0 180,0 z">
            <figure>
              <img src="{$Image.URL}" />
              <svg viewBox="0 0 180 320" preserveAspectRatio="none"><path d="M 180,160 0,218 0,0 180,0 z"/></svg>
              <figcaption>
                <h2>$Title</h2>
                <p>$Content</p>
                <button>View</button>
              </figcaption>
            </figure>
          </a>
          <% end_loop %>
        </section>
      </div>
    </div>
  </section>
