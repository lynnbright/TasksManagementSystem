require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "title validation" do
    it "ensures title presence true" do
      task = build(:task, title: nil).save
      expect(task).to eq(false)
    end
  end

  describe "status validation" do
    it "ensures status presence true" do
      task = build(:task, status: nil).save
      expect(task).to eq(false)
    end

    context "valid entry" do
      ["ToDo", "Doing", "Done"].each do |valid_status|
        it "ensures status value including 'ToDo', 'Doing', 'Done'" do
          expect(build(:task, status: valid_status)).to be_valid
        end
      end
    end

    context "invalid entry" do
      it "is invalid without 'ToDo', 'Doing', 'Done'" do
        expect do
          task = build(:task, status: 'no status')
        end.to raise_error(ArgumentError, "'no status' is not a valid status")
      end
    end
  end

  describe "priority validation" do
    it "ensures priority presence true" do
      task = build(:task, priority: nil).save
      expect(task).to eq(false)
    end

    context "valid entry" do
      ["Low", "Mid", "High"].each do |valid_priority|
        it "ensures priority value including 'Low', 'Mid', 'High'" do
          expect(build(:task, priority: valid_priority)).to be_valid
        end
      end
    end

    context "invalid entry" do
      it "is invalid without 'Low', 'Mid', 'High'" do
        expect do
          task = build(:task, priority: 'no priority')
        end.to raise_error(ArgumentError, "'no priority' is not a valid priority")
      end
    end
  end

  describe "task duration valiation" do
    context "start_at and end_at validation" do
      it "ensures start_at and end_at presence true" do
        datetime_nil_obj = build(:task, start_at: nil, end_at: nil).save
        start_at_nil_obj = build(:task, start_at: nil).save
        end_at_nil_obj = build(:task, end_at: nil).save

        expect(datetime_nil_obj).to eq(false)
        expect(start_at_nil_obj).to eq(false)
        expect(end_at_nil_obj).to eq(false)
      end

      context "valid datetime" do
        it "ensures end_at datetime cannot be eariler than start_at datetime" do
          task = build(:task, start_at: "#{Time.now}", end_at: "#{Time.now + 1.day}").save
          expect(task).to eq(true)
        end
      end

      context "invalid datetime" do
        it "ensures end_at datetime cannot be eariler than start_at datetime" do
          task = build(:task, start_at: "#{Time.now}", end_at: "#{Time.now - 1.day}").save
          expect(task).to eq(false)
        end
      end
    end
  end
end
