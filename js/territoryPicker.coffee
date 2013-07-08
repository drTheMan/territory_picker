#
# Name    : <plugin name>
# Author  : <your name>, <your website url>, <twitter handle>
# Version : <version number>
# Repo    : <repo url>
# Website : <website url>
#

class TerritoryPicker
  defaults:
    territories:
      africa:
        label: 'Africa'
        territories:
          dz:
            label: 'Algeria'

  constructor: (@container, @options) ->
    @container.append @territory_options({world: {label: 'World'}})
    @container.append @territory_options(@defaults.territories)

  territory_options: (territories_data) ->
    result = $('<ul class="territory_options"></ul>')

    $.each territories_data, (territory_code, territory_data) =>
      result.append @territory_option(territory_code, territory_data.label)
      
      if territory_data.territories
        sub = $('<li></li>')
        sub.append @territory_options(territory_data.territories)
        result.append sub

    result

  territory_checkbox: (territory_code, options) ->
    $('<input id="territory_'+territory_code+'" type="checkbox" name="territories['+territory_code+']" checked="checked" />')

  territory_label: (territory_code, territory_label, options) ->
    $('<label id="territory_'+territory_code+'_name" for="territory_'+territory_code+'">'+territory_label+'</label>')

  territory_option: (territory_code, territory_label, options) ->
    option = $('<li></li>')
    option.append( @territory_checkbox(territory_code, options) )
    option.append( @territory_label(territory_code, territory_label, options) )
    option


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