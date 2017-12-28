connection: "flightstats"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: ontime {
  join: carriers {
    relationship: many_to_one
    sql_on: ${ontime.carrier} = ${carriers.code} ;;
  }
  join: origin_airport {
    from: airports
    relationship: many_to_one
    sql_on: ${ontime.origin} = ${origin_airport.code};;
  }
  join: destination_airport {
    from: airports
    relationship: many_to_one
    sql_on: ${ontime.destination} = ${destination_airport.code};;
  }
}
