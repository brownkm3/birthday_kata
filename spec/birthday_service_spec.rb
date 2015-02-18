require "spec_helper"
require "birthday_service"

describe BirthdayService do
  it "sends greetings to employees" do
    employee_repository = double :repository
    email_service = double :email_service
    employee_list = [] #an array of emplyee objects I'm not sure how to define
    date_today = double :date
    subject = BirthdayService.new(employee_repository, email_service)

    allow(employee_repository).to receive(:get_employees_with_birthdays).with(date_today).and_return employee_list
    expect(email_service).to receive(:send_messages).with(employee_list)
    subject.send_greetings(date_today)
  end
end
