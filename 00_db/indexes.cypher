// Commented Indexes Already Exists Because Of Uniqueness Contraints
// CREATE INDEX ON :Squad(name);
// CREATE INDEX ON :Focus(area);
// CREATE INDEX ON :Person(lanID);
CREATE INDEX ON :Person(firstName);
CREATE INDEX ON :Person(lastName);
CREATE INDEX ON :Location(city, country);
// CREATE INDEX ON :Chapter(shortName);
// CREATE INDEX ON :Chapter(name);
// CREATE INDEX ON :Skill(expertise);
// CREATE INDEX ON :Badge(name);
// CREATE INDEX ON :Tag(label);