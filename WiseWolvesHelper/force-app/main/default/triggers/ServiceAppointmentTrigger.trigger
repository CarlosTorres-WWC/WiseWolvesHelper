trigger ServiceAppointmentTrigger on ServiceAppointment(before update,after update) {
    new ServiceAppointmentTriggerHelper().process();   
}