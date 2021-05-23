class Doctor

    @@all = []
    
    def self.all
        @@all
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select do |appt|
            appt.doctor == self
        end
    end

    def patients
        self.appointments.map {|appt| appt.patient}
    end
end
