# Facts the pages share. Change them here, not in the templates.
# Every claim here has to be true today (kickoff doc §2).
module Site
  NAME          = "Culture Studio"
  TITLE         = "Culture Studio — by Crafty Machine"
  URL           = "https://craftymachine.com"
  CONTACT_EMAIL = "hello@craftymachine.com"
  COMPANY       = "Crafty Machine LLC"
  PRINCIPAL     = "Sean Corbett"

  FIELDS = ["Software and Technology", "Hospitality", "Community Organizing"]

  # Live apps of the ecosystem, in the order the Work page shows them.
  # url: nil means there's no public link (the name shows without one).
  APPS = [
    { name: "Trellis", url: "https://visittrellis.com", host: "visittrellis.com",
      summary: "A customizable platform for community organizations: the people, partners, places and events of a network, with tools shaped around its work." },
    { name: "Nightly Keep", url: "https://app.nightlykeep.com", host: "app.nightlykeep.com",
      summary: "Cash flow for short-term-rental businesses." },
    { name: "What Where When", url: "https://whatwherewhen.lakesoffire.org", host: "whatwherewhen.lakesoffire.org",
      summary: "Event listings for Lakes of Fire, a regional burn." },
    { name: "Word game solver", url: nil,
      summary: "A helper for Scrabble-like word games." },
  ]

  # Past products, newest first. Years are left off until confirmed.
  PAST = [
    { name: "HaveMyShift", role: "Founder",
      summary: "Shift swapping for hourly workers: more hours, more time off, and cover when emergencies happen. " \
               "Went through Techstars Boston. Over 10,000 shifts swapped." },
    { name: "Fresh Metrix", role: "Founder",
      summary: "SEO tooling. The first version was built in weeks, in Medellín, Colombia, " \
               "to test the market before spending more." },
  ]
end
