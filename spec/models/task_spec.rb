require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do
    it "should assign all tasks to @tasks" do
        task = Task.create({title:'寫測試', 
                         description:'寫新增任務測試', 
                         status: '待處理',
                         priority: '高',
                         start_at: '2020-06-25 00:44:00',
                         end_at: '2020-06-26 00:44:00',
                         deleted_at: nil
                        })
        get :index
        expect(assigns(:tasks)).to eq [task]
    end

    it "should render the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
