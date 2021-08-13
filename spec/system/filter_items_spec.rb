# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Filter item type", type: :system do
  ITEM_STATUSES = ["Ready to Start", "In Progress", "Paused", "Finished"].freeze

  ["/", "/users/1/books", "/users/1/tv_shows", "/users/1/movies", "/users/1/music"].each do |url|
    describe url.to_s do
      let(:user) { create(:user_with_items) }
      before do
        sign_in user
        visit url
      end

      it "persists checkbox status after form submission" do
        check "In Progress"
        expect(page.find("input#in-progress")).to be_checked

        click_on "Filter"

        expect(page.find("input#in-progress")).to be_checked
      end

      it "displays all items when no filters checked" do
        ITEM_STATUSES.each { |status| expect(page).to have_css("span", text: status) }
      end

      context "with one filter checked" do
        ITEM_STATUSES.each do |status|
          it "displays all '#{status}' items" do
            check status

            click_on "Filter"

            # check that the chosen status IS on the page
            expect(page).to have_css("span", text: status)

            # check that all other statuses are NOT on the page
            (ITEM_STATUSES - [status]).each do |unchecked_status|
              expect(page).not_to have_css("span", text: unchecked_status)
            end
          end
        end
      end

      context "with more than one filter checked" do
        it "displays corresponding statuses" do
          statuses = ["Ready to Start", "In Progress"]
          statuses.each { |status| check status }

          click_on "Filter"

          statuses.each { |status| expect(page).to have_css("span", text: status) }
          (ITEM_STATUSES - statuses).each do |unchecked_status|
            expect(page).not_to have_css("span", text: unchecked_status)
          end
        end

        it "displays all statuses when all filters checked" do
          ITEM_STATUSES.each { |status| check status }

          click_on "Filter"

          ITEM_STATUSES.each do |status|
            expect(page).to have_css("span", text: status)
          end
        end
      end
    end
  end
end
