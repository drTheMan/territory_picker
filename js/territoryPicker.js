(function() {
  var TerritoryPicker;

  TerritoryPicker = (function() {
    function TerritoryPicker(container, options) {
      this.container = container;
      this.options = options;
      this.container.append(this.territory_option('world', 'World'));
      this.container.append(this.territory_options());
    }

    TerritoryPicker.prototype.territory_options = function() {
      var africa_group;
      if (!this.$territory_options) {
        this.$territory_options = $('<ul class="territory_groups"></ul>');
        africa_group = $('<li id="territory_group_africa"></li>');
        africa_group.append(this.territory_option('africa', 'Africa'));
        this.$territory_options.append(africa_group);
      }
      return this.$territory_options;
    };

    TerritoryPicker.prototype.territory_checkbox = function(territory_code, options) {
      return $('<input id="territory_' + territory_code + '" type="checkbox" name="territories[' + territory_code + ']" checked="checked" />');
    };

    TerritoryPicker.prototype.territory_label = function(territory_code, territory_label, options) {
      return $('<label id="territory_' + territory_code + '_name" for="territory_' + territory_code + '">' + territory_label + '</label>');
    };

    TerritoryPicker.prototype.territory_option = function(territory_code, territory_label, options) {
      var option;
      option = $('<div class="territory_option"></div>');
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
