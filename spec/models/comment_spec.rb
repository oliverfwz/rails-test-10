require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'association' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :parent }
    it { is_expected.to have_many :children }
  end
  
  context 'validations' do
    it { is_expected.to validate_presence_of :message }
  end
end