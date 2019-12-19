require "rails_helper"

RSpec.describe SupplierLeadMessageMailer, type: :mailer do
  describe "email" do
    let(:mail) { SupplierLeadMessageMailer.email }

    it "renders the headers" do
      expect(mail.subject).to eq("Email")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
