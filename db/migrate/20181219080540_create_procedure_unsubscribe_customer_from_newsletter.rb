class CreateProcedureUnsubscribeCustomerFromNewsletter < ActiveRecord::Migration[5.2]
  def change
    reversible do |change|
      change.up do
        execute <<-SQL
          CREATE FUNCTION unsubscribe_customer_from_newsletter(_customer_id bigint, _newsletter_id bigint)
          RETURNS void
          LANGUAGE SQL
          AS $$
          UPDATE signups SET active = FALSE
            WHERE customer_id = _customer_id AND newsletter_id = _newsletter_id
          $$;
        SQL
      end

      change.down do
        execute %Q{ DROP FUNCTION IF EXISTS unsubscribe_customer_from_newsletter; }
      end
    end
  end
end
