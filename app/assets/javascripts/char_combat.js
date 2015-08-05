$(document).on('page:load', ready);
$(document).ready(ready)

function ready() {
  $('tr[data-link]').click(function() {
    window.location = this.dataset.link;
  });
};