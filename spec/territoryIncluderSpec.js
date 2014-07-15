// Generated by CoffeeScript 1.6.3
(function() {
  describe('TerritoryIncluder', function() {
    var options;
    options = {};
    beforeEach(function() {
      jQuery('body').append('<div id="fixtures"></div>');
      this.$element = $('#fixtures');
      return this.$element.territoryIncluder();
    });
    afterEach(function() {
      return jQuery('#fixtures').remove();
    });
    it("should add include/exclude buttons to each territory", function() {
      return this.$element.find('input').each(function(idx, inputEl) {
        expect($(inputEl).next().prop('class')).toEqual('exclude');
        return expect($(inputEl).next().next().prop('class')).toEqual('include');
      });
    });
    it("should give the territory container element the territory code as id", function() {
      return this.$element.find('input').each(function(idx, inputEl) {
        return expect($(inputEl).parent().prop('id')).toEqual($(inputEl).prop('id'));
      });
    });
    it("should add include/exclude classes to the territory's container element", function() {
      expect(this.$element.find('li#territory_nl').hasClass('included')).toBe(false);
      expect(this.$element.find('li#territory_nl').hasClass('excluded')).toBe(false);
      this.$element.find('li#territory_nl .include').trigger('click');
      expect(this.$element.find('li#territory_nl').hasClass('included')).toBe(true);
      expect(this.$element.find('li#territory_nl').hasClass('excluded')).toBe(false);
      this.$element.find('li#territory_nl .exclude').trigger('click');
      expect(this.$element.find('li#territory_nl').hasClass('included')).toBe(false);
      return expect(this.$element.find('li#territory_nl').hasClass('excluded')).toBe(true);
    });
    it("should include/exclude child territories recursively", function() {
      expect(this.$element.find('li.included').length).toBe(0);
      expect(this.$element.find('li.excluded').length).toBe(0);
      this.$element.find('li#territory_world > .exclude').trigger('click');
      expect(this.$element.find('li.excluded').length).toBe(252);
      expect(this.$element.find('li.included').length).toBe(0);
      this.$element.find('li#territory_world > .include').trigger('click');
      expect(this.$element.find('li.excluded').length).toBe(0);
      return expect(this.$element.find('li.included').length).toBe(252);
    });
    it("should provide a complete list of included/excluded territories", function() {
      expect(this.$element.territoryIncluder('all_included_territory_codes').length).toBe(0);
      expect(this.$element.territoryIncluder('all_excluded_territory_codes').length).toBe(0);
      this.$element.find('li#territory_fr > .include').trigger('click');
      expect(this.$element.territoryIncluder('all_included_territory_codes').length).toBe(1);
      expect(this.$element.territoryIncluder('all_included_territory_codes')[0]).toBe('fr');
      expect(this.$element.territoryIncluder('all_excluded_territory_codes').length).toBe(0);
      this.$element.find('li#territory_europe > .exclude').trigger('click');
      expect(this.$element.territoryIncluder('all_excluded_territory_codes').length).toBe(53);
      return expect(this.$element.territoryIncluder('all_included_territory_codes').length).toBe(0);
    });
    return it("should provide a non-recursive list included/excluded territories", function() {
      expect(this.$element.territoryIncluder('included_territory_codes').length).toBe(0);
      expect(this.$element.territoryIncluder('excluded_territory_codes').length).toBe(0);
      this.$element.find('li#territory_fr > .include').trigger('click');
      expect(this.$element.territoryIncluder('included_territory_codes')).toEqual(['fr']);
      expect(this.$element.territoryIncluder('excluded_territory_codes')).toEqual([]);
      this.$element.find('li#territory_europe > .exclude').trigger('click');
      expect(this.$element.territoryIncluder('excluded_territory_codes')).toEqual(['europe']);
      return expect(this.$element.territoryIncluder('included_territory_codes')).toEqual([]);
    });
  });

}).call(this);
