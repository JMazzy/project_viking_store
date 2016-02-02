class DashboardsController < ApplicationController
  def index
    @num_total_users = User.total_users
    @num_total_products = Product.total_products_listed
    @num_total_orders = Order.total_orders_submitted
    @total_revenue = Order.total_revenue_generated

    @users_30 = User.new_users_in_last_n_days( 30 )
    @orders_30 = Order.num_orders_submitted_in_last_n_days( 30 )
    @products_30 = Product.total_products_in_last_n_days( 30 )
    @revenue_30 = Order.revenue_n_days( 30 )

    @users_7 = User.new_users_in_last_n_days( 7 )
    @orders_7 = Order.num_orders_submitted_in_last_n_days( 7 )
    @products_7 = Product.total_products_in_last_n_days( 7 )
    @revenue_7 = Order.revenue_n_days( 7 )

    @top_states = User.top_states
    @top_cities = User.top_cities

    @user_highest_single_order = User.highest_single_order
    @user_highest_lifetime_value = User.highest_lifetime_value
    @user_highest_average_value = User.highest_average_value
    @user_most_orders = User.user_most_orders

    @average_order_value = Order.largest_order[0].largest_order
    @highest_single_order = Order.average_order[0].average_order

    @average_order_value_7 = Order.largest_order_last_n_days(7)[0].largest_order
    @highest_single_order_7 = Order.average_order_last_n_days(7)[0].average_order

    @average_order_value_30 = Order.largest_order_last_n_days(30)[0].largest_order
    @highest_single_order_30 = Order.average_order_last_n_days(30)[0].average_order


    ####### last week 

    @revenue_last_week = {}
    @num_orders_last_week = {}
    @dates_last_week = {}


    (0..6).each do |days_ago|
      @revenue_last_week[  days_ago ] = Order.revenue_n_days_ago( days_ago )
      @num_orders_last_week[  days_ago ] = Order.num_orders_n_days_ago( days_ago )
      @dates_last_week[  days_ago ] = ( DateTime.now - days_ago ).to_s[0..9]
    end



    #######




  end
end

# There is a table for total order stats
# field: Number of orders
# field: Revenue generated
# field: Average order value
# field: Largest order value
