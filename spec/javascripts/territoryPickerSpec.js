(function() {
  describe('TerritoryPicker', function() {
    var options;
    options = {
      message: 'Hello World'
    };
    beforeEach(function() {
      loadFixtures('fragment.html');
      return this.$element = $('#fixtures');
    });
    describe('plugin behavior', function() {
      it('should be available on the jQuery object', function() {
        return expect($.fn.territoryPicker).toBeDefined();
      });
      it('should be chainable', function() {
        return expect(this.$element.territoryPicker()).toBe(this.$element);
      });
      it('should offers default values', function() {
        var plugin;
        plugin = new $.territoryPicker(this.$element);
        return expect(plugin.defaults).toBeDefined();
      });
      return it('should overwrites the settings', function() {
        var plugin;
        plugin = new $.territoryPicker(this.$element, options);
        return expect(plugin.settings.message).toBe(options.message);
      });
    });
    describe('plugin state', function() {
      beforeEach(function() {
        return this.plugin = new $.territoryPicker(this.$element);
      });
      it('should have a ready state', function() {
        return expect(this.plugin.getState()).toBe('ready');
      });
      return it('should be updatable', function() {
        this.plugin.setState('new state');
        return expect(this.plugin.getState()).toBe('new state');
      });
    });
    return describe('initialization', function() {
      describe('worldwide option', function() {
        beforeEach(function() {
          return new $.territoryPicker(this.$element);
        });
        it('should generate a \'worldwide?\' checkbox', function() {
          expect($('input#territory_world')).toExist();
          expect($('input#territory_world').prop('type')).toBe('checkbox');
          expect($('input#territory_world').prop('name')).toBe('territories[world]');
          return expect($('input#territory_world')).toBeChecked();
        });
        return it('should generate a \'worldwide\' label', function() {
          expect($('label#territory_world_name')).toExist();
          expect($('label#territory_world_name').prop('for')).toBe('territory_world');
          return expect($('label#territory_world_name').html()).toBe('World');
        });
      });
      return describe('default territory options', function() {
        beforeEach(function() {
          return new $.territoryPicker(this.$element);
        });
        return it('should generate the Africa territory group', function() {
          var africa_group;
          expect(africa_group = $('li#territory_group_africa')).toExist();
          expect(africa_group.find('input[name="territories[africa]"]')).toBeChecked();
          return expect(africa_group.find('label[for="territory_africa"]').html()).toBe('Africa');
        });
      });
    });
  });

}).call(this);
