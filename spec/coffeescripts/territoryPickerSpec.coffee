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
      it 'should generate a \'worldwide?\' checkbox', ->
        new $.territoryPicker( @$element )            

        expect( $( 'input.world[type="checkbox"]' ) ).toExist()

      it 'should check the worldwide option by default', ->
        new $.territoryPicker( @$element )            

        expect( $( 'input.world' ) ).toBeChecked()
        

        
