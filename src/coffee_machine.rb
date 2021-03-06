class CoffeeMachine
  attr_reader :coffee_served, :started

  def initialize
    @started = false

    # Yes it's a magic machine :)
    descale()
    fill_tank()
    fill_beans()
    empty_grounds()

    @coffee_served = false

    @water_hardness = 2
    @grinder = "medium"
    @settings_displayed = false
  end

  def start(lang = 'en')
    @started = true
    @lang = lang.to_sym
  end

  def stop
    @started = false
  end

  def messages
    i18n = {
      en: {
        tank: 'Fill tank',
        beans: 'Fill beans',
        grounds: 'Empty grounds',
        ready: 'Ready',
        settings: "Settings:\n - 1: water hardness\n - 2: grinder",
        descale: "Descaling is needed"
      },
      fr: {
        tank: 'Remplir reservoir',
        beans: 'Ajouter grains',
        grounds: 'Vider marc',
        ready: 'Pret',
        settings: "Settings:\n - 1: durete de l'eau\n - 2: mouture",
        descale: "Detartrage requis"
      }
    }
    return i18n[@lang]
  end

  def message
    return '' unless @started

    return messages[:settings] if @settings_displayed
    return messages[:tank] if @tank_content <= 10
    return messages[:beans] if @beans_content < 3
    return messages[:grounds] if @grounds_content >= 30
    return messages[:descale] if is_descaling_needed?
    return messages[:ready]
  end

  def show_settings
    @settings_displayed = true
  end

  def quit_settings
    @settings_displayed = false
  end

  def get_settings
    {
      'water hardness' => @water_hardness,
      'grinder' => @grinder
    }
  end

  def take_coffee
    if (@tank_content == 0 || @beans_content == 0)
      @coffee_served = false
    else
      @coffee_served = true
      @tank_content -= 1
      @beans_content -= 1
      @grounds_content += 1
      @countdown_to_descale -= 1
    end
  end

  def fill_tank
    @tank_content = 60
  end

  def fill_beans
    @beans_content = 40
  end

  def empty_grounds
    @grounds_content = 0
  end

  def descale
    @countdown_to_descale = 500
  end

  def is_descaling_needed?
    @countdown_to_descale <= 0
  end
end
