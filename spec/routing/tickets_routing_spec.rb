RSpec.describe "Tickets", type: :routing do
  it "routes from root to tickets#index by default" do
    expect(get: "/").to route_to(
      controller: "tickets",
      action: "index"
    )
  end

  context "tickets" do
    it "routes to GET /tickets" do
      expect(get: "/tickets").to be_routable
    end

    it "routes to POST /tickets" do
      expect(post: "/tickets").to be_routable
    end

    it "routes to GET /tickets/1" do
      expect(get: "/tickets/1").to be_routable
    end
  end
end
