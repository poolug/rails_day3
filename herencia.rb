class Appointment
    attr_reader :location, :purpose, :hour, :min 
    def initialize(location, purpose, hour, min)
        valid_location_purpose(location, purpose)
        valid_hour_min(hour, min)
    end
    def valid_location_purpose(location, purpose)
        @location = location
        @purpose = purpose
        if location.class != String || purpose.class != String
            raise "Debes insertar solo texto para localidad y propuesta"
        end
    end
    def valid_hour_min(hour, min)
        @hour = hour
        @min = min
        if hour.class != Integer || min.class != Integer
            raise "Debes insertar sólo números para hora y min"
        end
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location, purpose, hour, min, day)
        super(location, purpose, hour, min)
        valid_day(day)
    end

    def valid_day(day)
        @day = day
        if day.class != Integer
            raise "Debes insertar sólo números para el día"
        end
    end

    def occurs_on?(day)
        self.day == day
    end

    def to_s
        "Reunion mensual en #{self.location} sobre #{self.purpose} el día #{self.day} a la(s) #{self.hour}:#{self.min}" 
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour, min)
        self.hour == hour && self.min == min
    end

    def to_s
        "Reunion diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}" 
    end
end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location, purpose, hour, min)
        valid_date(day, month ,year)
    end

    def valid_date(day, month ,year)
        @year = year
        @month = month
        @day = day
        if day.class != Integer || month.class != Integer || year.class != Integer
            raise "Debes insertar sólo números para el día, mes y año"
        end
    end

    def occurs_on?(day, month, year)
        self.day == day && self.month == month && self.year == year
    end

    def to_s
        "Reunion única en #{self.location} sobre #{self.purpose} el #{day}/#{month}/#{year} a la(s) #{self.hour}:#{self.min}" 
    end
end

puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)

