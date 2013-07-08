(function() {
  var TerritoryPicker;

  TerritoryPicker = (function() {
    function TerritoryPicker(container, options) {
      this.container = container;
      this.options = options;
      this.append_world_option();
      this.world_option().prop('checked', true);
    }

    TerritoryPicker.prototype.append_world_option = function() {
      return this.container.append(this.world_option());
    };

    TerritoryPicker.prototype.world_option = function() {
      if (!this.$world_option) {
        this.$world_option = $('<input class="world" type="checkbox" />');
      }
      return this.$world_option;
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
