class Patient

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select do |appt|
            appt.patient == self
        end
    end

    def doctors
        self.appointments.map {|appt| appt.doctor}
    end
end
