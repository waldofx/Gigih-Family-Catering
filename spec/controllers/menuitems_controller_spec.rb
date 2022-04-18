require 'rails_helper'

describe MenuitemsController do
  describe 'GET #index' do
    context 'without params[:letter]' do
      it "populates an array of all menuitems" do 
        menuitem1 = create(:menuitem, name: "Nasi Uduk")
        menuitem2 = create(:menuitem, name: "Kelar Telor")
        get :index
        expect(assigns(:menuitems)).to match_array([menuitem1, menuitem2])
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    it "assigns the requested menuitem to @menuitem" do
      menuitem = create(:menuitem)
      get :show, params: { id: menuitem }
      expect(assigns(:menuitem)).to eq menuitem
    end

    it "renders the :show template" do
      menuitem = create(:menuitem)
      get :show, params: { id: menuitem }
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new Menuitem to @menuitem" do
      get :new
      expect(assigns(:menuitem)).to be_a_new(Menuitem)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested menuitem to @menuitem" do
      menuitem = create(:menuitem)
      get :edit, params: { id: menuitem }
      expect(assigns(:menuitem)).to eq menuitem
    end

    it "renders the :edit template" do
      menuitem = create(:menuitem)
      get :edit, params: { id: menuitem }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new menuitem in the database" do
        expect{
          post :create, params: { menuitem: attributes_for(:menuitem) }
        }.to change(Menuitem, :count).by(1)
      end

      it "redirects to menuitems#show" do
        post :create, params: { menuitem: attributes_for(:menuitem) }
        expect(response).to redirect_to(menuitem_path(assigns[:menuitem]))
      end
    end

    context "with invalid attributes" do
      it "does not save the new menuitem in the database" do
        expect{
          post :create, params: { menuitem: attributes_for(:invalid_menuitem) }
        }.not_to change(Menuitem, :count)
      end

      it "re-renders the :new template" do
        post :create, params: { menuitem: attributes_for(:invalid_menuitem) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @menuitem = create(:menuitem)
    end

    context "with valid attributes" do
        it "locates the requested @menuitem" do
          patch :update, params: { id: @menuitem, menuitem: attributes_for(:menuitem) }
          expect(assigns(:menuitem)).to eq @menuitem
        end
  
        it "changes @menuitem's attributes" do
          patch :update, params: { id: @menuitem, menuitem: attributes_for(:menuitem, name: 'Nasi Uduk') }
          @menuitem.reload
          expect(@menuitem.name).to eq('Nasi Uduk')
        end
  
        it "redirects to the menuitem" do
          patch :update, params: { id: @menuitem, menuitem: attributes_for(:menuitem) }
          expect(response).to redirect_to @menuitem
        end
      end

    context 'with invalid attributes' do
      it 'does not save the updated menuitem in the database' do
        patch :update, params: { id: @menuitem, menuitem: attributes_for(:invalid_menuitem, name: 'Nasi Uduk 2', price: "Test") }
        expect(@menuitem.name).not_to eq('Nasi Uduk 2')
      end

      it 're-renders the edit template' do
        patch :update, params: { id: @menuitem, menuitem: attributes_for(:invalid_menuitem) }
        expect(assigns(:menuitem)).to eq @menuitem
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @menuitem = create(:menuitem)
    end

    it "deletes the menuitem from the database" do
      expect{
        delete :destroy, params: { id: @menuitem }
      }.to change(Menuitem, :count).by(-1)
    end

    it "redirects to menuitems#index" do
      delete :destroy, params: { id: @menuitem }
      expect(response).to redirect_to menuitems_url
    end
  end
end