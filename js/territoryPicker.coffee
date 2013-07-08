#
# Name    : <plugin name>
# Author  : <your name>, <your website url>, <twitter handle>
# Version : <version number>
# Repo    : <repo url>
# Website : <website url>
#

class TerritoryPicker
  constructor: (@container, @options) ->
    @append_world_option()
    @world_checkbox().prop('checked', true)

  append_world_option: ->
    @container.append(@world_checkbox())
    @container.append(@world_label())

  world_checkbox: ->
    unless @$world_option
      @$world_option = $('<input id="territory_world" type="checkbox" name="territories[world]" />')

    @$world_option

  world_label: ->
    unless @$world_label
      @$world_label = $('<label id="territory_world" for="territory_world">World</label>')

    @$world_label


jQuery ->
  $.territoryPicker = ( element, options ) ->
    # current state
    state = ''

    # plugin settings
    @settings = {}

    # jQuery version of DOM element attached to the plugin
    @$element = $ element

    # set current state
    @setState = ( _state ) -> state = _state

    #get current state
    @getState = -> state

    # get particular plugin setting
    @getSetting = ( key ) ->
      @settings[ key ]

    # call one of the plugin setting functions
    @callSettingFunction = ( name, args = [] ) ->
      @settings[name].apply( this, args )

    @$element = $ element

    @init = ->
      @settings = $.extend( {}, @defaults, options )

      @territory_picker = new TerritoryPicker(@$element, @settings)

      @setState 'ready'


    # initialise the plugin
    @init()

    # make the plugin chainable
    this

  # default plugin settings
  $.territoryPicker::defaults =
      message: 'Hello world'  # option description

  $.fn.territoryPicker = ( options ) ->
    this.each ->
      if $( this ).data( 'territoryPicker' ) is undefined
        plugin = new $.territoryPicker( this, options )
        $( this).data( 'territoryPicker', plugin )