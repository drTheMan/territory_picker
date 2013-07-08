describe 'TerritoryPicker', ->
  options =
    message: 'Hello World'

  beforeEach ->
    loadFixtures 'fragment.html'
    @$element = $( '#fixtures' )

  describe 'plugin behavior', ->
    it 'should be available on the jQuery object', ->
      expect( $.fn.territoryPicker ).toBeDefined()

    it 'should be chainable', ->
      expect( @$element.territoryPicker() ).toBe @$element

    it 'should offers default values', ->
      plugin = new $.territoryPicker( @$element )

      expect( plugin.defaults ).toBeDefined()

    it 'should overwrites the settings', ->
      plugin = new $.territoryPicker( @$element, options )

      expect( plugin.settings.message ).toBe( options.message )

  describe 'plugin state', ->
    beforeEach ->
      @plugin = new $.territoryPicker( @$element )

    it 'should have a ready state', ->
      expect( @plugin.getState() ).toBe 'ready'

    it 'should be updatable', ->
      @plugin.setState( 'new state' )

      expect( @plugin.getState() ).toBe 'new state'

  describe 'initialization', ->

    describe 'worldwide option', ->
      beforeEach ->
        new $.territoryPicker( @$element )

      it 'should generate a \'worldwide?\' checkbox', ->
        expect( $( 'input#territory_world' ) ).toExist()
        expect( $( 'input#territory_world' ).prop('type') ).toBe('checkbox')
        expect( $( 'input#territory_world' ).prop('name') ).toBe('territories[world]')
        expect( $( 'input#territory_world' ) ).toBeChecked()
  
      it 'should generate a \'worldwide\' label', ->
        expect( $( 'label#territory_world' ) ).toExist()
        expect( $( 'label#territory_world' ).prop('for') ).toBe('territory_world')
        expect( $( 'label#territory_world' ).html() ).toBe('World')
        

        
