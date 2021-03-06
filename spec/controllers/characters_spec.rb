require "rails_helper"

describe CharactersController do
  let(:json_headers) { { "Content-Type" => "application/json", "Accept" => "application/json" } }
  let(:index_pattern) do
    {
      characters: [
        {
          id: Integer,
          name: String,
          race: String,
          profession: String
        }
      ]
    }
  end

  let(:show_pattern) do
    {
      character: Hash
    }
  end

  describe "#index" do
    context "valid requests" do
      it "should show all caharcters" do
        create(:character)
        get :index
        expect(JSON.parse(response.body).deep_symbolize_keys).to match_json_expression(index_pattern)
      end
    end
  end

  describe "#show" do
    context "valid requests" do
      it "should show a single character" do
        char = create(:character, name: "Ottokar")
        get :show, id: char.id
        expect(Character.count).to eq(1)
        expect(JSON.parse(response.body).deep_symbolize_keys).to match_json_expression(show_pattern)
      end
    end
  end
end
