require "rails_helper"

RSpec.describe OrderdetailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/orderdetails").to route_to("orderdetails#index")
    end

    it "routes to #new" do
      expect(get: "/orderdetails/new").to route_to("orderdetails#new")
    end

    it "routes to #show" do
      expect(get: "/orderdetails/1").to route_to("orderdetails#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/orderdetails/1/edit").to route_to("orderdetails#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/orderdetails").to route_to("orderdetails#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/orderdetails/1").to route_to("orderdetails#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/orderdetails/1").to route_to("orderdetails#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/orderdetails/1").to route_to("orderdetails#destroy", id: "1")
    end
  end
end
