module NetSuite
  module Records
    class Solution
      include Support::Fields
      include Support::RecordRefs
      include Support::Records
      include Support::Actions
      include Namespaces::TranInvt

      actions :get, :add, :initialize, :delete, :update, :upsert, :upsert_list, :search

      fields :title, :solution_code, :description, :status, :created_date, :last_modifiedDate, :display_online

      field :custom_field_list, CustomFieldList
      
      # field :item_list,         WorkOrderItemList

      # record_refs :assembly_item, :created_from, :custom_form,
      #   :department, :entity, :job, :location, :manufacturing_routing,
      #   :revision, :subsidiary, :units

      attr_reader :internal_id
      attr_accessor :external_id
      attr_accessor :search_joins

      def initialize(attributes = {})
        @internal_id = attributes.delete(:internal_id) || attributes.delete(:@internal_id)
        @external_id = attributes.delete(:external_id) || attributes.delete(:@external_id)
        initialize_from_attributes_hash(attributes)
      end

      def self.search_class_name
        "Solution"
      end

      def self.search_class_namespace
        "listSupport"
      end
    end
  end
end
