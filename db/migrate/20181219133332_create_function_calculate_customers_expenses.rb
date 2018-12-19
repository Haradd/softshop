class CreateFunctionCalculateCustomersExpenses < ActiveRecord::Migration[5.2]
  def change
    reversible do |change|
      change.up do
        execute <<-SQL
          CREATE FUNCTION calculate_customers_expenses(_customer_id bigint)
          RETURNS numeric
          LANGUAGE SQL
          AS $$
          SELECT SUM(sum_price) FROM (
            SELECT sum_price FROM orders JOIN (
                SELECT SUM(price) AS sum_price, order_id FROM orders_products GROUP BY order_id
                ) AS op ON orders.id = op.order_id
            WHERE orders.customer_id = _customer_id
          ) as o
          $$;
        SQL
      end

      change.down do
        execute %Q{ DROP FUNCTION IF EXISTS calculate_customers_expenses; }
      end
    end
  end
end
