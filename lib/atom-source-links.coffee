{CompositeDisposable} = require 'atom'
{Directory} = require 'atom'
exec = require('child_process').exec
path = require('path')

module.exports = AtomSourceLinks =
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a
    # CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-source-links:open-file': => @open_file()

    @subscriptions.add atom.commands.add 'atom-workspace',
      'atom-source-links:open-line': => @open_line()

  deactivate: ->
    @subscriptions.dispose()

  open_file: ->
    editor = atom.workspace.getActivePaneItem()
    if !editor
      return

    filePath = editor.getPath()
    if !filePath
      return

    atom.project.repositoryForDirectory new Directory(path.dirname(filePath))
      .then (projectRepo) ->
        unless projectRepo
          return

        console.log projectRepo

  open_line: ->
    # do stuff
