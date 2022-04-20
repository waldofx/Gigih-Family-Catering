require 'rails_helper'

describe OrderdetailsController do
  describe 'GET #index' do
    context 'without params[:letter]' do
      it "populates an array of all orderdetails" do 
        menuitem1 = create(:menuitem)
        customer1 = create(:customer)
        order1 = create(:order)
        order2 = create(:order)
        orderdetail1 = create(:orderdetail, menuitem_id: 1, order_id: 1, quantity: 1)
        orderdetail2 = create(:orderdetail, menuitem_id: 1, order_id: 2, quantity: 2)
        get :index
        expect(assigns(:orderdetails)).to match_array([orderdetail1, orderdetail2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    it "assigns the requested orderdetail to @orderdetail" do
      menuitem1 = create(:menuitem)
      customer1 = create(:customer)
      order1 = create(:order)
      orderdetail = create(:orderdetail)
      get :show, params: { id: orderdetail }
      expect(assigns(:orderdetail)).to eq orderdetail
    end

    it "renders the :show template" do
      menuitem1 = create(:menuitem)
      customer1 = create(:customer)
      order1 = create(:order)
      orderdetail = create(:orderdetail)
      get :show, params: { id: orderdetail }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Orderdetail to @orderdetail" do
      get :new
      expect(assigns(:orderdetail)).to be_a_new(Orderdetail)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested orderdetail to @orderdetail" do
      menuitem1 = create(:menuitem)
      customer1 = create(:customer)
      order1 = create(:order)
      orderdetail = create(:orderdetail)
      get :edit, params: { id: orderdetail }
      expect(assigns(:orderdetail)).to eq orderdetail
    end

    it "renders the :edit template" do
      menuitem1 = create(:menuitem)
      customer1 = create(:customer)
      order1 = create(:order)
      orderdetail = create(:orderdetail)
      get :edit, params: { id: orderdetail }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new orderdetail in the database" do
        menuitem1 = create(:menuitem)
        customer1 = create(:customer)
        order1 = create(:order)
        expect{
          post :create, params: { orderdetail: attributes_for(:orderdetail) }
        }.to change(Orderdetail, :count).by(1)
      end

      it "redirects to orderdetails#show" do
        menuitem1 = create(:menuitem)
        customer1 = create(:customer)
        order1 = create(:order)
        post :create, params: { orderdetail: attributes_for(:orderdetail) }
        expect(response).to redirect_to(orderdetail_path(assigns[:orderdetail]))
      end
    end

    context "with invalid attributes" do
      it "does not save the new orderdetail in the database" do
        expect{
          post :create, params: { orderdetail: attributes_for(:invalid_orderdetail) }
        }.not_to change(Orderdetail, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { orderdetail: attributes_for(:invalid_orderdetail) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @menuitem = create(:menuitem)
      @customer1 = create(:customer)
      @order = create(:order)
      @orderdetail = create(:orderdetail)
    end

    context "with valid attributes" do
        it "locates the requested @orderdetail" do
          patch :update, params: { id: @orderdetail, orderdetail: attributes_for(:orderdetail) }
          expect(assigns(:orderdetail)).to eq @orderdetail
        end
  
        it "changes @orderdetail's attributes" do
          patch :update, params: { id: @orderdetail, orderdetail: attributes_for(:orderdetail, quantity: 2) }
          @orderdetail.reload
          expect(@orderdetail.quantity).to eq(2)
        end
  
        it "redirects to the orderdetail" do
          patch :update, params: { id: @orderdetail, orderdetail: attributes_for(:orderdetail) }
          expect(response).to redirect_to @orderdetail
        end
      end

    context 'with invalid attributes' do
      it 'does not save the updated orderdetail in the database' do
        patch :update, params: { id: @orderdetail, orderdetail: attributes_for(:invalid_orderdetail, quantity: 2) }
        expect(@orderdetail.quantity).not_to eq(2)
      end

      it 're-renders the edit template' do
        patch :update, params: { id: @orderdetail, orderdetail: attributes_for(:invalid_orderdetail) }
        expect(assigns(:orderdetail)).to eq @orderdetail
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @menuitem = create(:menuitem)
      @customer1 = create(:customer)
      @order = create(:order)
      @orderdetail = create(:orderdetail)
    end

    it "deletes the orderdetail from the database" do
      expect{
        delete :destroy, params: { id: @orderdetail }
      }.to change(Orderdetail, :count).by(-1)
    end

    it "redirects to orderdetails#index" do
      delete :destroy, params: { id: @orderdetail }
      expect(response).to redirect_to orderdetails_url
    end
  end
end