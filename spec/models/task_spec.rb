require 'rails_helper'

RSpec.describe Task, type: :model do
  let!(:task) { Task.new }

  context 'validation' do
    it '- is not valid without a name' do
      task.name = nil

      expect(task).to_not be_valid
    end
  end
end
