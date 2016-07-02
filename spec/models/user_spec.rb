require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }

    it do
      is_expected.to validate_attachment_content_type(:avatar)
        .allowing('image/png', 'image/gif')
        .rejecting('text/plain', 'text/xml')
    end

    it do
      is_expected.to validate_attachment_size(:avatar)
        .less_than(5.megabytes)
    end
  end
end
