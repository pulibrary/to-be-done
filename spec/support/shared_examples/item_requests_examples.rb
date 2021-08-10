# frozen_string_literal: true
RSpec.shared_examples "renders :index template" do |item_types|
  item_types.each do |item_type|
    it "renders :index template for #{item_type} item" do
      get polymorphic_path([user, item_type.to_s.pluralize.to_sym])

      expect(response).to render_template :index
    end
  end
end

RSpec.shared_examples "renders :show template" do |item_types|
  item_types.each do |item_type|
    it "renders :show template for #{item_type} item" do
      get polymorphic_path([user, create(item_type, user: user)])

      expect(response).to render_template :show
    end
  end
end

RSpec.shared_examples "renders :new template" do |item_types|
  item_types.each do |item_type|
    it "renders :new template for #{item_type} item" do
      get new_polymorphic_path([user, item_type])

      expect(response).to render_template :new
      expect(response).to render_template(partial: "_form")
    end
  end
end

RSpec.shared_examples "creates item" do |item_types|
  item_types.each do |item_type|
    it "redirects to item's page on successful #{item_type} item creation" do
      post polymorphic_path([user, item_type.to_s.pluralize.to_sym]),
        params: { item: attributes_for(item_type) }

      expect(response).to redirect_to polymorphic_path([user, user.items.last])
    end

    it "re-renders :new template on unsuccessful #{item_type} item creation" do
      post polymorphic_path([user, item_type.to_s.pluralize.to_sym]),
        params: { item: attributes_for(item_type, status: "") }

      expect(response).to render_template :new
    end
  end
end

RSpec.shared_examples "renders :edit template" do |item_types|
  item_types.each do |item_type|
    it "renders :edit template for #{item_type} item" do
      item = create(item_type, user: user)
      get edit_polymorphic_path([user, item])

      expect(response).to render_template :edit
      expect(response).to render_template(partial: "_form")
    end
  end
end

RSpec.shared_examples "updates item" do |item_types|
  item_types.each do |item_type|
    it "redirects to item's page on successful #{item_type} item update" do
      item = create(item_type, user: user)
      put polymorphic_path([user, item]),
        params: { item: attributes_for(item_type, status: "In Progress") }

      expect(response).to redirect_to polymorphic_path([user, user.items.last])
    end

    it "re-renders :edit template on unsuccessful #{item_type} item update" do
      item = create(item_type, user: user)
      put polymorphic_path([user, item]),
        params: { item: attributes_for(item_type, status: " ") }

      expect(response).to render_template :edit
    end
  end
end

RSpec.shared_examples "deletes item" do |item_types|
  item_types.each do |item_type|
    it "redirects to #{item_type} page after deleting #{item_type} item" do
      item = create(item_type, user: user)
      delete polymorphic_path([user, item])

      expect(user.items).not_to include item
      expect(response).to redirect_to polymorphic_path([user, item_type.to_s.pluralize.to_sym])
    end
  end
end
