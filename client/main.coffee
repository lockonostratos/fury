currentIndex = 0
colors = [
  '#54c8eb', # light blue
  '#4ea9de', # med blue
  '#4b97d2', # dark blue
  '#92cc8f', # light green
  '#41bb98', # mint green
  '#c9de83', # yellowish green
  '#dee569', # yellowisher green
  '#c891c0', # light purple
  '#9464a8', # med purple
  '#7755a1', # dark purple
  '#f069a1', # light pink
  '#f05884', # med pink
  '#e7457b', # dark pink
  '#ffd47e', # peach
  '#f69078'  # salmon
]

animateBackgroundColor = ->
  console.log 'animating...'
  $("body").css("background-color", colors[currentIndex])
  currentIndex++
  currentIndex = 0 if currentIndex > colors.length

Session.setDefault("counter", 0)

Template.hello.helpers
  counter: -> Session.get("counter")
  profiles: -> Profile.find {}
  users: -> Meteor.users.find {}
  customers: -> Customer.find {}
  orders: -> Order.find {}

Template.hello.events
  'click button': -> Session.set("counter", Session.get("counter") + 1)

Template.hello.rendered = ->
  Meteor.setTimeout ->
    animateBackgroundColor()
    Meteor.setInterval(animateBackgroundColor, 15000)
  , 1000

