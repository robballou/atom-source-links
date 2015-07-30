{CompositeDisposable} = require 'atom'

module.exports = AtomSourceLinks =
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-source-links:open-file': => @open_file()

    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-source-links:open-line': => @open_line()

  deactivate: ->
    @subscriptions.dispose()

  open_file: ->
    # do stuff

  open_line: ->
    # do stuff
