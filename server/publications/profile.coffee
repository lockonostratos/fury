Meteor.publishComposite 'topProfiles', (profileId) ->
  return {
    find: -> Profile.find {}, {limit: 10}
    children: [
      find: (profile) -> Meteor.users.find {_id: profile.user}
    ]
  }