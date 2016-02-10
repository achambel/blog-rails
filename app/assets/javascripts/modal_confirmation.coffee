$ ->
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link)
    false

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialog = (link) ->
    html = """
           <div class="ui small modal" id="confirmationDialog">
             <div class="header">
              #{link.data('header')}
             </div>

             <div class="content">
              #{link.data('confirm')}
             </div>

             <div class="actions">
              <a data-dismiss="modal" class="ui negative button">
                <i class="remove icon"></i>
                #{link.data('cancel')}
              </a>
              <a data-dismiss="modal"
                                class="ui positive right labeled icon button">
                #{link.data('ok')}
                <i class="checkmark icon"></i>
              </a>
             </div>
          </div>

           """
    $(html).modal('setting', 'transition', 'horizontal flip').modal('show')
    $('#confirmationDialog .positive').on 'click', -> $.rails.confirmed(link)
