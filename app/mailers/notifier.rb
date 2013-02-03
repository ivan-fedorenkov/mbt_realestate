class Notifier < ActionMailer::Base
  default from: "mbt@gmail.com"

  def new_lot_question(lot, lot_question)
    @lot = lot
    @lot_question = lot_question

    mail(:to => Rails.configuration.admin_email,
      :subject => "[mbt-realestate] New user question")
  end
end
