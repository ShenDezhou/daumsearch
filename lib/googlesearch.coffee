Shell = require 'shell'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'daumsearch:daum-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://m.search.daum.net/search?w=tot&q=#{cased}"
        Shell.openExternal url
