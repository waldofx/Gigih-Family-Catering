require 'rails_helper'

describe ReportsController do
  describe 'GET #index' do
    context 'without params[:letter]' do
      it "populates an array of all reports" do 
        customer1 = create(:customer)
        customer2 = create(:customer)
        order1 = create(:order, customer_id: 1, total: 95000.0, order_date: Time.now, status: 'NEW')
        order2 = create(:order, customer_id: 2, total: 95000.0, order_date: Time.now, status: 'NEW')
        get :index
        expect(assigns(:reports)).to match_array([order1, order2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

end