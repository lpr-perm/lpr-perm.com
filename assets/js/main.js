//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require clipboard

$(document).ready(function() {
  $('[data-toggle=clipboard]').each(function() {
    clipboard = new ClipboardJS(this)

    clipboard.on('success', function(e) {
      var trigger = $(e.trigger)

      trigger.tooltip({
        trigger:   'manual',
        title:     'Скопировано!',
        placement: 'bottom',
      })

      trigger.tooltip('show')

      setTimeout(function () { trigger.tooltip('hide') }, 500)
    })
  })
})
