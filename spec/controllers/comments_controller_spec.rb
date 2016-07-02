require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe '#create' do
    let!(:user) { create :user }

    let(:params) { attributes_for(:comment) }
    before  { sign_in user }

    context 'Post' do
      it "save a comment" do
        coment = user.comments.build(params)
        expect{ coment.save }.to change(Comment, :count).by(1)
      end
    end
  end

  describe '#update' do
    def do_request
      patch :update, id: comment.id, comment: params, format: :js
    end

    let!(:user)    { create :user }
    let!(:comment) { create(:comment, user: user) }

    before  { sign_in user }

    context 'update success' do
      let!(:params) { attributes_for(:comment, message: 'ruby book edit') }

      it 'update a comment' do
        do_request
        expect(comment.reload.message).to eq 'ruby book edit'
      end
    end
  end

  describe '#destroy' do
    def do_request
      delete :destroy, id: comment.id, format: :js
    end

    let!(:user)    { create :user }
    let!(:comment) { create(:comment, user: user) }

    before  { sign_in user }

    it 'delete a comment' do
      expect{ do_request }.to change(Comment, :count).by(-1)
    end
  end
end