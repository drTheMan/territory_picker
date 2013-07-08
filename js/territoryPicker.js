(function() {
  var TerritoryPicker;

  TerritoryPicker = (function() {
    TerritoryPicker.prototype.defaults = {
      territories: {
        africa: {
          label: 'Africa',
          territories: {
            dz: {
              label: 'Algeria'
            }
          }
        }
      }
    };

    function TerritoryPicker(container, options) {
      this.container = container;
      this.options = options;
      this.container.append(this.territory_options({
        world: {
          label: 'World'
        }
      }));
      this.container.append(this.territory_options(this.defaults.territories));
    }

    TerritoryPicker.prototype.territory_options = function(territories_data) {
      var result,
        _this = this;
      result = $('<ul class="territory_options"></ul>');
      $.each(territories_data, function(territory_code, territory_data) {
        var sub;
        result.append(_this.territory_option(territory_code, territory_data.label));
        if (territory_data.territories) {
          sub = $('<li></li>');
          sub.append(_this.territory_options(territory_data.territories));
          return result.append(sub);
        }
      });
      return result;
    };

    TerritoryPicker.prototype.territory_checkbox = function(territory_code, options) {
      return $('<input id="territory_' + territory_code + '" type="checkbox" name="territories[' + territory_code + ']" checked="checked" />');
    };

    TerritoryPicker.prototype.territory_label = function(territory_code, territory_label, options) {
      return $('<label id="territory_' + territory_code + '_name" for="territory_' + territory_code + '">' + territory_label + '</label>');
    };

    TerritoryPicker.prototype.territory_option = function(territory_code, territory_label, options) {
      var option;
      option = $('<li></li>');
      option.append(this.territory_checkbox(territory_code, options));
      option.append(this.territory_label(territory_code, territory_label, options));
      return option;
    };

    return TerritoryPicker;

  })();

  jQuery(function() {
    $.territoryPicker = function(element, options) {
      var state;
      state = '';
      this.settings = {};
      this.$element = $(element);
      this.setState = function(_state) {
        return state = _state;
      };
      this.getState = function() {
        return state;
      };
      this.getSetting = function(key) {
        return this.settings[key];
      };
      this.callSettingFunction = function(name, args) {
        if (args == null) {
          args = [];
        }
        return this.settings[name].apply(this, args);
      };
      this.$element = $(element);
      this.init = function() {
        this.settings = $.extend({}, this.defaults, options);
        this.territory_picker = new TerritoryPicker(this.$element, this.settings);
        return this.setState('ready');
      };
      this.init();
      return this;
    };
    $.territoryPicker.prototype.defaults = {
      message: 'Hello world'
    };
    return $.fn.territoryPicker = function(options) {
      return this.each(function() {
        var plugin;
        if ($(this).data('territoryPicker') === void 0) {
          plugin = new $.territoryPicker(this, options);
          return $(this).data('territoryPicker', plugin);
        }
      });
    };
  });

}).call(this);
