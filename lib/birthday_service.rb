class BirthdayService

  def initialize(employee_repository, email_service)
    @employee_repository = employee_repository
    @email_service = email_service
  end
  def send_greetings(date_today) 
    employees = @employee_repository.get_employees_with_birthdays(date_today)
    @email_service.send_messages(employees)
  end
end
