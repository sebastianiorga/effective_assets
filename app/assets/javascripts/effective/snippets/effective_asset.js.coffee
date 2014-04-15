CKEDITOR.dialog.add 'effective_asset', (editor) ->
  title: 'Effective Asset'
  minWidth: 650,
  minHeight: 500,
  contents: [
    {
      id: 'tab1',
      label: 'Asset',
      title: 'Asset',
      elements: [
        {
          id: 'asset_id',
          type: 'text',
          label: 'Asset ID',
          setup: (widget) -> this.setValue(widget.data.asset_id)
          commit: (widget) -> widget.setData('asset_id', this.getValue()) if widget
        },
        {
          id: 'html_class',
          type: 'text',
          label: 'HTML Class',
          setup: (widget) -> this.setValue(widget.data.html_class)
          commit: (widget) -> widget.setData('html_class', this.getValue()) if widget
        }
      ] # /tab1 elements
    }, # /tab1
    {
      id: 'tab2',
      label: 'Insert / Upload',
      title: 'Insert / Upload',
      elements: [
        {
          id: 'iframe-insert',
          type: 'html',
          html: "<div><iframe class='effective_assets_iframe' style='width: 100%; height: 100%; min-height: 500px;' src='/effective/assets'></iframe></div>"
          onLoad: (evt) ->
            dialog = evt.sender # This is the CKEditor.dialog
            iframe = $('#' + dialog.getContentElement('tab2', 'iframe-insert').domId).children('iframe').first()
            iframe.on 'load', ->
              $(this).contents().on 'click', 'a.attachment-insert', (event) ->
                event.preventDefault()
                dialog.setValueOf('tab1', 'asset_id', $(event.currentTarget).data('asset-id'))
                dialog.commitContent()
                dialog.click('ok')
        }
      ] # /tab2 elements
    } # /tab2
  ] # /contents







