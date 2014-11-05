Meteor.publishComposite 'customerWithId', (customerId) ->
  return {
    find: -> Customer.find {_id: customerId}
    children: [
      find: (customer) -> Order.find {buyer: customerId}
    ]
  }