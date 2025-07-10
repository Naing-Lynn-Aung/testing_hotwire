require "faker"

30.times do
  Project.create(
    title: Faker::Book.title,
    content: Faker::Markdown.emphasis,
    start: Faker::Date.in_date_period,
    end: Faker::Date.in_date_period
  )
end
