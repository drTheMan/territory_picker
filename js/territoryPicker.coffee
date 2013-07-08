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
    @world_option().prop('checked', true)

  append_world_option: ->
    @container.append(@world_option())

  world_option: ->
    unless @$world_option
      @$world_option = $('<input class="world" type="checkbox" />')

    @$world_option


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