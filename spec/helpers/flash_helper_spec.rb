require 'rails_helper'

RSpec.describe FlashHelper, :type => :helper do
  describe '.flash_messages' do
    context 'as notice' do
      before { flash[:notice] = 'All your things are ok now!' }

      it { expect(flash_messages).to match('alert') }
      it { expect(flash_messages).to match('success') }
    end

    context 'as error' do
      before { flash[:alert] = 'All your things are ok now!' }

      it { expect(flash_messages).to match('alert') }
      it { expect(flash_messages).to match('error') }
    end

    context 'other else' do
      before { flash[:other] = 'All your things are ok now!' }

      it { expect(flash_messages).to match('alert') }
      it { expect(flash_messages).to match('info') }
    end
  end
end
